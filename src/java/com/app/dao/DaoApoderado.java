package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Apoderado;
import com.app.dto.Parentesco;
import com.app.dto.TipoDoc;
import com.app.dto.Usuario;
import com.app.interfaces.IMantenimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoApoderado implements IMantenimiento {

    private final static Logger LOGGER = Logger.getLogger(DaoApoderado.class.getName());

    @Override
    public List<?> getAll() {
        List<Apoderado> listApoderados = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT p.IDPERSONA,p.NOMBRES,p.APELLIDOS,p.NRODOC,"
                    + " p.TELEFONO,p.CORREO,a.IDAPODERADO,a.IDPARENTESCO,pa.PARENTESCO,"
                    + " p.IDTIPODOC,t.TIPO,a.IDUSUARIO"
                    + " FROM apoderado a INNER JOIN persona p INNER JOIN parentesco pa "
                    + " INNER JOIN tipodoc t INNER JOIN usuario u"
                    + " where a.IDPERSONA=p.IDPERSONA AND a.IDPARENTESCO=pa.IDPARENTESCO"
                    + " AND p.IDTIPODOC=t.IDTIPODOC AND u.IDUSUARIO=a.IDUSUARIO ORDER BY a.IDAPODERADO";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Apoderado u = new Apoderado();
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setIdApo(rs.getInt("a.IDAPODERADO"));
                u.setParentesco(new Parentesco(rs.getInt("a.IDPARENTESCO"), rs.getString("pa.PARENTESCO")));
                u.setTipodoc(new TipoDoc(rs.getInt("p.IDTIPODOC"), rs.getString("t.TIPO")));
                //Solo para un usuario
                Usuario usua = (Usuario) new DaoUsuario().getFindId(rs.getInt("a.IDUSUARIO"));
                List<Usuario> usuarios = new ArrayList<>();
                usuarios.add(usua);
                u.setUsuarios(usuarios);
                //***************************
                listApoderados.add(u);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return listApoderados;
    }

    @Override
    public Object getFindId(int id) {
        Apoderado u = new Apoderado();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT p.IDPERSONA,p.NOMBRES,p.APELLIDOS,p.NRODOC,"
                    + " p.TELEFONO,p.CORREO,a.IDAPODERADO,a.IDPARENTESCO,pa.PARENTESCO,"
                    + " p.IDTIPODOC,t.TIPO,a.IDUSUARIO"
                    + " FROM apoderado a INNER JOIN persona p INNER JOIN parentesco pa "
                    + " INNER JOIN tipodoc t INNER JOIN usuario u"
                    + " where a.IDPERSONA=p.IDPERSONA AND a.IDPARENTESCO=pa.IDPARENTESCO"
                    + " AND p.IDTIPODOC=t.IDTIPODOC AND u.IDUSUARIO=a.IDUSUARIO and a.IDAPODERADO=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setIdApo(rs.getInt("a.IDAPODERADO"));
                u.setParentesco(new Parentesco(rs.getInt("a.IDPARENTESCO"), rs.getString("pa.PARENTESCO")));
                u.setTipodoc(new TipoDoc(rs.getInt("p.IDTIPODOC"), rs.getString("t.TIPO")));
                //Solo para un usuario
                Usuario usua = (Usuario) new DaoUsuario().getFindId(rs.getInt("a.IDUSUARIO"));
                List<Usuario> usuarios = new ArrayList<>();
                usuarios.add(usua);
                u.setUsuarios(usuarios);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            LOGGER.log(Level.INFO, "Mensaje!");
        }
        return u;
    }

    @Override
    public int add(Object u) {
        Apoderado us = (Apoderado) u;
        int r = 0;
        Connection con = Conexion.getConnection();
        String sql;
        PreparedStatement ps;
        int idPersona;
        try {
            sql = "INSERT INTO persona (IDTIPODOC,NRODOC, NOMBRES, APELLIDOS, TELEFONO, CORREO) VALUES(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getTipodoc().getId());
            ps.setString(2, us.getNrodoc());
            ps.setString(3, us.getNombres());
            ps.setString(4, us.getApellidos());
            ps.setString(5, us.getTelefono());
            ps.setString(6, us.getCorreo());
            ps.executeUpdate();

            sql = "SELECT @@IDENTITY AS IDPERSONA";
            try (ResultSet rs = ps.executeQuery(sql)) {
                rs.next();
                idPersona = rs.getInt("IDPERSONA");
            }
            sql = "INSERT INTO apoderado (IDPARENTESCO,IDPERSONA,IDUSUARIO) VALUES(?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getParentesco().getId());
            ps.setInt(2, idPersona);
            ps.setInt(3, us.getUsuarios().get(0).getIdUser());
            r = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return r;
    }

    @Override
    public int update(Object u) {
        Apoderado us = (Apoderado) u;
        int r = 0;
        Connection con = Conexion.getConnection();
        String sql;
        PreparedStatement ps;
        try {
            sql = "UPDATE persona SET IDTIPODOC = ?, NRODOC = ?, NOMBRES = ?, APELLIDOS = ?,"
                    + " TELEFONO = ?, CORREO = ? WHERE IDPERSONA = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getTipodoc().getId());
            ps.setString(2, us.getNrodoc());
            ps.setString(3, us.getNombres());
            ps.setString(4, us.getApellidos());
            ps.setString(5, us.getTelefono());
            ps.setString(6, us.getCorreo());
            ps.setInt(7, us.getId());
            ps.executeUpdate();

            sql = "UPDATE apoderado SET IDPARENTESCO = ?, IDPERSONA = ?, IDUSUARIO = ? WHERE IDAPODERADO = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getParentesco().getId());
            ps.setInt(2, us.getId());
            ps.setInt(3, us.getUsuarios().get(0).getIdUser());
            ps.setInt(4, us.getIdApo());
            r = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return r;
    }

    @Override
    public void delete(int id, int idper) {
        Connection con = Conexion.getConnection();
        String sql;
        try {
            sql = "DELETE FROM apoderado WHERE IDAPODERADO=" + id;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();

            sql = "DELETE FROM persona WHERE IDPERSONA=" + idper;
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
    }

}

package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Rol;
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

public class DaoUsuario implements IMantenimiento {

    private final static Logger LOGGER = Logger.getLogger(DaoUsuario.class.getName());

    public Usuario validateUser(Usuario u) {
        String sql = "SELECT u.IDUSUARIO,U.USUARIO,p.NOMBRES,p.APELLIDOS,p.NRODOC,"
                + " p.TELEFONO,p.CORREO,r.IDROL,r.DESCRIPCION"
                + " FROM USUARIO u INNER JOIN persona p INNER JOIN rol r INNER JOIN tipodoc t"
                + " ON u.IDPERSONA=p.IDPERSONA AND u.IDROL=r.IDROL and t.IDTIPODOC=p.IDTIPODOC"
                + " WHERE u.USUARIO='" + u.getUsuario() + "' AND u.PASSWORD='" + u.getPassword() + "'";

        Connection con = Conexion.getConnection();
        if (con != null) {
            try (PreparedStatement ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    u.setIdUser(rs.getInt(1));
                    u.setUsuario(rs.getString(2));
                    u.setNombres(rs.getString(3));
                    u.setApellidos(rs.getString(4));
                    u.setNrodoc(rs.getString(5));
                    u.setTelefono(rs.getString(6));
                    u.setCorreo(rs.getString(7));
                    u.setRol(new Rol(rs.getInt(8), rs.getString(9)));
                }
                rs.close();
            } catch (SQLException e) {
                LOGGER.log(Level.INFO, e.getMessage(), e);
            } finally {
                Conexion.close(con);
            }
        }
        return u;
    }

    //Métodos de Mantenimiento
    @Override
    public List<?> getAll() {
        List<Usuario> listUsers = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT u.IDUSUARIO,U.USUARIO,p.NOMBRES,p.APELLIDOS,p.NRODOC,"
                    + " p.TELEFONO,p.CORREO,r.IDROL,r.DESCRIPCION,p.IDPERSONA,p.IDTIPODOC,t.TIPO"
                    + " FROM USUARIO u INNER JOIN persona p INNER JOIN rol r INNER JOIN TIPODOC t"
                    + " where u.IDPERSONA=p.IDPERSONA AND u.IDROL=r.IDROL and p.IDTIPODOC=t.IDTIPODOC ORDER BY u.IDUSUARIO";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUser(rs.getInt("u.IDUSUARIO"));
                u.setUsuario(rs.getString("U.USUARIO"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setRol(new Rol(rs.getInt("r.IDROL"), rs.getString("r.DESCRIPCION")));
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setTipodoc(new TipoDoc(rs.getInt("p.IDTIPODOC"), rs.getString("t.TIPO")));
                listUsers.add(u);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return listUsers;
    }

    @Override
    public Object getFindId(int id) {
        Usuario u = new Usuario();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT p.IDPERSONA,p.IDTIPODOC,p.NRODOC,p.NOMBRES,p.APELLIDOS,"
                    + " p.TELEFONO,p.CORREO,u.IDUSUARIO,u.USUARIO,u.PASSWORD,u.ESTADO,u.IDROL"
                    + " FROM USUARIO u INNER JOIN persona p"
                    + " where u.IDPERSONA=p.IDPERSONA AND u.IDUSUARIO=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setTipodoc(new TipoDoc(rs.getInt("p.IDTIPODOC"), null));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setIdUser(rs.getInt("u.IDUSUARIO"));
                u.setUsuario(rs.getString("u.USUARIO"));
                u.setPassword(rs.getString("u.PASSWORD"));
                u.setRol(new Rol(rs.getInt("u.IDROL"), null));
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
        Usuario us = (Usuario) u;
        int r = 0;
        if (!isRegistry(!"".equals(us.getNrodoc()) ? us.getNrodoc() : null)) {
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
                sql = "INSERT INTO usuario (USUARIO, PASSWORD, ESTADO, IDPERSONA, IDROL) VALUES(?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, us.getUsuario());
                ps.setString(2, us.getPassword());
                ps.setInt(3, 1);
                ps.setInt(4, idPersona);
                ps.setInt(5, us.getRol().getId());
                r = ps.executeUpdate();
                ps.close();
            } catch (SQLException e) {
                LOGGER.log(Level.INFO, e.getMessage(), e);
            } finally {
                Conexion.close(con);
            }
        }
        return r;
    }

    @Override
    public int update(Object u) {
        Usuario us = (Usuario) u;
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

            sql = "UPDATE usuario SET USUARIO = ?, PASSWORD = ?, IDROL = ? WHERE IDUSUARIO = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getPassword());
            ps.setInt(3, us.getRol().getId());
            ps.setInt(4, us.getIdUser());
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
            sql = "DELETE FROM USUARIO WHERE IDUSUARIO=" + id;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();

            sql = "DELETE FROM PERSONA WHERE IDPERSONA=" + idper;
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
    }

    //Other methods 
    public boolean isRegistry(String documento) {
        boolean isRegistered = false;
        Usuario usuario = new Usuario();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT * FROM persona WHERE NRODOC=?";
            PreparedStatement ps = con.prepareStatement(sql);
            if (documento.equals("")) {
                documento = null;
            }
            ps.setString(1, documento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setId(rs.getInt("IDPERSONA"));
                usuario.setNrodoc(rs.getString("NRODOC"));
                usuario.setNombres(rs.getString("NOMBRES"));
            }
            if (usuario.getNrodoc() != null) {
                isRegistered = true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return isRegistered;
    }

    //Other methods 
    public Usuario getUsuario(String documento) {
        Usuario u = new Usuario();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT p.IDPERSONA,p.IDTIPODOC,p.NRODOC,p.NOMBRES,p.APELLIDOS,"
                    + " p.TELEFONO,p.CORREO,u.IDUSUARIO,u.USUARIO,u.PASSWORD,u.ESTADO,u.IDROL"
                    + " FROM USUARIO u INNER JOIN persona p"
                    + " where u.IDPERSONA=p.IDPERSONA AND p.NRODOC=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, documento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setTipodoc(new TipoDoc(rs.getInt("p.IDTIPODOC"), null));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setIdUser(rs.getInt("u.IDUSUARIO"));
                u.setUsuario(rs.getString("u.USUARIO"));
                u.setPassword(rs.getString("u.PASSWORD"));
                u.setRol(new Rol(rs.getInt("u.IDROL"), null));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            LOGGER.log(Level.INFO, "Mensaje!");
        }
        return u;
    }
}

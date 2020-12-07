package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Area;
import com.app.dto.Personal;
import com.app.dto.TipoDoc;
import com.app.interfaces.IMantenimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoPersonal implements IMantenimiento {

    private static final Logger LOGGER = Logger.getLogger(DaoPersonal.class.getName());

    @Override
    public List<?> getAll() {
        List<Personal> listPersonal = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT per.IDPERSONAL, p.IDPERSONA,t.TIPO,p.NRODOC,"
                    + " p.NOMBRES,p.APELLIDOS,p.TELEFONO,p.CORREO,per.IDAREA,a.DESCRIPCION"
                    + " FROM personal per INNER JOIN persona p INNER JOIN area a INNER JOIN tipodoc t"
                    + " where per.IDPERSONA=p.IDPERSONA AND a.IDAREA=per.IDAREA"
                    + " AND p.IDTIPODOC=t.IDTIPODOC ORDER BY per.IDPERSONAL";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Personal u = new Personal();
                u.setIdp(rs.getInt("per.IDPERSONAL"));
                u.setId(rs.getInt("p.IDPERSONA"));
                u.setNrodoc(rs.getString("p.NRODOC"));
                u.setNombres(rs.getString("p.NOMBRES"));
                u.setApellidos(rs.getString("p.APELLIDOS"));
                u.setTelefono(rs.getString("p.TELEFONO"));
                u.setCorreo(rs.getString("p.CORREO"));
                u.setTipodoc(new TipoDoc(0, rs.getString("t.TIPO")));
                u.setArea(new Area(rs.getInt("per.IDAREA"), rs.getString("a.DESCRIPCION")));
                listPersonal.add(u);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return listPersonal;
    }

    @Override
    public Object getFindId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int add(Object u) {
        Personal us = (Personal) u;
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
            sql = "INSERT INTO personal (IDAREA,IDPERSONA) VALUES(?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getArea().getId());
            ps.setInt(2, idPersona);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id, int idper) {
        Connection con = Conexion.getConnection();
        String sql;
        try {
            sql = "DELETE FROM personal WHERE IDPERSONAL=" + id;
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

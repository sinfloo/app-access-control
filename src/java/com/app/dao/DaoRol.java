package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Rol;
import com.app.interfaces.IMantenimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoRol implements IMantenimiento {

    private final static Logger LOGGER = Logger.getLogger(DaoRol.class.getName());

    @Override
    public List<?> getAll() {
        List<Rol> roles = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT * FROM ROL";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rol r = new Rol();
                r.setId(rs.getInt(1));
                r.setDescripcion(rs.getString(2));
                roles.add(r);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return roles;
    }

    public List<?> getAll2() {
        List<Rol> roles = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT * FROM ROL";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rol r = new Rol();
                r.setId(rs.getInt(1));
                r.setDescripcion(rs.getString(2));
                if (r.getId() != 3) {
                    roles.add(r);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return roles;
    }

    @Override
    public Object getFindId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int add(Object u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id, int idper) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

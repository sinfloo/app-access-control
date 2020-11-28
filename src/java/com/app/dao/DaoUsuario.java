package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Rol;
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
        String sql = "SELECT u.IDUSUARIO,U.USUARIO,p.NOMBRES,p.APELLIDOS,p.DNI,"
                + " p.TELEFONO,p.CORREO,r.IDROL,r.DESCRIPCION"
                + " FROM USUARIO u INNER JOIN persona p INNER JOIN rol r"
                + " ON u.IDPERSONA=p.IDPERSONA AND u.IDROL=r.IDROL "
                + "WHERE u.USUARIO='" + u.getUsuario() + "' AND u.PASSWORD='" + u.getPassword() + "'";
        Connection con = Conexion.getConnection();
        try (PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                u.setIdUser(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setNombres(rs.getString(3));
                u.setApellidos(rs.getString(4));
                u.setDni(rs.getString(5));
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
        return u;
    }

    //Métodos de Mantenimiento
    @Override
    public List<?> getAll() {
        List<Usuario> listUsers = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT u.IDUSUARIO,U.USUARIO,p.NOMBRES,p.APELLIDOS,p.DNI,"
                    + " p.TELEFONO,p.CORREO,r.IDROL,r.DESCRIPCION"
                    + " FROM USUARIO u INNER JOIN persona p INNER JOIN rol r"
                    + " where u.IDPERSONA=p.IDPERSONA AND u.IDROL=r.IDROL";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUser(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setNombres(rs.getString(3));
                u.setApellidos(rs.getString(4));
                u.setDni(rs.getString(5));
                u.setTelefono(rs.getString(6));
                u.setCorreo(rs.getString(7));
                u.setRol(new Rol(rs.getInt(8), rs.getString(9)));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int add(Object u) {
        Connection con = Conexion.getConnection();
        String sql;
        PreparedStatement ps;
        try {
            sql = "INSERT INTO persona (IDPERSONA, DNI, NOMBRES, APELLIDOS, TELEFONO, CORREO) VALUES(?,?,?,?,?,?)";
            Usuario us=(Usuario)u;
            ps = con.prepareStatement(sql);
            ps.setInt(1,us.getId());
            ps.setString(2,us.getDni());
            ps.setString(3,us.getNombres());
            ps.setString(4,us.getApellidos());
            ps.setString(5,us.getTelefono());
            ps.setString(6,us.getCorreo());           
            ps.execute();  
            
            sql = "INSERT INTO usuario (USUARIO, PASSWORD, ESTADO, IDPERSONA, IDROL) VALUES(?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getPassword());
            ps.setInt(3, 1);
            ps.setInt(4, us.getId());
            ps.setInt(5, 2);
            ps.execute();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return 0;
    }

    @Override
    public int update(Object u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //Other methods   
}

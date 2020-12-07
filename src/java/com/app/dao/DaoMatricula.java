package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Grado;
import com.app.dto.Historial;
import com.app.dto.Matricula;
import com.app.dto.Usuario;
import com.app.interfaces.IMantenimiento;
import com.app.utils.Fecha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoMatricula implements IMantenimiento {

    private final static Logger LOGGER = Logger.getLogger(DaoMatricula.class.getName());

    @Override
    public List<?> getAll() {
        List<Matricula> listUsers = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT m.IDMATRICULA,m.YEAR,p.NRODOC,p.NOMBRES,p.APELLIDOS,"
                    + "h.TIPO,h.IMPORTE,g.DESCRIPCION FROM matricula m"
                    + " INNER JOIN historial h INNER JOIN usuario u INNER JOIN grado g INNER JOIN persona p "
                    + "ON m.IDHISTORIAL=h.IDHISTORIAL and u.IDUSUARIO=m.IDUSUARIO and "
                    + "m.IDGRADO=g.IDGRADO AND u.IDPERSONA=p.IDPERSONA WHERE m.YEAR="+Fecha.Año();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Matricula u = new Matricula();
                u.setId(rs.getInt("m.IDMATRICULA"));
                u.setYear(rs.getString("m.YEAR")); 
                Usuario us=new Usuario();
                us.setNrodoc(rs.getString("p.NRODOC"));
                us.setNombres(rs.getString("p.NOMBRES"));
                us.setApellidos(rs.getString("p.APELLIDOS"));
                u.setUsuario(us);
                u.setHistorial(new Historial(rs.getDouble("h.IMPORTE")));
                u.setGrado(new Grado(0, rs.getString("g.DESCRIPCION")));
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
        Matricula us = (Matricula) u;
        int r = 0;
        Connection con = Conexion.getConnection();
        String sql;
        PreparedStatement ps;
        int idHistorial;
        try {
            sql = "INSERT INTO historial (TIPO,NROTICKET, FECHA, DESCRIPCION, IMPORTE, IDUSUARIO) VALUES(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setString(2, Fecha.Hora());
            ps.setString(3, Fecha.FechaBD());
            ps.setString(4, "Concepto de Matricula Periodo-"+us.getYear());
            ps.setDouble(5, us.getHistorial().getTotaldeuda());
            ps.setInt(6, us.getUsuario().getIdUser());
            r=ps.executeUpdate();
            
            sql = "SELECT @@IDENTITY AS IDHISTORIAL";
            try (ResultSet rs = ps.executeQuery(sql)) {
                rs.next();
                idHistorial = rs.getInt("IDHISTORIAL");
            }            
            sql = "INSERT INTO matricula (YEAR,IDHISTORIAL, IDUSUARIO, IDGRADO) VALUES(?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getYear());
            ps.setInt(2, idHistorial);
            ps.setInt(3, us.getUsuario().getIdUser());
            ps.setInt(4, us.getGrado().getId());
            r=ps.executeUpdate();
            
            sql = "UPDATE usuario set IDGRADO=? WHERE IDUSUARIO=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, us.getGrado().getId());
            ps.setInt(2, us.getUsuario().getIdUser());            
            r=ps.executeUpdate();
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

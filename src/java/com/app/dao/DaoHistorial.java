package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Historial;
import com.app.dto.Operacion;
import com.app.dto.Usuario;
import com.app.utils.Fecha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoHistorial {

    private final static Logger LOGGER = Logger.getLogger(DaoHistorial.class.getName());

    public List<Historial> getAll(int idUsuario) {
        List<Historial> lista = new ArrayList<>();
        Connection con = Conexion.getConnection();
        try {
            String sql = "SELECT * FROM historial WHERE IDUSUARIO=" + idUsuario;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Historial h = new Historial();
                h.setId(rs.getInt(1));
                h.setOperacion(new Operacion(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6)));
                h.setUsuario(new Usuario(idUsuario));
                lista.add(h);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return lista;
    }

    public Object getFindId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int add(Object u) {
        Historial us = (Historial) u;
        int r = 0;
        Connection con = Conexion.getConnection();
        String sql;
        PreparedStatement ps;
        int tipo=us.getOperacion().getTipooperacion();
        try {
            sql = "INSERT INTO historial (TIPO,NROTICKET, FECHA, DESCRIPCION, IMPORTE, IDUSUARIO) VALUES(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, tipo);
            ps.setString(2, tipo==1?Fecha.Hora():us.getOperacion().getNroticket());
            ps.setString(3, us.getOperacion().getFecha());
            ps.setString(4, us.getOperacion().getDescripcion());
            ps.setDouble(5, us.getOperacion().getImporte());
            ps.setInt(6, us.getUsuario().getIdUser());
            r=ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        } finally {
            Conexion.close(con);
        }
        return r;
    }

    public int update(Object u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void delete(int id, int idper) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

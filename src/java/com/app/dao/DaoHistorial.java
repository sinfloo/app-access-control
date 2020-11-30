package com.app.dao;

import com.app.config.Conexion;
import com.app.dto.Historial;
import com.app.dto.Operacion;
import com.app.dto.Usuario;
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
            String sql = "SELECT * FROM HISTORIAL WHERE IDUSUARIO="+idUsuario;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Historial h = new Historial();
                h.setId(rs.getInt(1));
                h.setOperacion(new Operacion(rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6)));
                h.setTotaldeuda(rs.getDouble(7));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public int update(Object u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void delete(int id, int idper) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

package com.app.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Conexion {

    private final static Logger LOGGER = Logger.getLogger(Conexion.class.getName());

    private static final String URL = "jdbc:mysql://192.168.0.106:3306/bd_controlaccess";
    private static final String USER = "root";
    private static final String PASS = "";

    private static Connection con;
    private static Conexion conexion;
    private Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            if (con != null) {
                LOGGER.log(Level.INFO, "Database connection is successfull!!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.log(Level.INFO, e.getMessage(), e);
        }
    }
    public static Connection getConnection() {
        if (con == null) {
            conexion=new Conexion();
        }
        return con;
    }

    public static void close(Connection cn) {
        if (cn != null) {
            try {
                cn.close();
                con=null;
            } catch (SQLException ex) {
                LOGGER.log(Level.INFO, ex.getMessage(), ex);
            }
        }
    }
}

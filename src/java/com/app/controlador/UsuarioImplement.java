
package com.app.controlador;

import com.app.dao.DaoRol;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Rol;
import com.app.dto.TipoDoc;
import com.app.dto.Usuario;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioImplement {
    private static final Logger LOGGER=Logger.getLogger(UsuarioImplement.class.getName());
    public static void executeListar(HttpServletRequest request, HttpServletResponse response){
        try {    
            List<Usuario>usuarios=(List<Usuario>)new DaoUsuario().getAll();
            request.setAttribute("Usuarios", usuarios);
            request.getRequestDispatcher("vistas/Usuario.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeNew(HttpServletRequest request, HttpServletResponse response){
        try {    
            List<Rol>roles=(List<Rol>)new DaoRol().getAll();
            request.setAttribute("Roles", roles);
            List<TipoDoc>tipos=(List<TipoDoc>)new DaoTipoDoc().getAll();
            request.setAttribute("TiposDoc", tipos);
            request.getRequestDispatcher("/vistas/Registro.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeAdd(HttpServletRequest request, HttpServletResponse response){
        try {        
            Usuario u=new Usuario();
            /**u.setId(Integer.valueOf(request.getParameter("txtId")));**/            
            u.setTipodoc(new TipoDoc(Integer.valueOf(request.getParameter("txtTipo")),null));
            u.setNrodoc(request.getParameter("txtNroDoc"));
            u.setNombres(request.getParameter("txtNombres"));
            u.setApellidos(request.getParameter("txtApellidos"));
            u.setTelefono(request.getParameter("txtTelefono"));
            u.setCorreo(request.getParameter("txtCorreo"));
            u.setUsuario(request.getParameter("txtUsuario"));
            u.setPassword(u.getUsuario().concat("2020"));
            u.setRol(new Rol(Integer.valueOf(request.getParameter("txtRol")),null));
            int r=new DaoUsuario().add(u);            
            request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeEdit(HttpServletRequest request, HttpServletResponse response){
        try {    
            List<Usuario>usuarios=(List<Usuario>)new DaoUsuario().getAll();
            request.setAttribute("Usuarios", usuarios);
            request.getRequestDispatcher("vistas/Usuario.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeUpdate(HttpServletRequest request, HttpServletResponse response){
        try {             
            request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeDelete(HttpServletRequest request, HttpServletResponse response){
        int id=Integer.valueOf(request.getParameter("id"));
        int idper=Integer.valueOf(request.getParameter("idper"));
        new DaoUsuario().delete(id,idper);
    }
}

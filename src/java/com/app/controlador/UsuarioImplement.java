package com.app.controlador;

import com.app.dao.DaoHistorial;
import com.app.dao.DaoRol;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Historial;
import com.app.dto.Rol;
import com.app.dto.TipoDoc;
import com.app.dto.Usuario;
import com.app.utils.Fecha;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioImplement {

    private static final Logger LOGGER = Logger.getLogger(UsuarioImplement.class.getName());

    public static void executeListar(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Usuario> usuarios = (List<Usuario>) new DaoUsuario().getAll();
            request.setAttribute("Usuarios", usuarios);
            request.getRequestDispatcher("vistas/Usuario.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeListar2(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Usuario> usuarios = (List<Usuario>) new DaoUsuario().getAll2();
            request.setAttribute("Usuarios", usuarios);
            request.getRequestDispatcher("vistas/Configuracion.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeNew(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Registro de Alumno");
            request.setAttribute("User", new Usuario());
            request.getRequestDispatcher("/vistas/Registro.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeNew2(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos2(request);
            request.setAttribute("Title", "Registro de Usuario");
            request.setAttribute("User", new Usuario());
            request.getRequestDispatcher("/vistas/RegistroUser.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeSave(HttpServletRequest request, HttpServletResponse response) {
        try {
            Usuario u = new Usuario();
            u.setId(Integer.valueOf(request.getParameter("txtIdPer")));
            u.setTipodoc(new TipoDoc(Integer.valueOf(request.getParameter("txtTipo")), null));
            u.setNrodoc(request.getParameter("txtNroDoc"));
            u.setNombres(request.getParameter("txtNombres"));
            u.setApellidos(request.getParameter("txtApellidos"));
            u.setTelefono(request.getParameter("txtTelefono"));
            u.setIdUser(Integer.valueOf(request.getParameter("txtIdUser")));
            u.setCorreo(request.getParameter("txtCorreo"));
            u.setUsuario(request.getParameter("txtUsuario"));
            u.setPassword(u.getUsuario()!=null?u.getUsuario().concat("2020"):null);
            u.setRol(new Rol(Integer.valueOf("3"), null));
            if (u.getIdUser()==0&&u.getId()==0) {
                new DaoUsuario().add(u);
            } else {
                new DaoUsuario().update(u);
            }
            request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeSave2(HttpServletRequest request, HttpServletResponse response) {
        try {
            Usuario u = new Usuario();
            u.setId(Integer.valueOf(request.getParameter("txtIdPer")));
            u.setTipodoc(new TipoDoc(Integer.valueOf(request.getParameter("txtTipo")), null));
            u.setNrodoc(request.getParameter("txtNroDoc"));
            u.setNombres(request.getParameter("txtNombres"));
            u.setApellidos(request.getParameter("txtApellidos"));
            u.setTelefono(request.getParameter("txtTelefono"));
            u.setIdUser(Integer.valueOf(request.getParameter("txtIdUser")));
            u.setCorreo(request.getParameter("txtCorreo"));
            u.setUsuario(request.getParameter("txtUsuario"));
            u.setPassword(u.getUsuario()!=null?u.getUsuario().concat("2020"):null);
            u.setRol(new Rol(Integer.valueOf("3"), null));
            if (u.getIdUser()==0&&u.getId()==0) {
                new DaoUsuario().add(u);
            } else {
                new DaoUsuario().update(u);
            }
            request.getRequestDispatcher("Controlador?menu=Configuracion&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Actualización de Datos del Alumno");
            request.setAttribute("User", new DaoUsuario().getFindId(Integer.valueOf(request.getParameter("txtIdUser"))));
            request.getRequestDispatcher("vistas/Registro.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeEdit2(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos2(request);
            request.setAttribute("Title", "Actualización de Datos del Usuario");
            request.setAttribute("User", new DaoUsuario().getFindId(Integer.valueOf(request.getParameter("txtIdUser"))));
            request.getRequestDispatcher("vistas/RegistroUser.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    public static void executeDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.valueOf(request.getParameter("id"));
        int idper = Integer.valueOf(request.getParameter("idper"));
        new DaoUsuario().delete(id, idper);
    }

    private static void listCombos(HttpServletRequest request) {
        List<Rol> roles = (List<Rol>) new DaoRol().getAll();
        request.setAttribute("Rol", roles);
        List<TipoDoc> tipos = (List<TipoDoc>) new DaoTipoDoc().getAll();
        request.setAttribute("TiposDoc", tipos);
    }
    private static void listCombos2(HttpServletRequest request) {
        List<Rol> roles = (List<Rol>) new DaoRol().getAll2();
        request.setAttribute("Rol", roles);
        List<TipoDoc> tipos = (List<TipoDoc>) new DaoTipoDoc().getAll();
        request.setAttribute("TiposDoc", tipos);
    }
    
    public static void executeVerHistorial(HttpServletRequest request, HttpServletResponse response) {
        int iduser = Integer.valueOf(request.getParameter("txtIdUser"));
        //int idper = Integer.valueOf(request.getParameter("txtIdPer"));
        try {
            double total=0.00;
            List<Historial>historial=new DaoHistorial().getAll(iduser);
            
            for (Historial h : historial) {
                if(h.getOperacion().getTipooperacion()==1){
                    total=total+h.getOperacion().getImporte();
                }else{
                    total=total-h.getOperacion().getImporte();
                }                
            }
            request.setAttribute("Historial", historial);
            request.setAttribute("User", new DaoUsuario().getFindId(iduser));
            request.setAttribute("total", total);
            request.setAttribute("nroticket", Fecha.Hora());
            request.getRequestDispatcher("vistas/Historial.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
           LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
}

package com.app.controlador;

import com.app.dao.DaoApoderado;
import com.app.dao.DaoParentesco;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Apoderado;
import com.app.dto.Parentesco;
import com.app.dto.TipoDoc;
import com.app.dto.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApoderadoImplement {

    private static final Logger LOGGER = Logger.getLogger(UsuarioImplement.class.getName());

    public static void executeListar(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Apoderado> apoderados = (List<Apoderado>) new DaoApoderado().getAll();
            request.setAttribute("Apoderados", apoderados);
            request.getRequestDispatcher("vistas/Apoderado.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeNew(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Registro de datos del apoderado");
            request.setAttribute("Apoderado", new Apoderado());
            request.getRequestDispatcher("/vistas/RegistroApoderado.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeSave(HttpServletRequest request, HttpServletResponse response) {
        try {
            Apoderado u = new Apoderado();
            u.setId(Integer.valueOf(request.getParameter("txtIdPer")));
            u.setTipodoc(new TipoDoc(Integer.valueOf(request.getParameter("txtTipo")), null));
            u.setNrodoc(request.getParameter("txtNroDoc"));
            u.setNombres(request.getParameter("txtNombres"));
            u.setApellidos(request.getParameter("txtApellidos"));
            u.setTelefono(request.getParameter("txtTelefono"));
            u.setCorreo(request.getParameter("txtCorreo"));
            List<Usuario> usuarios = new ArrayList<>();
            usuarios.add(new Usuario(Integer.valueOf(request.getParameter("txtIdUser"))));
            u.setUsuarios(usuarios);
            
            u.setParentesco(new Parentesco(Integer.valueOf(request.getParameter("txtParentesco")), null));
            if (u.getIdApo()== 0 && u.getId() == 0) {
                new DaoApoderado().add(u);
            } else {
                new DaoApoderado().update(u);
            }
            request.getRequestDispatcher("Controlador?menu=Apoderado&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Actualización de Datos del Apoderado");
            request.setAttribute("Apoderado", new DaoApoderado().getFindId(Integer.valueOf(request.getParameter("txtIdApo"))));
            request.getRequestDispatcher("vistas/RegistroApoderado.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.valueOf(request.getParameter("id"));
        int idper = Integer.valueOf(request.getParameter("idper"));
        new DaoApoderado().delete(id, idper);
    }

    private static void listCombos(HttpServletRequest request) {
        List<Usuario> usuarios = (List<Usuario>) new DaoUsuario().getAll();
        request.setAttribute("Users", usuarios);
        List<Parentesco> roles = (List<Parentesco>) new DaoParentesco().getAll();
        request.setAttribute("Parentescos", roles);
        List<TipoDoc> tipos = (List<TipoDoc>) new DaoTipoDoc().getAll();
        request.setAttribute("TiposDoc", tipos);
    }
}

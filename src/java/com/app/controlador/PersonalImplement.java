package com.app.controlador;

import com.app.dao.DaoApoderado;
import com.app.dao.DaoParentesco;
import com.app.dao.DaoPersonal;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Apoderado;
import com.app.dto.Area;
import com.app.dao.DaoArea;
import com.app.dto.Parentesco;
import com.app.dto.Personal;
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

public class PersonalImplement {

    private static final Logger LOGGER = Logger.getLogger(PersonalImplement.class.getName());

    public static void executeListar(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Personal> personales = (List<Personal>) new DaoPersonal().getAll();
            request.setAttribute("Personales", personales);
            request.getRequestDispatcher("/vistas/Personal.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeNew(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Registro de datos del Nuevo Personal");
            request.setAttribute("Personal", new Personal());
            request.getRequestDispatcher("/vistas/RegistroPersonal.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeSave(HttpServletRequest request, HttpServletResponse response) {
        try {
            Personal u = new Personal();
            u.setId(Integer.valueOf(request.getParameter("txtIdPer")));
            u.setTipodoc(new TipoDoc(Integer.valueOf(request.getParameter("txtTipo")), null));
            u.setNrodoc(request.getParameter("txtNroDoc"));
            u.setNombres(request.getParameter("txtNombres"));
            u.setApellidos(request.getParameter("txtApellidos"));
            u.setTelefono(request.getParameter("txtTelefono"));
            u.setCorreo(request.getParameter("txtCorreo"));            
            u.setIdp(Integer.valueOf(request.getParameter("txtIdp")));
            u.setArea(new Area(Integer.valueOf(request.getParameter("txtArea")), null));
            if (u.getIdp()== 0 && u.getId() == 0) {
                new DaoPersonal().add(u);
            } else {
                new DaoPersonal().update(u);
            }
            request.getRequestDispatcher("Controlador?menu=Personal&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Actualización de Datos del Personal");
            request.setAttribute("Personal", new DaoPersonal().getFindId(Integer.valueOf(request.getParameter("txtIdp"))));
            request.getRequestDispatcher("vistas/RegistroPersonal.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.valueOf(request.getParameter("id"));
        int idper = Integer.valueOf(request.getParameter("idper"));
        new DaoPersonal().delete(id, idper);
    }

    private static void listCombos(HttpServletRequest request) {
        List<Area> roles = (List<Area>) new DaoArea().getAll();
        request.setAttribute("Areas", roles);
        List<TipoDoc> tipos = (List<TipoDoc>) new DaoTipoDoc().getAll();
        request.setAttribute("TiposDoc", tipos);
    }
}

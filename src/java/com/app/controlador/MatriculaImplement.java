
package com.app.controlador;

import com.app.dao.DaoArea;
import com.app.dao.DaoGrado;
import com.app.dao.DaoMatricula;
import com.app.dao.DaoPersonal;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Area;
import com.app.dto.Grado;
import com.app.dto.Historial;
import com.app.dto.Matricula;
import com.app.dto.Personal;
import com.app.dto.Usuario;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MatriculaImplement {
    private static final Logger LOGGER = Logger.getLogger(MatriculaImplement.class.getName());

    public static void executeListar(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Matricula> matricula = (List<Matricula>) new DaoMatricula().getAll();
            request.setAttribute("Matricula", matricula);
            request.getRequestDispatcher("/vistas/Matricula.jsp").forward(request, response);
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
            Matricula u = new Matricula();
            u.setUsuario(new Usuario(Integer.valueOf(request.getParameter("txtIdUser"))));
            u.setHistorial(new Historial(Double.valueOf(request.getParameter("txtImporte"))));
            u.setYear(request.getParameter("txtPeriodo"));
            u.setGrado(new Grado(Integer.valueOf(request.getParameter("txtGrado")),null));
            new DaoMatricula().add(u);
            request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeStartMatricula(HttpServletRequest request, HttpServletResponse response) {
        try {
            String dni=request.getParameter("txtDocumento");
            Usuario usuario=new DaoUsuario().getUsuario(dni);
            listCombos(request);
            request.setAttribute("Title", "Ficha de Matricula");
            request.setAttribute("User", usuario);
            request.getRequestDispatcher("vistas/RegistroMatricula.jsp").forward(request, response);
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
        List<Grado> grados = (List<Grado>) new DaoGrado().getAll();
        request.setAttribute("Grados", grados);
    }
}

package com.app.controlador;

import com.app.dao.DaoHistorial;
import com.app.dao.DaoRol;
import com.app.dao.DaoTipoDoc;
import com.app.dao.DaoUsuario;
import com.app.dto.Historial;
import com.app.dto.Operacion;
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

public class PagoImplement {

    private static final Logger LOGGER = Logger.getLogger(PagoImplement.class.getName());

    public static void executeListar(HttpServletRequest request, HttpServletResponse response) {
         int iduser = Integer.valueOf(request.getParameter("txtIdUser"));
        try {
            double total = 0.00;
            List<Historial> historial = new DaoHistorial().getAll(iduser);
            request.setAttribute("Historial", historial);
            for (Historial h : historial) {
                if (h.getOperacion().getTipooperacion() == 1) {
                    total = total + h.getOperacion().getImporte();
                } else {
                    total = total - h.getOperacion().getImporte();
                }
            }
            Usuario us=(Usuario)new DaoUsuario().getFindId(iduser);
            request.setAttribute("User",us);
            request.setAttribute("total", total);
            request.setAttribute("nroticket", Fecha.Hora());
            request.getRequestDispatcher("/vistas/Historial.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeNew(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Registro de Usuario");
            request.setAttribute("User", new Usuario());
            request.getRequestDispatcher("/vistas/Registro.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeSave(HttpServletRequest request, HttpServletResponse response) {
        try {
            Historial h = new Historial();
            int iduser=Integer.parseInt(request.getParameter("txtIdUser"));
            String tipo=request.getParameter("txtTipo");
            String ticket=request.getParameter("txtNumero");
            String descripcion=request.getParameter("txtDescripcion");
            double importe=Double.valueOf(request.getParameter("txtImporte"));
            h.setOperacion(new Operacion(tipo.equals("DEUDA")?1:2, ticket, Fecha.FechaBD(), descripcion, importe));
            h.setUsuario(new Usuario(iduser));
            new DaoHistorial().add(h);
            request.getRequestDispatcher("Controlador?menu=Pago&accion=Listar").forward(request, response);
        } catch (ServletException | IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    public static void executeEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            listCombos(request);
            request.setAttribute("Title", "Actualización de Datos del Usuario");
            request.setAttribute("User", new DaoUsuario().getFindId(Integer.valueOf(request.getParameter("txtIdUser"))));
            request.getRequestDispatcher("vistas/Registro.jsp").forward(request, response);
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
        request.setAttribute("Roles", roles);
        List<TipoDoc> tipos = (List<TipoDoc>) new DaoTipoDoc().getAll();
        request.setAttribute("TiposDoc", tipos);
    }
}

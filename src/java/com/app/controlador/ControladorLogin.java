package com.app.controlador;

import com.app.config.Conexion;
import com.app.dao.DaoUsuario;
import com.app.dto.Usuario;
import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorLogin extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ControladorLogin.class.getName());
    private String accion;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        accion = request.getParameter("accion");
        HttpSession session = request.getSession();
        switch (accion) {
            case "Login":
                Usuario u = new Usuario();
                u.setUsuario(request.getParameter("txtUsuario"));
                u.setPassword(request.getParameter("txtPassword"));
                u = new DaoUsuario().validateUser(u);
//                u.setNombres("Admin");
//                u.setApellidos("Admin");
                if (u != null && u.getNombres() != null && !"".equals(u.getApellidos())) {
                    session.setAttribute("Usuario", u);
                    request.getRequestDispatcher("Home.jsp").forward(request, response);
                } else {
                    session.invalidate();
                    request.getRequestDispatcher("Mensaje.jsp").forward(request, response);
                }
                break;
            case "Salir":
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

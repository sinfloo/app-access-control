package com.app.controlador;

import com.app.dto.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        String menu = request.getParameter("menu");
        HttpSession session = request.getSession();
        if (menu != null && menu.equals("Usuario")) {
            switch (accion) {
                case "Listar":
                   UsuarioImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    UsuarioImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    UsuarioImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    UsuarioImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    UsuarioImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        if (menu != null && menu.equals("Apoderado")) {
            switch (accion) {
                case "Listar":
                   ApoderadoImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    ApoderadoImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    ApoderadoImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    ApoderadoImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    ApoderadoImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        if (menu != null && menu.equals("Matricula")) {
            switch (accion) {
                case "Listar":
                   UsuarioImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    UsuarioImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    UsuarioImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    UsuarioImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    UsuarioImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        if (menu != null && menu.equals("Personal")) {
            switch (accion) {
                case "Listar":
                   PersonalImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    PersonalImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    PersonalImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    PersonalImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    PersonalImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        if (menu != null && menu.equals("Pago")) {
            switch (accion) {
                case "Listar":
                   UsuarioImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    UsuarioImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    UsuarioImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    UsuarioImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    UsuarioImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        if (menu != null && menu.equals("Deuda")) {
            switch (accion) {
                case "Listar":
                   UsuarioImplement.executeListar(request, response);
                   break;
                case "Nuevo":                    
                    UsuarioImplement.executeNew(request, response);
                    break;                
                case "Editar":
                    UsuarioImplement.executeEdit(request, response);
                    break;
                case "Guardar":
                    UsuarioImplement.executeSave(request, response);
                    break;
                case "Eliminar":
                    UsuarioImplement.executeDelete(request, response);
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

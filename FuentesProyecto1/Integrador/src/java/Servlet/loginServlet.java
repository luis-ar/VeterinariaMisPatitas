/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import dao.DaoUsuario;
import dao.DaoVeterinario;
import dao.impl.DaoUsuarioImpl;
import dao.impl.DaoVeterinarioImpl;
import entidad.Usuario;
import entidad.Veterinario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String correo = request.getParameter("correo");
        String contra = request.getParameter("contra");

//recuperar cuenta usuario
        DaoUsuario daoUsuario = new DaoUsuarioImpl();
        List<Usuario> usuarios = daoUsuario.usuarioSel();
        String hashMD5 = daoUsuario.calcularMD5MySQL(contra);
        System.out.println(hashMD5);
        for (Usuario usuario : usuarios) {
            if (usuario.getCorreoUsuario().equals(correo) && usuario.getContra().equals(hashMD5)) {
                Integer codigoUsuario = usuario.getIdUsuario();
                // Guardar el idUsuario en la sesión (opcional)
                HttpSession session = request.getSession();
                session.setAttribute("codigoUsuario", codigoUsuario);
                // Redirigir a la página deseada
                response.sendRedirect(request.getContextPath() + "/indexUsuario.jsp");
                return;
            }
        }

//recuperar cuenta de veterinario
        DaoVeterinario dao = new DaoVeterinarioImpl();
        List<Veterinario> veterinarios = dao.veterinarioSel();
                String hashMD = dao.calcularMD5MySQL(contra);
        for (Veterinario veterinario : veterinarios) {
            if (veterinario.getCorreo().equals(correo) && veterinario.getContra().equals(hashMD)) {
                Integer idVeterinario = veterinario.getIdVeterinario();
                request.setAttribute("idVeterinario", idVeterinario);
                request.getRequestDispatcher("/indexVeterinario.jsp").forward(request, response);
                return;
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

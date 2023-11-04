/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoServicio;
import com.pe.mispatitas.historial.dao.impl.DaoServicioImpl;
import entidad.Servicio;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "ActualizarServicioServlet", urlPatterns = {"/ActualizarServicio"})
@MultipartConfig
public class ActualizarServicioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DaoServicio dao = new DaoServicioImpl();
        String mensajeAlerta;
        Integer idServicio = Integer.valueOf(request.getParameter("idServicio"));
        String nombreServicio = request.getParameter("nombreServicio");
        String descripcionServicio = request.getParameter("descripcionServicio");
        Part part = request.getPart("imagenServicio");
        InputStream inputStream = part.getInputStream();
                System.out.println("prueba1");

        if ("".equals(nombreServicio) || "".equals(descripcionServicio)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("RecuperarIdServicio").forward(request, response);
        } else {

            
            if (inputStream.available() == 0) {
                System.out.println("prueba12");
                Servicio cat = new Servicio(idServicio, nombreServicio, descripcionServicio);
                dao.servicioUpdParcial(cat);
                response.sendRedirect(request.getContextPath() + "/MostrarServicio");

            } else {

                Servicio cat = new Servicio(idServicio, nombreServicio, descripcionServicio, inputStream);
                dao.servicioUpd(cat);
                response.sendRedirect(request.getContextPath() + "/MostrarServicio");
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

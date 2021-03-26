/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ComentariosDAO;
import DAO.ReplicaDAO;
import Model.ComentariosCRUD;
import Model.ReplicaCRUD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuaria
 */
public class ServletReplica extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String contenido = request.getParameter("contenido");
        String id_comentario = request.getParameter("id_comentario");
        String id_usuario = request.getParameter("id_usuario");
        String id_usuario_replica = request.getParameter("id_usuario_replica");
        String msg2;
        String msg;

        try {
            ReplicaDAO replica = new ReplicaDAO();
            replica.setId_comentario(Integer.parseInt(id_comentario));
            replica.setId_usuario(Integer.parseInt(id_usuario));
            replica.setId_usuario_replica(Integer.parseInt(id_usuario_replica));
            replica.setConetindo(contenido);
            ReplicaCRUD tcu = new ReplicaCRUD();
            msg = tcu.Create(replica);
            if (Integer.parseInt(msg) != 0) {
                msg2 = "Se ha respondido satisfactoriamente";
                request.setAttribute("mensaje", msg2);
                request.getRequestDispatcher("temas.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", msg);
                request.getRequestDispatcher("temas.jsp").forward(request, response);
            }

        } catch (IOException | NumberFormatException | ServletException ex) {
            msg = ex.getMessage();
            request.setAttribute("mensaje", msg);
            request.getRequestDispatcher("temas.jsp").forward(request, response);
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

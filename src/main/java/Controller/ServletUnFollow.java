/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.FollowDAO;
import Model.Follow;
import Model.TemasCRUD;
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
public class ServletUnFollow extends HttpServlet {

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
        //String f = request.getParameter("unfollow");
        //String id_usuario = request.getParameter("id_usuario");
        String id_usuario = request.getParameter("id_usuario");
        String id_tema = request.getParameter("id_tema");
        String msg;
        String msg2;
        try {

            FollowDAO follow = new FollowDAO();
            follow.setId_tema(Integer.parseInt(id_tema));
            follow.setId_usuarios(Integer.parseInt(id_usuario));
            Follow fcrud = new Follow();
            msg = fcrud.Delete(follow);
            if (Integer.parseInt(msg) != 0) {
                msg2 = "Se ha dejado de seguir exitosamente";
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

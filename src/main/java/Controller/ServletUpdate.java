/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UsuariosDAO;
import Model.UsuariosCRUD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuaria
 */
public class ServletUpdate extends HttpServlet {

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
        if (request.getParameter("btn") != null) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("mail");
            String fono = request.getParameter("fono");
            String rut = request.getParameter("rut");
            String pais = request.getParameter("pais");
            String password = request.getParameter("password");

            try {
                UsuariosDAO user = new UsuariosDAO();
                user.setName(name);
                user.setId(Integer.parseInt(id));
                user.setLastname(lastname);
                user.setEmail(email);
                user.setFono(fono);
                user.setRut(rut);
                user.setPais(pais);
                user.setPassword(password);

                UsuariosCRUD cu = new UsuariosCRUD();
                String res = cu.Update(user);

                if (Integer.parseInt(res) != 0) {

                    request.setAttribute("update", "Se han actualizado sus datos correctamente");
                    request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                } else {
                    request.setAttribute("update", res);
                    request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("update", e.getMessage());
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN,"No puede ingresar a esta pagina");
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

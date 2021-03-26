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

public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn") != null) {

            response.setContentType("text/html;charset=UTF-8");
            String rut = request.getParameter("rut");
            String password = request.getParameter("password");
            try {
                UsuariosDAO user = new UsuariosDAO();
                UsuariosCRUD cu = new UsuariosCRUD();

                user.setRut(request.getParameter("rut"));
                user.setPassword(request.getParameter("password"));

                UsuariosDAO loginuser = cu.ReadOne(user);

                if (loginuser.getId() != 0) {
                    if (loginuser.getStatus() != 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("id", Integer.toString(loginuser.getId()));
                        session.setAttribute("name", loginuser.getName());
                        session.setAttribute("lastname", loginuser.getLastname());

                        request.setAttribute("msg", "Bienvenido Sr: " + loginuser.getName());
                        request.getRequestDispatcher("temas.jsp").forward(request, response);
                    } else {
                        request.setAttribute("msg", "Usted no esta activo en la plataforma");
                        request.getRequestDispatcher("login.jsp").forward(request, response);

                    }

                } else {
                    request.setAttribute("msg", "El nombre de usuario o contraseña no es valido");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (IOException | ServletException ex) {
                request.setAttribute("e", "Error: " + ex.getMessage());
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }else{
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "No se puede entrar a esta pagina");
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

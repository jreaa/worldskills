package Model;

import Config.Conexion;
import DAO.PostsDAO;
import DAO.TemasDAO;
import DAO.UsuariosDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostsCRUD implements CRUD {

    Conexion con = new Conexion();
    
    @Override
    public String Create(Object obj) {
        PostsDAO post = (PostsDAO) obj;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `posts` (`titulo`, `contenido`, `id_usuarios`, `id_temas`) VALUES ('" + post.getTitle() + "','" + post.getContenido()+ "','" + post.getId_usuarios() + "," + post.getId_tema() + ");";
        String res;

        try {
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);

            res = Integer.toString(ps.executeUpdate(query));

        } catch (ClassNotFoundException | SQLException e) {
            res = e.getMessage();
        }

        return res;

    }
        public String Comentario(int id_posts, int id_usuarios, String comentario) {
        id_usuarios = 0;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `comentarios` (`id_post`, `id_usuarios`, `contenido`) VALUES ('" + id_posts + "','" + id_usuarios + ",'" + comentario+ "');";
        String res;

        try {
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);

            res = Integer.toString(ps.executeUpdate(query));

        } catch (ClassNotFoundException | SQLException  e) {
            res = e.getMessage();
        }

        return res;

    }

    @Override
    public List<PostsDAO> Read() {

        Connection cn;
        PreparedStatement ps;
        String query = "SELECT * FROM posts";
        ResultSet rs;

        List<PostsDAO> listaPosts = new ArrayList<>();

        try {
            Class.forName(con.getDriver());
            cn = (com.mysql.jdbc.Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (com.mysql.jdbc.PreparedStatement) cn.prepareStatement(query);

            rs = (ResultSet) ps.executeQuery(query);
            while (rs.next()) {
                PostsDAO post = new PostsDAO();
                post.setId(Integer.parseInt(rs.getString("id")));
                post.setTitle(rs.getString("titulo"));
                post.setContenido(rs.getString("contenido"));
                post.setId_tema(Integer.parseInt(rs.getString("id_tema")));
                post.setId_usuarios(Integer.parseInt(rs.getString("id_usuarios")));
                //DAOUsuario user = new DAOUsuario(rs.getString("username"), rs.getString("password"));
                listaPosts.add(post);
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }

        return listaPosts;
    }

    @Override
    public String Update(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Delete(Object obj) {
        PostsDAO post = (PostsDAO) obj;
        Connection cn;
        PreparedStatement ps;
        String query = "DELETE FROM follow WHERE id_usuarios = "+ post.getId();
        String res;
        
        try{
            Class.forName(con.getDriver());
            cn = (com.mysql.jdbc.Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (com.mysql.jdbc.PreparedStatement) cn.prepareStatement(query);
            res = Integer.toString(ps.executeUpdate());
        }
        catch(ClassNotFoundException | SQLException ex){
            res = ex.getMessage();
        }
        return res;
    }

    

}

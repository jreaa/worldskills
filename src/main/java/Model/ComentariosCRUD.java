
package Model;

import Config.Conexion;
import DAO.ComentariosDAO;
import DAO.TemasDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ComentariosCRUD implements CRUD {
    Conexion con = new Conexion();
    @Override
    public String Create(Object obj) {
        ComentariosDAO comentario = (ComentariosDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `comentarios` (`id_tema`, `id_usuarios`, `contenido`) VALUES ("+comentario.getId_tema()+","+comentario.getId_usuarios()+",'"+comentario.getContenido()+"')";
        String res;
        
        try{
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(),con.getUser(),con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            
            res = Integer.toString(ps.executeUpdate(query));
            
        }catch(ClassNotFoundException | SQLException e){
            res = e.getMessage();
        }
      
        return res;
        
    }


    public List<ComentariosDAO> Read(Object obj) {
        ComentariosDAO comtmp = (ComentariosDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "SELECT * FROM comentarios where id_tema ="+ comtmp.getId_tema();
        ResultSet rs;

        List<ComentariosDAO> listacomentarios = new ArrayList<>();

        try {
            Class.forName(con.getDriver());
            cn = (com.mysql.jdbc.Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (com.mysql.jdbc.PreparedStatement) cn.prepareStatement(query);

            rs = (ResultSet) ps.executeQuery(query);
            while (rs.next()) {
                ComentariosDAO comentario = new ComentariosDAO();
                comentario.setId(Integer.parseInt(rs.getString("id")));
                comentario.setId_tema(Integer.parseInt(rs.getString("id_tema")));
                comentario.setId_usuarios(Integer.parseInt(rs.getString("id_usuarios")));
                comentario.setContenido(rs.getString("contenido"));

                //DAOUsuario user = new DAOUsuario(rs.getString("username"), rs.getString("password"));
                listacomentarios.add(comentario);
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }

        return listacomentarios;
    }

    @Override
    public String Update(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Delete(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

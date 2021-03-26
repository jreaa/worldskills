package Model;

import Config.Conexion;
import DAO.FollowDAO;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Follow implements CRUD {
    Conexion con = new Conexion();
    public FollowDAO Read(int id) {
        Connection connection;
        PreparedStatement pst;
        String query = "SELECT * FROM follow WHERE id_usuario = " + id;
        ResultSet rs;
        FollowDAO follow = new FollowDAO();

        try {
            Class.forName(con.getDriver());
            connection = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            pst = (PreparedStatement) connection.prepareStatement(query);

            rs = (ResultSet) pst.executeQuery(query);
            while (rs.next()) {
                follow.setId_tema(Integer.parseInt(rs.getString("id_tema")));
                follow.setId_usuarios(Integer.parseInt(rs.getString("id_usuarios")));
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }
        return follow;
    }
     public List<FollowDAO> Readtwo(int id, int id_tema) {
        Connection connection;
        PreparedStatement pst;
        String query = "SELECT * FROM follow WHERE id_usuario = " +id+"and id_tema = "+id_tema;
        ResultSet rs;
        
        List<FollowDAO> listaFollow = new ArrayList<>();

        try {
            Class.forName(con.getDriver());
            connection = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            pst = (PreparedStatement) connection.prepareStatement(query);

            rs = (ResultSet) pst.executeQuery(query);
            while (rs.next()) {
                FollowDAO follow = new FollowDAO();
                follow.setId(Integer.parseInt(rs.getString("id")));
                follow.setId_tema(Integer.parseInt(rs.getString("id_tema")));
                follow.setId_usuarios(Integer.parseInt(rs.getString("id_usuarios")));
                
                listaFollow.add(follow);
                
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }
        return listaFollow;
    }

    @Override
    public String Create(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Update(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Delete(Object obj) {
        FollowDAO follow = (FollowDAO)obj;
        Connection connection;
        PreparedStatement pst;
        String query = "delete from follow where id_usuarios ="+follow.getId_usuarios()+" and id_tema ="+follow.getId_tema();
        String respuesta;
        
        try{
            Class.forName(con.getDriver());
            connection = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            pst = (PreparedStatement) connection.prepareStatement(query);
            respuesta = Integer.toString(pst.executeUpdate());
        }
        catch(ClassNotFoundException | SQLException ex){
            respuesta = ex.getMessage();
        }
        return respuesta;
    }
}

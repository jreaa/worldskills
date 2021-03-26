
package Model;

import Config.Conexion;
import DAO.PostsDAO;
import DAO.TemasDAO;
import DAO.UsuariosDAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class TemasCRUD implements CRUD{
    Conexion con = new Conexion();
    @Override
    public String Create(Object obj) {
        TemasDAO temas = (TemasDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `temas` (`title`, `description`, `id_usuarios`) VALUES ('"+temas.getTitle()+"','"+temas.getDescription()+"',"+temas.getId_usuarios()+")";
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
    public String Follow(int id_tema,int id_usuarios) {
        
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `follow` (`id_usuarios`, `id_tema`) VALUES ("+id_usuarios+","+id_tema+");";
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


    @Override
    public List<TemasDAO> Read() {
        Connection cn;
        PreparedStatement ps;
        String query = "SELECT * FROM temas";
        ResultSet rs;

        List<TemasDAO> listaTemas = new ArrayList<>();

        try {
            Class.forName(con.getDriver());
            cn = (com.mysql.jdbc.Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (com.mysql.jdbc.PreparedStatement) cn.prepareStatement(query);

            rs = (ResultSet) ps.executeQuery(query);
            while (rs.next()) {
                TemasDAO tema = new TemasDAO();
                tema.setId(Integer.parseInt(rs.getString("id")));
                tema.setTitle(rs.getString("title"));
                tema.setDescription(rs.getString("description"));
                tema.setId_usuarios(Integer.parseInt(rs.getString("id_usuarios")));
                //DAOUsuario user = new DAOUsuario(rs.getString("username"), rs.getString("password"));
                listaTemas.add(tema);
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }

        return listaTemas;
    }

    @Override
    public String Update(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Delete(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}


package Model;

import Config.Conexion;
import DAO.UsuariosDAO;
import com.mysql.jdbc.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Usuaria
 */

public class UsuariosCRUD implements CRUD{
    Conexion con = new Conexion();
    @Override
    public String Create(Object obj) {
        UsuariosDAO user = (UsuariosDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `usuarios` (`name`, `lastname`, `rut`, `fono`, `email`, `password`, `pais`) VALUES ('"+user.getName()+"','"+user.getLastname()+"','"+user.getRut()+"','"+user.getFono()+"','"+user.getEmail()+"','"+user.getPassword()+"','"+user.getPais()+"');";
        String resp;
        try{
            
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            /*
            ps.setString(1, user.getName());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getRut());
            ps.setString(4, user.getFono());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getPassword());
            ps.setString(7, Boolean.toString(user.getStatus()));
            ps.setString(8, user.getPais());*/
            
            resp = Integer.toString(ps.executeUpdate(query));
            
        }catch(ClassNotFoundException | SQLException e ){
            resp = e.getMessage();
        }
        return resp;
        
    }

    @Override
    public List<?> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public UsuariosDAO Read(int id){
        Connection cn;
        PreparedStatement ps;
        String query = "SELECT * FROM usuarios WHERE id = " +id;
        ResultSet rs;
        UsuariosDAO user = new UsuariosDAO();
        
        try{
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            
            rs = (ResultSet) ps.executeQuery(query);
            while(rs.next()){
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setName(rs.getString("name"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setRut(rs.getString("rut"));
                user.setFono(rs.getString("fono"));
                user.setPais(rs.getString("pais"));
                user.setStatus(Integer.parseInt(rs.getString("status")));
                user.setPassword(rs.getString("password"));
            }
            rs.close();
        }
        catch(SQLException | ClassNotFoundException e){
            e.getMessage();
        }
        return user;
    }
    public UsuariosDAO ReadOne(Object obj) {
        UsuariosDAO user1 = (UsuariosDAO)obj;
        Connection cn;
        PreparedStatement ps;
        ResultSet rs;
        String query = "SELECT * FROM usuarios WHERE rut = '" + user1.getRut() + "' AND password = '" + user1.getPassword() + "'";
        UsuariosDAO user = new UsuariosDAO();
        
        try{
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            
            rs = (ResultSet) ps.executeQuery(query);
            while(rs.next()){
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setName(rs.getString("name"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setRut(rs.getString("rut"));
                user.setFono(rs.getString("fono"));
                user.setPais(rs.getString("pais"));
                user.setStatus(Integer.parseInt(rs.getString("status")));
                user.setPassword(rs.getString("password"));
            }
            rs.close();
        }
        catch(SQLException | ClassNotFoundException e){
            e.getMessage();
        }
       return user;
    }
    
    @Override
    public String Update(Object obj) {
        UsuariosDAO user = (UsuariosDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "UPDATE usuarios SET  name = '"+user.getName()+"', lastname ='"+user.getLastname()+"', rut = '"+user.getRut()+"', fono='"+user.getFono()+"', email = '"+user.getEmail()+"', password = '"+user.getPassword()+"', pais = '"+user.getPais()+"' WHERE id = " + user.getId();
        String res;
        
        try{
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            res = Integer.toString(ps.executeUpdate());
        }
        catch(SQLException | ClassNotFoundException ex){
            res = ex.getMessage();
        }
        return res;
    }
    public String UpdateOne(int id, int status) {
        Connection cn;
        PreparedStatement ps;
        String query = "UPDATE usuarios SET  status = "+status+" WHERE id = " + id;
        String res;
        
        try{
            Class.forName(con.getDriver());
            cn = (Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (PreparedStatement) cn.prepareStatement(query);
            res = Integer.toString(ps.executeUpdate());
        }
        catch(SQLException | ClassNotFoundException e){
            res = e.getMessage();
        }
        return res;
    }

    @Override
    public String Delete(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

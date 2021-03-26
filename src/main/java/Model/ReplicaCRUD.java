
package Model;

import Config.Conexion;
import DAO.ComentariosDAO;
import DAO.ReplicaDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplicaCRUD implements CRUD {
    Conexion con = new Conexion();
    @Override
    public String Create(Object obj) {
        ReplicaDAO replica = (ReplicaDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "INSERT INTO `replica` (`id_usuario`, `id_usuario_replica`,`id_comentario`, `contenido`) VALUES ("+replica.getId_usuario()+","+replica.getId_usuario_replica()+","+replica.getId_comentario()+",'"+replica.getConetindo()+"')";
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
    
    public List<ReplicaDAO> Read(Object obj) {
        ReplicaDAO comtmp = (ReplicaDAO)obj;
        Connection cn;
        PreparedStatement ps;
        String query = "SELECT * FROM replica where id_comentario ="+ comtmp.getId_comentario();
        ResultSet rs;

        List<ReplicaDAO> listareplicas = new ArrayList<>();

        try {
            Class.forName(con.getDriver());
            cn = (com.mysql.jdbc.Connection) DriverManager.getConnection(con.getUrl(), con.getUser(), con.getPass());
            ps = (com.mysql.jdbc.PreparedStatement) cn.prepareStatement(query);

            rs = (ResultSet) ps.executeQuery(query);
            while (rs.next()) {
                ReplicaDAO replica = new ReplicaDAO();
                replica.setId(Integer.parseInt(rs.getString("id")));
                replica.setId_comentario(Integer.parseInt(rs.getString("id_comentario")));
                replica.setId_usuario(Integer.parseInt(rs.getString("id_usuario")));
                replica.setId_usuario_replica(Integer.parseInt(rs.getString("id_usuario_replica")));
                replica.setConetindo(rs.getString("contenido"));

                //DAOUsuario user = new DAOUsuario(rs.getString("username"), rs.getString("password"));
                listareplicas.add(replica);
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.getMessage();
        }

        return listareplicas;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}


package DAO;


public class ReplicaDAO {
    private int id_usuario, id_usuario_replica, id_comentario, id;
    private String conetindo;

    public ReplicaDAO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_usuario_replica() {
        return id_usuario_replica;
    }

    public void setId_usuario_replica(int id_usuario_replica) {
        this.id_usuario_replica = id_usuario_replica;
    }

    public int getId_comentario() {
        return id_comentario;
    }

    public void setId_comentario(int id_comentario) {
        this.id_comentario = id_comentario;
    }

    public String getConetindo() {
        return conetindo;
    }

    public void setConetindo(String conetindo) {
        this.conetindo = conetindo;
    }
    
}

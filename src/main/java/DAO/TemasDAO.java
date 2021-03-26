
package DAO;


public class TemasDAO {
    private int id, id_usuarios;
    private String title, description;

    public TemasDAO() {
        this.id = id;
        this.id_usuarios = id_usuarios;
        this.title = title;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuarios() {
        return id_usuarios;
    }

    public void setId_usuarios(int id_postulante) {
        this.id_usuarios = id_postulante;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}

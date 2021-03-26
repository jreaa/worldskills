
package Config;
        
public class Conexion {
    private final String url, driver, user, pass;

    public Conexion() {
        this.url = "jdbc:mysql://localhost:3306/test";
        this.driver = "com.mysql.jdbc.Driver";
        this.user = "root";
        this.pass = "";
    }

    public String getUrl() {
        return url;
    }

    public String getDriver() {
        return driver;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }
    
}

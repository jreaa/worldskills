
package Model;

import java.util.List;

public interface CRUD {
    public String Create(Object obj);
    public List<?> Read();
    public String Update(Object obj);
    public String Delete(Object obj);
}

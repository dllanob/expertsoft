package expertsoft;
import java.sql.*;

public class conectar {
Connection conect = null;
   public Connection conexion(){
        try {
           Class.forName("org.gjt.mm.mysql.Driver");
           conect = DriverManager.getConnection("jdbc:mysql://localhost/expertsoft","root","");
           //System.out.println("Conectado");
        }catch(Exception e){
            System.out.println("Error--Error de Conexion");
        }
        return conect;
   }
}
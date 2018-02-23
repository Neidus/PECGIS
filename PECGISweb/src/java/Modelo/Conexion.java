package Modelo;

import javax.swing.*; 
import java.sql.*; 
import org.postgresql.Driver;

public class Conexion extends Usuario{

static Connection conexion; 
static Statement sentencia; 
public ResultSet resultado;


public static void conecta() { 
try { 
Class.forName("org.postgresql.Driver"); 
} catch (Exception e) { 
JOptionPane.showMessageDialog(null, "No se pudo cargar el puente JDBC-ODBC."); 
return; 
} 
try { 
conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","1234"); 
sentencia = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
//JOptionPane.showMessageDialog(null, "Conexión establecida"); 
} catch (Exception er) { 
JOptionPane.showMessageDialog(null, "Error de conexion"); 
} 
}

public void conectar() { 
    try
    {
        Class.forName("org.postgresql.Driver"); 
        conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","1234"); 
        sentencia = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
        System.out.println("Se ha conectado");
    }
    catch(Exception e){
    System.out.println("No se ha conectado:" + e);}
}

public static void alta(String cadena) { 
    if (conexion == null) { 
        conecta(); 
    } 
    try { 
        sentencia.execute(cadena); 
        } catch (Exception er) { 
             JOptionPane.showMessageDialog(null, "Lo sentimos su operación solicitada no se pudo realizar debido a un error de " + er); 
        } 
    } 

    public boolean validar(String sql){
        java.sql.ResultSet hoja_resultado = null;
        if (conexion == null) { 
            conecta(); 
        } 
        try {
            
            
            hoja_resultado = sentencia.executeQuery(sql); // ejecuta la instrucción SQL y almacena el resultado en una variable.
            if  (hoja_resultado.next()){ // Si los datos son correctos
                return true;
            }
            else{ // no esta registrado en la base de datos
                return false;
            }
        } catch (Exception er) {
            System.out.println("Error al consultar");
            return false;
        }
    }
    
    public boolean esValido(String nombre, String pass) {
        
        boolean existe = false;
        try
        {
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery("Select * from \"usuario\" where usuario='"+ nombre +"' and pass='"+ pass +"'"); //ejecuta el SQL
            existe = resultado.next(); // Si da un resultado, el usuario existe
        }catch(Exception e){
            System.out.println("No lee de la tabla:" + e);
        }
        return(existe);
    }
    
    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (Exception e){}
    }
}
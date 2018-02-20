/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.postgresql.util.PGobject;

/**
 *
 * @author Varela
 */
public class CargarGeoJSON extends HttpServlet {
    
    //Variables para la llamada a la BBDD. Esto luego ira en en Modelo de Datos
    //en su correspondiente clase.
    private Connection connection;
    private Statement set;
    private ResultSet rs;

    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
        
        System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");

		try {

			Class.forName("org.postgresql.Driver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;

		}

		System.out.println("PostgreSQL JDBC Driver Registered!");

		connection = null;

		try {

			connection = DriverManager.getConnection(
					"jdbc:postgresql://127.0.0.1:5432/mbbdda", "postgres",
					"1234");

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;

		}
        try {
            try {
                // Revisar https://postgis.net/docs/manual-2.4/ch06.html#idm2964 donde se supone que da la solucion pero no funciona
                ((org.postgresql.PGConnection)connection).addDataType("geometry", (Class<? extends PGobject>) Class.forName("org.postgis.PGgeometry"));
            } catch (SQLException ex) {
                Logger.getLogger(CargarGeoJSON.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CargarGeoJSON.class.getName()).log(Level.SEVERE, null, ex);
        }


		if (connection != null) {
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}
        
                
        
       
    }

    /*
        Se ejecuta tras el init cada vez que lo llamamos.
    */
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
       
        System.out.println("Estoy en service");
         //Hacemos la consulta para obtener los datos de la BBDD en formato objeto GeoJSON
        try
        {
            set = connection.createStatement();
            rs = set.executeQuery("SELECT ST_AsGeoJSON(geom) FROM rutas;");
             System.out.println("Estoy en service2");
             
             String objetosGeoJSON=""; 
             if (rs.next()) {   //Guardamos el conjunto de elementos geométricos en el String
                                // que será devuelto al jsp
                 objetosGeoJSON += rs.getString(1) + "\n";
                 while (rs.next())
                 {
                     objetosGeoJSON += "," + rs.getString(1) + "\n";   
                 }
                 
                 System.out.println(objetosGeoJSON);
             } else {
                 System.out.println("No hay puntos!!!!"); //La consulta esta vacía de elementos
                 
             }
            //cerramos las conexiones
            rs.close();
            set.close();
        }catch(Exception e){
            System.out.println("No lee de la tabla: "+ e);
        }
        //Mandamos el objeto a la página como respuesta para que lo 
        //pueda representar en la próxima actualización de la página
        //Para ello usaremos sesiones y mandaremos un atributo de la sesion con el mensaje generado anteriormente.
        res.sendRedirect(res.encodeRedirectURL("/PECGISweb/mapageojson.jsp"));
    }

    /*
    Se utiliza para parar la conexion con la BBDD. No implementado
    */
    public void destroy()
    {
        System.out.println("Estoy en destroy");
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelo.Intersecciones;
import Modelo.Zona;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fernando.garcia
 */
public class CalcularIntersecciones {
    
    Modelo.Ruta r;
    Modelo.Zona z;
    Modelo.Intersecciones i;
    
    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
       r = new Modelo.Ruta();
       z = new Modelo.Zona();
       i = new Modelo.Intersecciones();
       r.abrirConexion();
       z.abrirConexion();
       i.abrirConexion();
    }
    
    /*
        Se ejecuta tras el init cada vez que lo llamamos.
    */
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
        HttpSession sesion = req.getSession();
        
        //Esta parte carga la ruta elegida por el usuario
        
        String idRuta = req.getParameter("rutasDisponibles");  //obtenemos el id marcado de forma oculta por el usuario
        //System.out.print(idRuta);
        sesion.setAttribute("rutas", r.getRuta(idRuta)); //Obtenemos la ruta segun el id y la devolveremos a la pagina como atributo de sesion
        //System.out.println("Ruta: " + r.getRuta(idRuta));
        
        /*
        Esta parte obtiene el listado de zonas para que la pagina las cargue por si misma.
        El listado contiene para cada zona de la lista:
        - el id por si necesitamos debido a cualquier motivo no contemplado usarla para algo
        - el nivel de peligrosidad por si queremos mostrarlo de algun modo en la pagina
            para cada zona cuando la seleccionamos con el raton.
        - la ruta en formato geojson. La pagina cargara todas las rutas en el mapa.
        */
        
        List<Intersecciones> intersecciones = i.getListaIntersecciones();
        sesion.setAttribute("interseccionesUsuario", intersecciones);
        System.out.println("interseccion " + intersecciones.get(0).getNombrezona());
        
        /*
        Aqui tenemos que colocar el codigo necesario para el cálculo de la peligrosidad
        calculada y su devolucion. Para ello usaremos tanto la id de la ruta como de 
        todas las zonas que tenemos justo arriba
        */
        
        res.sendRedirect(res.encodeRedirectURL("/PECGISweb/calculopeligrosidad.jsp")); //Volvemos a la web
    }

    /*
    Se utiliza para parar la conexion con la BBDD.
    */
    public void destroy()
    {
        r.cerrarConexion();
        z.cerrarConexion();
        i.cerrarConexion();
    }

}

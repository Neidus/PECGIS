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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fernando.garcia
 */
public class CalcularIntersecciones extends HttpServlet{
    
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
        System.out.print("AQUI EMPIEZO EL SERVLET");
        String idRuta = req.getParameter("rutasDisponibles");  //obtenemos el id marcado de forma oculta por el usuario
        //System.out.print(idRuta);
        //sesion.setAttribute("rutas", r.getRuta(idRuta)); //Obtenemos la ruta segun el id y la devolveremos a la pagina como atributo de sesion
        //System.out.println("Ruta: " + r.getRuta(idRuta));
        
        
        //AQUI PONEMOS TODO EL CALCULO DE LAS INTERSECCIONES Y PELIGROSIDAD
        
        //Primer paso
        List<String> idsZonas = z.getListaIds();
        //Segundo paso
        
        List<Intersecciones> listaIntersecciones = i.getListaIntersecciones(idRuta, idsZonas);
        
        //Preparacion para paso 3 mostramos lo obtenido:
        System.out.println("Datos de las INTERSECCIONES");
        int constante= 60; // 60 km por hora 
        double total = 0; // inicialización de total; 
        for (int i=0; i< listaIntersecciones.size(); i++) {
            System.out.println("Interseccion numero: " + (i+1));
            System.out.println("    Distancia (km) que coincide: " + Double.valueOf(listaIntersecciones.get(i).getDistancia()));
            System.out.println("    Nivel de peligrosidad: " + Integer.valueOf(listaIntersecciones.get(i).getPeligrosidad()));
            double horas = Double.valueOf(listaIntersecciones.get(i).getDistancia())/constante ; // tiempo que tardo en recorrer la zona 
            double nivel = horas*Integer.valueOf(listaIntersecciones.get(i).getPeligrosidad()); // nivel de CHUNGUICIDAD
            total = nivel + total; // total de peligrosidad
            System.out.print("total: "+ total);
        }
        
        sesion.setAttribute("listaIntersecciones", listaIntersecciones); //Preparamos las intersecciones para pasarlas al jsp
        sesion.setAttribute("peligrosidadTotal", total); //Preparamos el peligro total para el jsp.
              
        
        /*
        Pasos a seguir:
        
        1- Obtener la lista de ids de las zonas que tenemos en la bbdd.
        
        Consulta: SELECT gid_serial from zonas;
        
        
        2- Hacemos de forma iterativa la consulta de interseccion entre la id
            de nuestra ruta seleccionada y cada id de las zonas antes conseguidas.
            Nos interes obtener la distancia en kilometros que intersecciona la ruta
            con una zona y el nivel de peligrosidad de dicha interseccion.
            Guardamos estos 2 datos en una lista.
        
            Consulta:   SELECT ST_Length_Spheroid(ST_Intersection(rutas.geom, zonas.geom),
                                'SPHEROID["WGS 84",6378137,298.257223563]')/1000, zonas.peligrosidad
                        FROM rutas, zonas
                        WHERE rutas.gid_serial=3 and zonas.gid_serial=6;
        
       3- Aplicamos la formula de calculo de peligrosidad con lo obtenido de paso 2.
            Aplicariamos de forma iterativa por cada dato obtenido en paso 2.
            Ya que es tiempo * nivel de peligrosidad de la zona, nos inventamos una velocidad
            y con la distancia que tenemos ya sacamos un tiempo.
        
        
        */
        
        /*
        
        
        List<Intersecciones> intersecciones = i.getListaIntersecciones();
        sesion.setAttribute("interseccionesUsuario", intersecciones);
        System.out.println("interseccion " + intersecciones.get(0).getNombrezona());
        */
        
        
        
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

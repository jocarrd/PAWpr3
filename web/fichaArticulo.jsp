<%-- 
    Document   : fichaArticulo
    Created on : 16-mar-2021, 12:12:28
    Author     : usuariolocal
--%>


<%@page import="paw.model.Articulo"%>
<%@page import="paw.bd.GestorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String nombre=request.getParameter("cart") ;
            GestorBD gestor = new GestorBD();
            Articulo c = gestor.getArticulo(nombre);
            String fotografia="img/fotosElectr/"+c.getFoto();
            
            %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title><%= c.getNombre() %></title>
    <meta name="description" content="La descripcion del producto aqui !!" lang="es-ES">
    <meta name="keywords" content="fabricante y tipo de electrodomésticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="css/fichaProducto.css" rel="stylesheet" media="all" type="text/css">
  </head>

  <body >
    <div class="logo"><a href="index.html"><img src="img/LogoElectrosa200.png" border="0"></a></div>

    <div class="sombra">
      <div class="nucleo">
        <div id="lang">
          <a href="index.html">Español</a> &nbsp; | &nbsp; <a href="index.html">English</a>
        </div>
      </div>
    </div>

    <div class="barra_menus">	
      <div class="pestanias">
        <div class="grupoPestanias">
          <div class="pestaniaSel">Para usuarios</div>
          <div class="pestaniaNoSel"><a href="admin/index.html">Intranet</a></div>
        </div>
      </div>

      <div id="menu" >
        <ul>
          <li>
            <a href="index.html">Sobre electrosa<br/><img src="img/Home4.png"/></a>
          </li>
          <li>
            <a href="index.html">Dónde estamos<br/><img src="img/map.png"/></a>
          </li>
          <li>
            <a href="catalogo.jsp">Hojear catálogo<br/><img src="img/catalog.png"/></a>
          </li>
          <li>
            <a href="index.html">Usuario registrado<br/><img src="img/registrado.png"/></a>
          </li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div> 

     
    
    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
            
            
          <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
          <a href="catalogo.jsp" title="Hojear catalogo">Hojear cat&aacute;logo</a>&nbsp; | &nbsp; 
          <%= nombre %>	<!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->	
        </div>

        <div class="contenido">
           
            
            
          <h1><%= nombre %></h1>
          <div class="fotoDetalle">
            <img src=<%=fotografia%> alt="Mie/080FO" longdesc="Frigorífico-Congelador KT 3540 SN ed - Miele">
          </div>
          <div class="datosDetalle">
              <h2><%= c.getNombre() %></h2>
            <p><%= c.getDescripcion() %></p>
            <div class="precio">
              <span>Precio <%= c.getPvp() %> &euro;</span>	
            </div>
            <div class="carroDetalle" >
              <img src="img/AddCart2-50.png" title="Añadir a mi pedido en realización">
            </div>
          </div>
          <div class="clear"></div>
        </div>
      </div>

      <div class="separa"></div>

      <div class="pie">
        <span class="pie_izda">
          <a href="mailto:francisco.garcia@unirioja.es">Contacto</a> &nbsp; | &nbsp; <a href="mapa.html">Mapa</a> </span>
        <span class="pie_dcha">
          &copy; 2012 Francisco J. García Izquierdo  </span>
        <div class="clear"></div>  
      </div>

    </div>
  </body>
</html>



<%@page import="paw.model.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="paw.bd.GestorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Electrosa >> cat&aacute;logo</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="css/catalogoMosaico.css" rel="stylesheet" media="all" type="text/css">
    <!--    <link href="css/catalogoLista.css" rel="stylesheet" media="all" type="text/css"> -->
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
          <a href="generica.html" title="Hojear catalogo">Hojear catalogo</a>	<!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->	
        </div>
        <div class="contenido">
          <h1>Nuestros productos</h1>
          <p>Puede buscar los productos que necesite en nuestro cat&aacute;logo. Lo hemos organizado por marcas, tipo de electrodom&eacute;stico y rango de precios. Lo precios indicados en rojo corresponden a ofertas. </p>
          <div class="filtroCatalogo">
            <form name="filtroCatalogo" id="filtroCatalogo" action="">

              <label for="tipo">Tipo :</label>
              <select name="tipo" id="tipo">
                <option value="-1">- Cualquiera -</option>
                <option value="Aspirador">Aspiradores</option>
                <option value="Campana">Campanas</option>
                <option value="Cocina">Cocinas</option>
                <option value="Frigorifico">Frigoríficos</option>
                <option value="Horno">Hornos</option>
                <option value="Lavadora">Lavadoras</option>
                <option value="Lavavajillas">Lavavajillas</option>
                <option value="Microondas">Microondas</option>
                <option value="Placa">Placas</option>
              </select>

              <label for="fabricante">Fabricante :</label>
              <select name="fabricante" id="fabricante">
                <option value="-1">- Cualquiera -</option>
                <option value="Edesa">Edesa</option>
                <option value="Fagor">Fagor</option>
                <option value="Miele">Miele</option>
              </select>

              <label for="precio">Precio :</label>
              <select name="precio" id="precio">
                <option value="-1">- Cualquiera -</option>
                <option value="10-50">10-50 &euro;</option>
                <option value="50-100">50-100 &euro;</option>
                <option value="100-200">100-200 &euro;</option>
                <option value="200-500">200-500 &euro;</option>
                <option value="500-1000">500-1.000 &euro;</option>
                <option value="1000">Mas de 1.000 &euro;</option>
              </select>


              <input name="buscar" id="buscar" type="image" title="Buscar" src="img/search25.png" alt="Buscar">

            </form>

            <div class="modovisual">
              <a href="catalogo.jsp>Mosaico</a> &nbsp; | &nbsp; <a href="catalogo.html">Lista</a>
            </div>
            <div class="clear"></div>
          </div>

          <%
                      GestorBD gbd = new GestorBD();
                      List<Articulo> arts = gbd.getArticulos();
                      
            %>
      
          
          
          <div class="resumResul redondeo">
              Encontrados <%arts.size();%> artículos.
          </div>

          <ul class="resultBusqueda">
            
              
              <% int i =1;for (Articulo a : arts) {%>
                <%
                        String fotografia="img/fotosElectr/"+a.getFoto();
                       String oferta=" ";
                        %>
              <% if(i%3==0) oferta="oferta"; %>
              <li class="item redondeo">
              <div class="foto">
                  <a href="catalogo.jsp"><img src=<%= fotografia%> alt="Mie/088FO" longdesc="<%=a.getDescripcion()%>" width="80"></a>
              </div>
              <div class="datos">
                <span><%= a.getNombre()%></span>
                <div class="precio">
                  <span class=<%=oferta%>  > <%=a.getPvp()%> &euro;</span>
                </div>
                <div class="carro">
                  <img src="img/shopcartadd_16x16.png" title="Añadir a mi carro de la compra">
                </div>
              </div>			  
              <div class="codigo"><a href="catalogo.jsp"><%=a.getCodigo()%></a></div>
            </li>			

            
              
                  <%i++; }%>	
            
              
              
              
          </ul>		
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

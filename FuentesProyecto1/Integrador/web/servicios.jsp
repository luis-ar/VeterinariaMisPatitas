<%-- 
    Document   : servicios.jsp
    Created on : 14 set. 2023, 09:25:32
    Author     : luisd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <link href="css/estiloServicios.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezado.jspf" %>


        <% String[][] matriz = {{"Consulta", "Proporcionar consultas médicas para evaluar la salud general de los animales, diagnosticar enfermedades y ofrecer recomendaciones de cuidado."}, {"Vacunaciones", "Administrar vacunas esenciales para prevenir enfermedades comunes en animales, como la rabia, la parvovirosis y la leptospirosis."}, {"Cirugías", "Realizar cirugías programadas y de emergencia, como esterilizaciones, castraciones, cirugía de tejidos blandos y procedimientos ortopédicos."}, {"Laboratorio", "Realizar análisis de sangre, orina, heces y otros exámenes de laboratorio para diagnosticar enfermedades y trastornos."}}; %>
                  
        <div class="contenedorServicio">
            <h1 class="tituloServicio">Nuestros Servicios</h1>

        <section class="experts">
            <% for (int i = 0; i <matriz.length; i++) { %>

            <div class="card">
                <% for (int j = 0; j < matriz[i].length; j++) { %>

                <div class="face front">
                    <img src="img/serviciosImagen<%= i %>.jpg" />
                    <h3 class="n-expert"><%= matriz[i][0] %></h3>
                </div>
                <div class="face back">
                    <h3><%= matriz[i][0] %></h3>
                    <p>
                        <%= matriz[i][1] %>
                    </p>
                    <div class="link"></div>
                </div>
                <% } %>

            </div>

            <% } %>

        </section>
        </div>
        
            
       
        <%@include file="WEB-INF/jspf/pie.jspf" %>    

    </body>
</html>

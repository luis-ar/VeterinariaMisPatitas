<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <title>Nosotros</title>
        <link href="css/estiloContacto.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezado.jspf" %>

        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="container">    
            <%@include file="WEB-INF/jspf/formContacto.jspf" %>
            <%@include file="WEB-INF/jspf/infoEmpresa.jspf" %>
        </div>

        <%@include file="WEB-INF/jspf/pie.jspf" %>    
    </body>
</html>

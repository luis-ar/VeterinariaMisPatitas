<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <title>Nosotros</title>
        <link href="css/estiloContacto.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoUsuario.jspf" %>

        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container">    

            <section class="contact-form">
                <h2>Formulario de Contacto</h2>
                <form action="https://formsubmit.co/luisdemaryori@gmail.com" method="post" id="miFormulario">
                    <input type="hidden" value="${usuario.idUsuario}" name="id" />
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input name="nombre" type="text" id="nombre"  value="${usuario.nombreUsuario}" required/>
                    </div>
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input type="text" id="telefono" name="telefono" required value="${usuario.telefono}">
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" id="email" name="email" required value="${usuario.correoUsuario}">
                    </div>
                    <input type="hidden" name="_captcha" value="false" />
                    <input
                        type="hidden"  
                        name="_next"
                        value="http://localhost:8080/Historial/indexUsuario.jsp"
                        />
                    <div class="form-group">
                        <label>Mensaje:</label>
                        <textarea name="mensaje" id="mensaje" maxlength="240" required></textarea>
                    </div>
                    <button type="submit">Enviar Mensaje</button>

                </form>
            </section>

            <%@include file="WEB-INF/jspf/infoEmpresa.jspf" %>
        </div>

        <%@include file="WEB-INF/jspf/pie.jspf" %>    
        <script>
            // Agrega un evento load al formulario
            document.getElementById('miFormulario').addEventListener('load', function () {
                // Realizar la redirección después de enviar el formulario
                window.location.href = 'https://www.youtube.com/watch?v=a6iADKi3mPw';
            });
        </script>
    </body>
</html>

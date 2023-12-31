<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
        <script>
            const pase = localStorage.getItem('idUsuario');
            if (pase < 0 || pase==null) {

                const codigoUsuario = ${codigoUsuario}; // Recuperar el valor de Java y asignarlo a una variable de JavaScript
                localStorage.setItem('codigoUsuario', codigoUsuario); // Almacenar en localStorage
                console.log("desde el index usuario", codigoUsuario);
            }

        </script>
    </head>
    <body>
        <!-- HEADER -->
        <header class="header">
            <!-- BARRA DE NAVEGACION -->
            <%@include file="WEB-INF/jspf/encabezadoUsuario.jspf" %>
            <!-- REFRANES -->
            <div class="header__texto">
                <h2 class="no-margin">Bienvenido a Mis Patitas</h2>
                <p class="no-margin">Ofrecemos los mejores servicios para tu mascota</p>
            </div>
        </header>
        <!-- SECCION DE LO QUE OFRECEMOS -->
        <section>
            <div class="contenedor">
                <div class="caja2">
                    <h3 class="no-margin">Lo que ofrecemos</h3>
                </div>
            </div>
        </section>
        <!-- SECCION DE REFRAN Y BOTON DE CONTACTO -->
        <section>
            <div class="contenedor">
                <div class="caja">
                    <div class="caja__texto">
                        <h3>Calidad y Experiencia</h3>
                        <p>"El cuidado de tus mascotas es nuestra especialidad, ¡porque su bienestar es nuestra prioridad!"</p>
                    </div>
                    <div class="caja__contacto">
                        <a class="boton" href="#">Contactenos</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- SECCION IMAGENES -->
        <section class="contenedor">
            <div class="img-efecto">
                <img src="img/mascota1.jpg" alt="">
                <img src="img/mascota2.jpg" alt="">
                <img src="img/mascota3.jpg" alt="">
                <img src="img/mascota4.jpg" alt="">
                <img src="img/mascota5.jpg" alt="">
            </div>
        </section>
        <!-- SECCION DE SERVICIO -->
        <section class="servicio">
            <div class="contenedor">
                <div class="caja3">
                    <div class="caja3__texto">
                        <h4>Servicios de Calidad</h4>
                        <p>"En nuestra veterinaria, ofrecemos un servicio de calidad excepcional para garantizar la salud y felicidad de tus queridas mascotas. Confía en nuestros expertos cuidadores para brindarles la atención que se merecen".</p>
                        <div class="caja3__enlace">
                            <a class="boton" href="#">Servicios</a>
                        </div>
                    </div>
                    <div class="caja3__imagen">
                        <img src="img/gato.jpg" alt="gato">
                    </div>
                </div>
            </div>
        </section>
        <!-- SECCION GALERIA -->
        <section class="galeria">
            <img class="galeria_img1" src="img/servi1.jpg" alt="">
            <img class="galeria_img2" src="img/servi2.jpg" alt="">
            <img class="galeria_img3" src="img/servi3.jpg" alt="">
            <img class="galeria_img4" src="img/servi4.jpg" alt="">
            <img class="galeria_img5" src="img/servi5.jpg" alt="">
        </section>
        <!-- SECCION DE NUESTRAS CARACTERISTICAS -->
        <section>
            <div class="contenedor">
                <div class="caja2">
                    <h3 class="no-margin">Nuestras Caracteristicas</h3>
                </div>
            </div>
        </section>
        <!-- CONTENIDO DE NUESTRAS CARACTERISITCAS -->
        <section class="caracteristica">
            <div class="contenedor caracteristicas">
                <div class="carac_1">
                    <h4 class="centrar-texto">Cuidado Veterinario</h4>
                    <p>En nuestra veterinaria, entendemos que cada mascota es única y especial. Nos enorgullece ofrecer un cuidado veterinario excepcional que va más allá del tratamiento médico. Es un compromiso con el bienestar y la felicidad de tus fieles amigos de cuatro patas.</p>
                </div>
                <div class="carac_2">
                    <h4 class="centrar-texto">Capacitacion</h4>
                    <p>En nuestra veterinaria, no solo nos preocupamos por la salud de tus mascotas, sino que también creemos en empoderar a nuestros clientes con conocimientos y recursos para el cuidado responsable de sus amigos peludos.</p>
                </div>
                <div class="carac_3">
                    <img src="img/perroInicio.jpg" alt="perro">
                </div>
                <div class="carac_4">
                    <h4 class="centrar-texto">Tratamientos</h4>
                    <p>Cuando nuestras queridas mascotas se enfrentan a la enfermedad, merecen el mejor cuidado posible. En nuestra clínica veterinaria, nos dedicamos a brindar tratamientos compasivos y efectivos para ayudar a las mascotas a recuperar su salud y vitalidad.</p>
                </div>
                <div class="carac_5">
                    <h4 class="centrar-texto">Atencion</h4>
                    <p>Además, valoramos profundamente la relación con nuestros clientes. Sabemos que cada mascota es especial y que cada dueño tiene preocupaciones y preguntas únicas. Estamos disponibles para escucharte, responder tus dudas y brindarte apoyo en cada paso del camino.</p>
                </div>
            </div>
        </section>

        <!-- PIE DE PAGINA -->

        <%@include file="WEB-INF/jspf/pie.jspf" %>

    </body>
</html>

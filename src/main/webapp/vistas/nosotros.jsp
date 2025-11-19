<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nosotros - GreenTech</title>

<!-- Vinculación correcta con CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/estilos/nosotros.css">
</head>

<body>
	<!-- NAV SUPERIOR -->
	<nav>
		<div class="nav-left">
			🌱 <span>GreenTech</span>
		</div>
		<div class="nav-center">
			<a href="${pageContext.request.contextPath}/vistas/nosotros.jsp">Nosotros</a>
			<a href="${pageContext.request.contextPath}/vistas/mapa.jsp">Mapa</a>
			<a href="${pageContext.request.contextPath}/vistas/index.jsp">Estadística</a>
		</div>
		<div class="nav-right"></div>
	</nav>

	<!-- SECCION PARALLAX -->
	<section class="banner-nosotros">
		<div class="banner-text">
			<h1>GreenTech</h1>
			<p>Juntos hacemos del reciclaje una realidad sostenible</p>
		</div>
	</section>

	<!-- QUIÉNES SOMOS -->
	<section class="introduccion fullwidth">
		<h2>Quiénes somos</h2>
		<p>Nosotros somos alumnos de 4to año en la orientación de Técnicos
			en Computación del Instituto Técnico Nuestra Señora de Fátima.</p>
	</section>

	<!-- SOBRE EL PROYECTO -->
	<section class="proyecto fullwidth">
		<h2>Sobre el proyecto</h2>
		<p>El proyecto GreenTech se pensó con la intención de reducir
			residuos esparcidos por plazas, parques y sitios con gran
			acumulamiento de basura. GreenTech cuenta con 2 partes: la robótica,
			que a su vez se divide en el robot de movimiento y el estacionamiento
			del robot.</p>
	</section>

	<!-- VALORES -->
	<section class="valores fullwidth">
		<h2>Valores</h2>
		<ul>
			<li><strong>Compromiso:</strong> Trabajamos con dedicación para
				lograr nuestros objetivos.</li>
			<li><strong>Transparencia:</strong> Actuamos con claridad y
				honestidad en todas nuestras acciones.</li>
			<li><strong>Innovación:</strong> Buscamos constantemente nuevas
				soluciones para mejorar nuestros procesos.</li>
			<li><strong>Colaboración:</strong> Fomentamos el trabajo
				conjunto con todos los actores del reciclaje.</li>
		</ul>
	</section>

	<!-- BITÁCORA -->
	<section class="bitacora fullwidth">
		<h2>Bitácora</h2>
		<p>Seguimiento de los hitos y avances más importantes de nuestro
			proyecto GreenTech.</p>
		<ul>
			<li><strong>01/09/2025:</strong> Inicio del proyecto GreenTech.</li>
			<li><strong>05/09/2025:</strong> Definición del diseño inicial
				del robot recolector.</li>
			<li><strong>10/09/2025:</strong> Reunión con el equipo para
				planificación de tareas.</li>
			<li><strong>15/09/2025:</strong> Desarrollo del prototipo del
				robot de movimiento.</li>
			<li><strong>20/09/2025:</strong> Pruebas iniciales del prototipo
				en laboratorio.</li>
			<li><strong>25/09/2025:</strong> Ajustes en el sistema de
				sensores del robot.</li>
			<li><strong>30/09/2025:</strong> Desarrollo del sistema de
				estacionamiento automático.</li>
			<li><strong>05/10/2025:</strong> Pruebas piloto en espacios de
				la escuela.</li>
			<li><strong>10/10/2025:</strong> Primera presentación del
				proyecto a la comunidad educativa.</li>
		</ul>
	</section>


	<!-- CONTACTO -->
	<section class="contacto fullwidth">
		<h2>Contacto</h2>
		<p>
			Si querés comunicarte con nosotros, podés enviarnos un correo
			electrónico a: <strong>contacto@greentech.com.ar</strong><br> O
			llamarnos al: <strong>+54 11 1234-5678</strong><br> También
			podés encontrarnos en nuestra oficina: Calle Ficticia 123, Buenos
			Aires, Argentina
		</p>
	</section>

	<!-- JS externo -->
	<script src="<%=request.getContextPath()%>/js/nosotros.js"></script>
</body>
</html>


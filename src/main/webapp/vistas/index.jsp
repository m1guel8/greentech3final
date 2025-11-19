<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GreenTech</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/estilos/estilos.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<!-- NAV SUPERIOR -->
	<nav>
		<div class="nav-left">
			🌱 <span>GreenTech</span>
		</div>
		<div class="nav-center">
			<a href="${pageContext.request.contextPath}/vistas/nosotros.jsp">Nosotros</a>
			<a href="${pageContext.request.contextPath}/vistas/mapa.jsp">Mapa</a> <a
				href="${pageContext.request.contextPath}/vistas/index.jsp">Estadística</a>
		</div>
		<div class="nav-right"></div>
	</nav>

	<!-- CONTENEDOR PRINCIPAL -->
	<div class="container">
		<!-- COLUMNA IZQUIERDA -->
		<aside class="sidebar">
			<h2>Dispositivos</h2>
			<ul>
				<li>Parque NS</li>
				<li>Plaza MS</li>
				<li>Parque N</li>
			</ul>
		</aside>

		<!-- COLUMNA DERECHA -->
		<main class="content">
			<!-- BOTONES DE FILTRO -->
			<div class="filtros">
				<button onclick="cambiarVista('semanal')">Semanal</button>
				<button onclick="cambiarVista('mensual')">Mensual</button>
				<button onclick="cambiarVista('anual')">Anual</button>
			</div>

			<!-- CONTROLES SEMANALES -->
			<div class="semana-control">
				<button id="btn-anterior">Semana Anterior</button>
				<span id="semana-label">Semana Actual</span>
				<button id="btn-siguiente">Semana Siguiente</button>
			</div>


			<!-- GRAFICO -->
			<div class="grafico">
				<canvas id="chartBasura"></canvas>
			</div>
		</main>
	</div>

	<!-- Script -->
	<script src="<%=request.getContextPath()%>/js/script.js"></script>
</body>
</html>



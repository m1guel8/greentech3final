<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GreenTech - Mapa</title>

<!-- Leaflet -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css">
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/estilos/mapa.css">
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar">
		<div class="logo">🌱 GreenTech</div>
		<ul>
			<a href="${pageContext.request.contextPath}/vistas/nosotros.jsp">Nosotros</a>
			<a href="${pageContext.request.contextPath}/vistas/mapa.jsp">Mapa</a>
			<a href="${pageContext.request.contextPath}/vistas/index.jsp">Estadística</a>
		</ul>
		<button id="toggle-theme">🌙</button>
	</nav>

	<!-- Contenedor principal -->
	<main class="dashboard">
		<!-- Lista de parques -->
		<aside id="parques" class="card">
			<h2>📍 Parques con dispositivos</h2>
			<ul>
		
				<li data-lat="-34.6723227253168" data-lng="-58.45065990431022">Parque de la Ciudad</li>
				<li data-lat="-34.66256625077189" data-lng="-58.46001307103311">Lago Soldati</li>
				<li data-lat="-34.6173562514377" data-lng="-58.433078193753445">Parque Rivadavia</li>
				<li data-lat="-34.582313751154864" data-lng="-58.418489942034554">Jardin Botanico</li>
			</ul>
		</aside>

		<!-- Mapa principal -->
		<div id="mapa" class="card"></div>

		<!-- Panel derecho -->
		<aside id="panel" class="card">
			<!-- Estadísticas -->
			<div id="estadisticas">
				<h3>📊 Estadísticas Semanales</h3>
				<canvas id="grafico"></canvas>
			</div>

			<!-- Últimos datos -->
<div id="ultimos-datos">
  <h3>Últimos Datos</h3>
  
  <a href="${pageContext.request.contextPath}/MostrarMapa">Probar datos</a>
  
  <%
    ResultSet conjuntoResultados = (ResultSet) request.getAttribute("conjuntoResultados");

    if (conjuntoResultados != null && conjuntoResultados.next()) {
    	String nombrePunto = conjuntoResultados.getString("nombrePunto");
        int basura = conjuntoResultados.getInt("basura");
        int reciclable = conjuntoResultados.getInt("reciclable");
        int totalRecogido = conjuntoResultados.getInt("totalRecogido");
        String ultimaRecoleccion = conjuntoResultados.getString("ultimaRecoleccion");
        String ultimoRecorrido = conjuntoResultados.getString("ultimoRecorrido");
  %>
 		 <p>Nombre punto: <%= nombrePunto %></p>
        <p>Basura: <%= basura %> KG</p>
        <p>Reciclable: <%= reciclable %> KG</p>
        <p>Total Recogido: <%= totalRecogido %> KG</p>
        <p>Última Recolección: <%= ultimaRecoleccion %></p>
        <p>Último Recorrido: <%= ultimoRecorrido %></p>
  <%
    } else {
  %>
        <p>No hay datos disponibles.</p>
  <%
    }
  %>
</div>


		</aside>
	</main>

	<!-- JS -->
	<script src="<%=request.getContextPath()%>/js/mapa.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GreenTech</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/estilos-leerdatos.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script>
        function toggleDeleteButton() {
            const checkboxes = document.querySelectorAll('input[name="idsSeleccionados"]');
            const deleteButton = document.getElementById('deleteSelectedButton');
            let isChecked = false;

            checkboxes.forEach((checkbox) => {
                if (checkbox.checked) {
                    isChecked = true;
                }
            });

            deleteButton.style.display = isChecked ? 'block' : 'none';
        }
    </script>
</head>
<body>
	<div class="contenedor">
		<h1 class="titulo">Lista de Datos</h1>
		<form method="post"
			action="${pageContext.request.contextPath}/EliminarDatos">
			<table class="tabla">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Basura</th>
						<th>Reciclable</th>
						<th>Total Recogido</th>
						<th>Ultimo Recorrido</th>
						<th>Ultima Recoleccion</th>
					</tr>
				</thead>
				<tbody>
					<%
					ResultSet conjuntoResultados = (ResultSet) request.getAttribute("conjuntoResultados");
					boolean tieneResultados = false;
					if (conjuntoResultados != null) {
						while (conjuntoResultados.next()) {
							tieneResultados = true;
							int identificador = conjuntoResultados.getInt("id");
							int basura = conjuntoResultados.getInt("basura");
							int reciclable = conjuntoResultados.getInt("reciclable");
							int totalRecogido = conjuntoResultados.getInt("totalRecogido");
							String ultimoRecorrido = conjuntoResultados.getString("ultimoRecorrido");
							String ultimaRecoleccion = conjuntoResultados.getString("ultimaRecoleccion");
					%>
					<tr>
						<td><%=basura%></td>
						<td><%=reciclable%></td>
						<td><%=totalRecogido%></td>
						<td><%=ultimoRecorrido%></td>
						<td><%=ultimaRecoleccion%></td>
						
						<td>
							<div class="contenedor-acciones">
								<!-- Botón para editar -->
								<button type="button" class="boton-accion boton-editar"
									onclick="editarRegistro('<%=identificador%>')">
									<i class="fas fa-edit"></i>
								</button>

								<!-- Botón para eliminar -->
								<button type="button" class="boton-accion boton-eliminar"
									onclick="eliminarRegistro('<%=identificador%>')">
									<i class="fas fa-trash"></i>
								</button>

								<!-- Checkbox para selección múltiple -->
								<input type="checkbox" name="idsSeleccionados"
									value="<%=identificador%>" onclick="toggleDeleteButton()">
							</div>
						</td>
					</tr>
					<%
					}
					}

					if (!tieneResultados) {
					%>
					<tr>
						<td colspan="5" class="sin-resultados">No hay resultados
							disponibles.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<!-- Botón para eliminar seleccionados -->
			<div class="contenedor-boton-eliminarTodos" style="display: none;"
				id="deleteSelectedButton">
				<button type="submit" class="boton-eliminar-seleccionados"
					onclick="return confirm('¿Estás seguro de que deseas eliminar los registros seleccionados?');">
					Eliminar Seleccionados</button>
			</div>
		</form>

		<!-- Botón de regreso -->
		<div class="contenedor-boton-regresar">
			<a href="${pageContext.request.contextPath}/vistas/index.jsp"
				class="boton-regresar"> <i class="fas fa-undo"></i>
			</a>
		</div>

</body>
</html>

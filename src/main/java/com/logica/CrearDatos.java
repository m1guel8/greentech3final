package com.logica;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import com.logica.ConexionBD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CrearDatos
 */
@WebServlet("/CrearDatos")
public class CrearDatos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtener datos del formulario en index
		// dentro de getParameter, cada parametro debe ser igual a los atributos "name"
		// de las etiquetas input del formulario
	
		String nombrePunto = "parque ns";
		int basura = 8;
		int reciclable = 5;
		int totalRecogido = basura + reciclable;
		String ultimoRecorridoStr = "11:30";
		String ultimaRecoleccionStr = "12:30";

		// convertir String → java.sql.Time
		LocalDate hoy = LocalDate.now();
		Timestamp ultimoRecorrido = Timestamp.valueOf(LocalDateTime.of(hoy, LocalTime.parse(ultimoRecorridoStr + ":00")));
		Timestamp ultimaRecoleccion = Timestamp.valueOf(LocalDateTime.of(hoy, LocalTime.parse(ultimaRecoleccionStr + ":00")));

		// Ver datos recibidos del formulario en pantalla de Eclipse
		System.out.println("Nombre del punto: " + nombrePunto);
		System.out.println("Basura: " + basura + " kg");
		System.out.println("Reciclable: " + reciclable + " kg");
		System.out.println("Total recogido: " + totalRecogido + " kg");
		System.out.println("Ultimo recorrido: " + ultimoRecorrido + " hs");
		System.out.println("Ultima recoleccion: " + ultimaRecoleccion + " hs");

		if (basura < 0 || reciclable < 0 || totalRecogido < 0) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Los valores negativos no son validos");
			return;
		}

		// Insertar datos en la base de datos
		try (Connection conexion = ConexionBD.obtenerConexion()) {
			String sql = "INSERT INTO datos (nombrePunto, basura,reciclable, totalRecogido, ultimoRecorrido, ultimaRecoleccion) VALUES (?, ?, ?,?,?,?)";
			try (PreparedStatement statement = conexion.prepareStatement(sql)) {
				statement.setString(1, nombrePunto);
				statement.setInt(2, basura);
				statement.setInt(3, reciclable);
				statement.setInt(4, totalRecogido);
				statement.setTimestamp(5, ultimoRecorrido);
				statement.setTimestamp(6, ultimaRecoleccion);

				int filasAfectadas = statement.executeUpdate();

	            // Leer inmediatamente el último registro insertado
	            String sqlSelect = "SELECT id, nombrePunto, basura, reciclable, totalRecogido, ultimoRecorrido, ultimaRecoleccion " +
	                               "FROM datos ORDER BY id DESC LIMIT 1";
	            try (PreparedStatement psSelect = conexion.prepareStatement(sqlSelect);
	                 ResultSet conjuntoResultados = psSelect.executeQuery()) {

	                request.setAttribute("conjuntoResultados", conjuntoResultados);
	                request.getRequestDispatcher("/vistas/mapa.jsp").forward(request, response);
	            }
				if (filasAfectadas > 0) {
				
					request.setAttribute("mensajeExito", "¡Datos guardados correctamente!");
					request.getRequestDispatcher("/vistas/mapa.jsp").forward(request, response); // Redirige de
					// éxito
				} else {
					response.sendRedirect(request.getContextPath() + "/vistas/error.jsp"); // Redirige a una página de
																							// error
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
	}

}

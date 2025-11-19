package com.logica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class ConexionBD {

	static Connection conexion = null;
	static Scanner entrada = new Scanner(System.in);

	public static Connection obtenerConexion() throws SQLException {


		String url = "jdbc:mysql://localhost:3306/greentech";
		String user = "root";
		String password = "";

		try {
			// 1️⃣ Cargar el driver JDBC de MySQL
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2️⃣ Establecer la conexión con la base
			conexion = DriverManager.getConnection(url, user, password);

			System.out.println("✅ Conexión exitosa a MySQL");

		} catch (ClassNotFoundException e) {
			// Error si el driver JDBC no está disponible
			throw new SQLException("❌ Driver JDBC de MySQL no encontrado", e);

		} catch (SQLException e) {
			// Error si no se puede conectar
			throw new SQLException("❌ Error al conectar a la base de datos", e);
		}

		return conexion;
	}
}

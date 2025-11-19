package com.logica;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MostrarMapa")
public class LeerDatos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conexion = ConexionBD.obtenerConexion();
             Statement statement = conexion.createStatement()) {

            // ✅ Consulta para obtener solo el último registro
            String sql = "SELECT id, nombrePunto, basura, reciclable, totalRecogido, ultimoRecorrido, ultimaRecoleccion " +
                         "FROM datos ORDER BY id DESC LIMIT 1";

            try (ResultSet conjuntoResultados = statement.executeQuery(sql)) {
                // ✅ Pasamos el resultado al JSP
                request.setAttribute("conjuntoResultados", conjuntoResultados);

                // ✅ Redirigimos al mapa.jsp
                request.getRequestDispatcher("/vistas/mapa.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

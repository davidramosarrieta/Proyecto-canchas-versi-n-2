package com.rest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.db.Consultas;

/**
 * Servlet implementation class ServletRegistro
 */
@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cedula = request.getParameter("cc");
		String contrasena = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String direccion = request.getParameter("direccion");
		String telefono = request.getParameter("telefono");
		String diaNacimiento = request.getParameter("day");
		String mesNacimiento = request.getParameter("month");
		String anoNacimiento = request.getParameter("year");
		String edad = request.getParameter("edad");
		String nivel = "1";
		
		Consultas co = new Consultas();
		if(co.registrar(cedula, contrasena, nombre, apellido, direccion, telefono, diaNacimiento, mesNacimiento, anoNacimiento, edad, nivel))
		{
			request.setAttribute("nombre", nombre);
			request.getRequestDispatcher("bienvenida.jsp").forward(request, response);
		}else{
			String mensaje ="Su cedula ya está registrada";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("registro.jsp").forward(request, response);
		}
		
		
	}

}

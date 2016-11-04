package com.rest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.db.Consultas;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		Consultas co = new Consultas();
		Consultas co2 = new Consultas();
		
		if (co.autenticacion(cedula, contrasena)){
			String nombre = co2.consultaNombre(cedula);
			HttpSession objSesion = request.getSession(true);
			objSesion.setAttribute("usuario", cedula);
			
			request.setAttribute("nombre", nombre);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			String mensaje ="Credenciales inválidas";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("sesion.jsp").forward(request, response);
		}
	}
}

package com.rest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.db.Consultas;

/**
 * Servlet implementation class ServletEscenarios
 */
@WebServlet("/escenario")
public class ServletEscenarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEscenarios() {
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
		Consultas co = new Consultas();
		if(request.getParameter("borrarEscenario") == null){
			String tipo = request.getParameter("tipo");
			String nombre = request.getParameter("nombre");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			
			
			if(co.agregarEscenario( tipo, nombre, direccion, telefono)){
				String mensaje = "El escenario "+nombre+" ha sido agregado";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("escenarios.jsp").forward(request, response);
			}else{
				String mensaje ="Error. No se pudo agregar el escenario. Intente nuevamente";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("escenarios.jsp").forward(request, response);
			}
		}else{
			String idEscenario = request.getParameter("borrarEscenario");
			if(co.borrarEscenario(idEscenario)){
				String mensaje = "El escenario "+idEscenario+" ha sido borrado";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("escenarios.jsp").forward(request, response);
			}else{
				String mensaje ="Error. No se pudo borrar el escenario. Intente nuevamente";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("escenarios.jsp").forward(request, response);
			}
		}
	}
}

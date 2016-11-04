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
 * Servlet implementation class ServletReserva
 */
@WebServlet("/ServletReserva")
public class ServletReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReserva() {
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
		
		if(request.getParameter("confirmarEliminar")==null){

			String dia = request.getParameter("day");
			String mes = request.getParameter("month");
			String anno= request.getParameter("year");
			
			
			if(request.getParameter("escenario")==null){
				String tipo = request.getParameter("tipo");
				
				
				
				String canchasDeTipo [][] = co.consultaCanchas(tipo);
				
				request.setAttribute("canchasDeTipo", canchasDeTipo);
				request.setAttribute("tipo", tipo);
				request.setAttribute("mes", mes);
				request.setAttribute("dia", dia);
				request.setAttribute("anno", anno);
		
				request.getRequestDispatcher("reservar2.jsp").forward(request, response);
			}else{
				HttpSession objSesion = request.getSession(false);
				
				String escenario = request.getParameter("escenario");
				String cedula = (String)objSesion.getAttribute("usuario");
				String hora = request.getParameter("hora");
				String estado = "Apartada";
				if(co.apartarCancha(escenario, cedula, hora, dia, mes, anno, estado)){
					String mensaje = "Su reserva está 'Apartada'. Debe confirmar la reserva.";
					request.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("confirmar.jsp").forward(request, response);
				}else{
					String mensaje = "El escenario está ocupado. Elija otro horario u otro escenario.";
					request.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("confirmar.jsp").forward(request, response);
				}
			}
		}else{
			String opcionUsuario = request.getParameter("confirmarEliminar");
			if(opcionUsuario.equals("confirmar") ){
				Consultas coReservas = new Consultas();
				HttpSession objSesion = request.getSession(false);
				String misReservas[][] = coReservas.listarReservas((String)objSesion.getAttribute("usuario"));
				int tamanioReservas = misReservas.length;
				String [] idReservas = new String[tamanioReservas];
				String indice;
				String mensaje="No ha seleccionado ninguna reserva";
				for(int i = 0 ; i<tamanioReservas ; i++){ 
					indice = String.valueOf(i);
					if(request.getParameter(indice)!=null){
						idReservas[i] = request.getParameter(indice);
						
						mensaje = confirmarReservas(idReservas[i]);
					}
				}
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("confirmar.jsp").forward(request, response);
			}
			if(opcionUsuario.equals("eliminar")){
				Consultas coReservas = new Consultas();
				HttpSession objSesion = request.getSession(false);
				String misReservas[][] = coReservas.listarReservas((String)objSesion.getAttribute("usuario"));
				int tamanioReservas = misReservas.length;
				String [] idReservas = new String[tamanioReservas];
				String indice;
				String mensaje="No ha seleccionado ninguna reserva";
				for(int i = 0 ; i<tamanioReservas ; i++){ 
					indice = String.valueOf(i);
					if(request.getParameter(indice)!=null){
						idReservas[i] = request.getParameter(indice);
						mensaje = eliminarReservas(idReservas[i]);
					}
				}
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("confirmar.jsp").forward(request, response);
			}
		}
	}
	public String confirmarReservas(String idReservas){
		String mensaje;
		Consultas coArray = new Consultas();
		if(coArray.confirmarReserva(idReservas)){
			mensaje = "Su reserva se encuentra 'Confirmada'.";
		}else{ mensaje = "La reserva no pudo ser confirmada. Consulte sus reservas"; }
		return mensaje;
	}
	
	public String eliminarReservas(String idReservas){
		String mensaje;
		Consultas coArray = new Consultas();
		if(coArray.eliminarReserva(idReservas)){
			mensaje = "Su reserva ha sido eliminada.";
		}else{ mensaje = "La reserva no pudo ser eliminada. Consulte sus reservas e intente nuevamente"; }
		return mensaje;
	}
}

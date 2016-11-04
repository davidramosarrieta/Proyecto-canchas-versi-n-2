package control.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consultas extends Conexion{
	
	public int nivelDelUsuario(String cedula){
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String consulta = "select nivel from usuario where cedula = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, cedula);
			rs = pst.executeQuery();

			if(rs.absolute(1)){
				return Integer.parseInt(rs.getString(1));
			}
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return 0;
	}
	
	public boolean escenarioEstaOcupado(String idEscenario, String hora, 
			String dia, String mes, String anno){
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			String consulta = "select * from reserva where idEscenario = ? and hora = ? and dia = ? and mes = ? and anno = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, idEscenario);
			pst.setString(2, hora);
			pst.setString(3, dia);
			pst.setString(4, mes);
			pst.setString(5, anno);
			rs = pst.executeQuery();
			
			if(rs.absolute(1)){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}
		return false;
	}
	
	public boolean apartarCancha(String idEscenario, String cedula, String hora, 
			String dia, String mes, String anno, String estado){
		if(escenarioEstaOcupado(idEscenario, hora, dia, mes, anno)){
			return false;
		}else{
			PreparedStatement pst = null;
			
			try {
				String consulta = "insert into reserva(idEscenario, cedula, hora, dia, mes, anno, estado ) values(?,?,?,?,?,?,?)";
				pst = getConexion().prepareStatement(consulta);
				pst.setString(1, idEscenario);
				pst.setString(2, cedula);
				pst.setString(3, hora);
				pst.setString(4, dia);
				pst.setString(5, mes);
				pst.setString(6, anno);
				pst.setString(7, estado);
				
				if(pst.executeUpdate()==1){
					return true;
				}
				
			} catch (Exception e) {
				System.err.println("Error1: "+e);
			}finally{
				try {
					if(getConexion() != null){ getConexion().close();}
					if(pst != null){ pst.close();}
					
				} catch (Exception e2) {
					System.err.println("Error2: "+e2);
				}
			}
		return false;
		}
	}
	
	public String [][] consultaTodasCanchas(){
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String consulta = "select * from canchas.escenario";
			pst = getConexion().prepareStatement(consulta);
			rs = pst.executeQuery();

			int columnas = rs.getMetaData().getColumnCount();
			rs.last();
			int filas= rs.getRow();
			String [] [] tablaEscenario = new String[filas][columnas];
			rs.beforeFirst();
			for(int i=0;i<filas;i++){
				//Va a la siguiente fila
				rs.next();
		    		for(int j=0;j<columnas;j++){
		    			tablaEscenario[i][j]=rs.getString(j+1);
		    			}
		    	}
			return tablaEscenario;
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return null;
	}
	
	public String[][] listarReservas(String cedula){
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			String consulta = "select * from reserva where cedula = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, cedula);
			rs = pst.executeQuery();

			int columnas = rs.getMetaData().getColumnCount();
			rs.last();
			int filas= rs.getRow();
			String [] [] listaReservas = new String[filas][columnas];
			rs.beforeFirst();
			for(int i=0;i<filas;i++){
				//Va a la siguiente fila
				rs.next();
		    		for(int j=0;j<columnas;j++){
		    			listaReservas[i][j]=rs.getString(j+1);
		    			}
		    	}
			return listaReservas;
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return null;
	}
	
	public boolean confirmarReserva(String idReserva){
		PreparedStatement pst = null;
		try {
			String consulta = "update reserva set estado = 'Confirmada' where idReserva = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, idReserva);

			if(pst.executeUpdate()==1){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error1: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				
			} catch (Exception e2) {
				System.err.println("Error2: "+e2);
			}
		}
		return false;
	}
	
	public boolean eliminarReserva(String idReserva){
		PreparedStatement pst = null;
		try {
			String consulta = "delete from reserva where idReserva = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, idReserva);

			if(pst.executeUpdate()==1){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error1: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				
			} catch (Exception e2) {
				System.err.println("Error2: "+e2);
			}
		}
		return false;
	}
	
	public boolean borrarEscenario(String idEscenario){
		PreparedStatement pst = null;
		
		try {
			String consulta = "delete from escenario where idEscenario = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, idEscenario);

			if(pst.executeUpdate()==1){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error1: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				
			} catch (Exception e2) {
				System.err.println("Error2: "+e2);
			}
		}
		return false;
	}
	
	public String [][] consultaCanchas(String tipo){
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String consulta = "select * from canchas.escenario where tipoEscenario = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, tipo);
			rs = pst.executeQuery();

			int columnas = rs.getMetaData().getColumnCount();
			rs.last();
			int filas= rs.getRow();
			String [] [] tablaEscenario = new String[filas][columnas];
			rs.beforeFirst();
			for(int i=0;i<filas;i++){
				//Va a la siguiente fila
				rs.next();
		    		for(int j=0;j<columnas;j++){
		    			tablaEscenario[i][j]=rs.getString(j+1);
		    			}
		    	}
			return tablaEscenario;
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return null;
	}
	
	public String consultaNombre(String cedula){
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String consulta = "select nombre from usuario where cedula = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, cedula);
			rs = pst.executeQuery();
			
			if(rs.absolute(1)){
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return null;
	}
	
	public boolean autenticacion(String cedula, String contrasenna){
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			String consulta = "select * from usuario where cedula = ? and contrasena = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, cedula);
			pst.setString(2, contrasenna);
			rs = pst.executeQuery();
			
			if(rs.absolute(1)){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				if(rs != null){ rs.close();}
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
		return false;
	}
	
	public boolean agregarEscenario(String tipoEscenario, String nombreEscenario, String direccionEscenario, String telefonoEscenario){
		PreparedStatement pst = null;
		
		try {
			String consulta = "insert into escenario(tipoEscenario, nombreEscenario, direccionEscenario, telefonoEscenario ) values(?,?,?,?)";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, tipoEscenario);
			pst.setString(2, nombreEscenario);
			pst.setString(3, direccionEscenario);
			pst.setString(4, telefonoEscenario);
			
			if(pst.executeUpdate()==1){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
	
		return false;
	}
	
	public boolean registrar (String cedula, String contrasenna, String nombre, String apellido, 
			String direccionUsuario, String telefonoUsuario, String diaNacimiento, String mesNacimiento,
			String anoNacimiento, String edad, String nivel){
		PreparedStatement pst = null;
		
		try {
			String consulta = "insert into usuario (cedula, contrasena, nombre, apellido, direccionUsuario, telefonoUsuario,  diaNacimiento,  mesNacimiento, anoNacimiento,  edad, nivel ) values(?,?,?,?,?,?,?,?,?,?,?)";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, cedula);
			pst.setString(2, contrasenna);
			pst.setString(3, nombre);
			pst.setString(4, apellido);
			pst.setString(5, direccionUsuario);
			pst.setString(6, telefonoUsuario);
			pst.setString(7, diaNacimiento);
			pst.setString(8, mesNacimiento);
			pst.setString(9, anoNacimiento);
			pst.setString(10, edad);
			pst.setString(11, nivel);
			
			if(pst.executeUpdate()==1){
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Error: "+e);
		}finally{
			try {
				if(getConexion() != null){ getConexion().close();}
				if(pst != null){ pst.close();}
				
			} catch (Exception e2) {
				System.err.println("Error: "+e2);
			}
		}
	
		return false;
	}
	
	//Ejemplo
	public static void main (String[] args){
		Consultas co = new Consultas();
		//System.out.println(co.registrar("92543222", "davidbojeb", "Pedro", "Perez", "Medllin Cr80", "3001234567",  "15",  "7", "1990",  "26", "1" ));
		System.out.println(co.nivelDelUsuario("92543909"));
		//System.out.println(co.apartarCancha("10", "92543909", "18", "10", "12", "2016", "Apartada"));
		/*String coCanchas[][] = co.consultaCanchas("Futbol 5");
		for(int i = 0 ; i<coCanchas.length ; i++){
			System.out.println(coCanchas[i][2]);
		}*/
		
			//
		
		//System.out.println(co.agregarEscenario("Futbol 11", "Rosario", "Medellín calle 50", "3111234567"));
	}
}
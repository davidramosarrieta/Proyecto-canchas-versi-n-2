package control.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private String usuarioDB = "root";
	private String passwordDB = "davidbojeb";
	private String host = "localhost";
	private String puerto = "3306";
	private String dataBase = "canchas";
	private String nombreClase = "com.mysql.jdbc.Driver";
	private String URL = "jdbc:mysql://"+host+":"+puerto+"/"+dataBase;
	private Connection con;
	
	public Conexion(){
		try {
			Class.forName(nombreClase);
			con = DriverManager.getConnection(URL, usuarioDB, passwordDB);
		} catch (ClassNotFoundException e) {
			System.err.println("Error: "+e);
		}catch (SQLException e){
			System.err.println("Error: "+e);
		}
	}
	
	public Connection getConexion(){
		return con;
	}
}
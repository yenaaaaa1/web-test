package test.web.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private final static String ID = "root";
	private final static String PWD = "r1r2r3";
	private final static String URL = "jdbc:mariadb://localhost:3307/ezen";
	private final static String CLASS_NAME = "org.mariadb.jdbc.Driver";
	/*String sql = "INSERT INTO USER_INFO(UI_NAME, UI_ID, UI_PWD, CREDAT, CRETIM)\r\n"
			+ "VALUES('박경훈','RED','1234','20240826','221010')";*/
	static {
		try {
			Class.forName(CLASS_NAME);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon() {
		// import 단축키 : ctrl + shift + o
		Connection con = null;
			try {
				con = DriverManager.getConnection(URL,ID,PWD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return con;
	}
	
	public static void main(String[] args) {
		System.out.println(getCon());
	}
}

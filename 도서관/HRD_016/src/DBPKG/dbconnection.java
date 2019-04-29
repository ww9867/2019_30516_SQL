package DBPKG;

import java.sql.*;


public class dbconnection { 
	public static Connection getConnection() throws Exception{
		 Class.forName("oracle.jdbc.OracleDriver");
		 Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","asd123");
		 return con;
		 }
	
	
	
	public static ResultSet query(String sql) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		System.out.println(sql); 
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
}
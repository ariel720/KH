package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {

	private static final String USER="user06";
	private static final String PASSWORD="user06";
	private static final String URL="jdbc:oracle:thin:@192.168.230.138:1521:xe";
	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	
	//DB 연결 메소드
	public static Connection getcon(){
		Connection con=null;
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return con;
	}
	
//DB연결 끊는 메소드1	
	public static void discon(Connection con, PreparedStatement st, ResultSet rs){
		
		try {
			if(rs !=null){rs.close();}
			if(st !=null){st.close();}
			if(con !=null){con.close();}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//DB연결 끊는 메소드2	
public static void discon(Connection con, PreparedStatement st){
		
		try {
		if(st !=null){st.close();}
		if(con !=null){	con.close();}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
}

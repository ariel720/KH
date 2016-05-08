package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MbDAO {

	//로그인 메소드
	public MbDTO login(MbDTO mb){
		
		Connection con= DBcon.getcon();
		String sql= "select * from mem2 where id=? and pw=?";
		PreparedStatement st=null;
		ResultSet rs= null;
		
		try {
			st= con.prepareStatement(sql);
			st.setString(1, mb.getId());
			st.setString(2, mb.getPw());
			
			rs= st.executeQuery();
			
			if(rs.next()){
				mb.setName(rs.getString("name"));
			}else{
				mb=null;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st, rs);
		}
		
		return mb;
		
	}
	
	
	public String idcheck(String id){
		Connection con= DBcon.getcon();
		String sql= "select * from mem2 where id=?";
		PreparedStatement st=null;
		ResultSet rs= null;
		
		String msg=null;
		
		try {
			st=con.prepareStatement(sql);
			st.setString(1, id);
			rs=st.executeQuery();
			
			
			if(rs.next()){
				msg="사용할수 없음.";
			}else{
				msg="사용할수 있음.";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
		
	}
	
	
	
}

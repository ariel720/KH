package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class gDAO {

	//원본글 저장하는 메소드
	
	public int setgall(gDTO gdto){		
		Connection con= DBcon.getcon();		
		String sql="insert into gallery values(g_seq.nextVal,?,?,0,?,?,g_seq.currVal,0,0,sysdate)";
		PreparedStatement st= null;		
		int result=0;
		try {
			st=con.prepareStatement(sql);
			
			st.setString(1, gdto.getId());
			st.setString(2, gdto.getTitle());
			st.setString(3, gdto.getFile1());
			st.setString(4, gdto.getFile2());
			
			result=st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st);
		}
		
		return result;
		
	}
	
	
	
	
	//글 하나 꺼내오는 메소드
	public gDTO getgall(gDTO gdto){
		
		Connection con= DBcon.getcon();
		String sql="select * from gallery where num=?";
		
		PreparedStatement st= null;
		ResultSet rs= null;
		
		try {
			st=con.prepareStatement(sql);
			
			st.setInt(1, gdto.getNum());
			
			rs=st.executeQuery();
			
			if(rs.next()){
				
				gdto.setCounts(rs.getInt("counts"));
				gdto.setDepth(rs.getInt("depth"));
				gdto.setFile1(rs.getString("file1"));
				gdto.setFile2(rs.getString("file2"));
				gdto.setId(rs.getString("id"));
				gdto.setRef(rs.getInt("ref"));
				gdto.setReg_date(rs.getDate("reg_date"));
				gdto.setStep(rs.getInt("step"));
				gdto.setTitle(rs.getString("title"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st, rs);
		}
		
		return gdto;
		
		
	}
	
//전체글 나눠서 가져오는 메소드
	public void getlist(){
		
		Connection con= DBcon.getcon();
		String sql="select rownum R,A.* from(select * from gallery order by ref desc , order by step asc)A where R between ? and ?";
		PreparedStatement st= null;
		try {
			st=con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}

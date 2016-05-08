package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

public class NtDAO {

	public int setcont(NtDTO ndto){
		Connection con= DBcon.getcon();
				String sql=" insert into notice values(notice_seq.nextVal,?,?,?,0,sysdate)"; //조회수는 모든글이 0부터 시작하므로 0을 넣고 시작해요.
				PreparedStatement st= null;
				int result=0;
				try {
					st=con.prepareStatement(sql);
					
				
					st.setString(1, ndto.getWriter());
					st.setString(2, ndto.getTitle());
					st.setString(3, ndto.getContents());
					
				result=st.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					DBcon.discon(con, st);
				}
				
				return result;
				
	}
	
	//게시글 가져오기 : 전부
	public ArrayList<NtDTO> getconts(){
		Connection con= DBcon.getcon();
		String sql=" select * from notice order by num desc";
		PreparedStatement st= null;
		ResultSet rs=null;
		
		ArrayList<NtDTO> al=new ArrayList<NtDTO>();
		
		try {
			st=con.prepareStatement(sql);
			rs=st.executeQuery();
			
			while(rs.next()){
				NtDTO ndto=new NtDTO();
				ndto.setNum(rs.getInt("num"));
				ndto.setWriter(rs.getString("writer"));
				ndto.setTitle(rs.getString("title"));
				ndto.setContents(rs.getString("contents"));
				ndto.setCounts(rs.getInt("counts"));
				ndto.setReg_date(rs.getDate("reg_date"));
				
				al.add(ndto);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBcon.discon(con, st, rs);
		}
		
		return al;
	}
	

	//게시글 가져오기 : 1개
	public NtDTO getcont(NtDTO ndto){ //클릭했다는 것은 조회수가 1늘어났다는 것이므로 select문과 update를 써준다.
		
		Connection con= DBcon.getcon();		
		String sql="select * from notice where num=?";
		PreparedStatement st= null;
		ResultSet rs= null;
		try {
			st=con.prepareStatement(sql);
			st.setInt(1, ndto.getNum());
			
			rs=st.executeQuery();
			
			if(rs.next()){				
				ndto.setNum(rs.getInt("num"));
				ndto.setWriter(rs.getString("writer"));
				ndto.setTitle(rs.getString("title"));
				ndto.setContents(rs.getString("contents"));
				ndto.setCounts(rs.getInt("counts"));
				ndto.setReg_date(rs.getDate("reg_date"));
				
				sql="update notice set counts=? where num=?";
				st=con.prepareStatement(sql);
				
				st.setInt(1, ndto.getCounts()+1);
				st.setInt(2, ndto.getNum());
				st.executeUpdate();
				
			}else{
				
				ndto=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st, rs);
		}
		
		return ndto;
				
	}
	
	//공지글 수정하는 메소드
	public int update(NtDTO ndto){

		Connection con= DBcon.getcon();
		String sql="update notice set title=?, contents=? where num=?";
		PreparedStatement st=null;
		int result=0;
		try {
			st=con.prepareStatement(sql);
			st.setString(1, ndto.getTitle());
			st.setString(2, ndto.getContents());
			st.setInt(3, ndto.getNum());
			
			result=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st);
		}
		
		return result;
	}

	//글 삭제하는 메소드
	
	public int delete(NtDTO ndto){
		Connection con= DBcon.getcon();
		String sql="delete from notice where num=?";
		PreparedStatement st=null;
		int result=0;
		try {
			st=con.prepareStatement(sql);

			st.setInt(1, ndto.getNum());
			
			result=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBcon.discon(con, st);
		}
		
		return result;
	}
	
	//게시글 가져오기 : 원하는 숫자만큼
		public ArrayList<NtDTO> getconts3(int cp){
			Connection con= DBcon.getcon();
			String sql="select * from ( select rownum R,A.* from "
			+"( select * from NOTICE order by num desc ) A )"
			+" where R between ? and ?";
		
			PreparedStatement st= null;
			ResultSet rs=null;
			
			ArrayList<NtDTO> al=new ArrayList<NtDTO>();			
			try {st=con.prepareStatement(sql);
				
				st.setInt(1, cp*10-9);
				st.setInt(2, cp*10);
				
				rs=st.executeQuery();				
				while(rs.next()){
					NtDTO ndto=new NtDTO();
					ndto.setNum(rs.getInt("num"));
					ndto.setWriter(rs.getString("writer"));
					ndto.setTitle(rs.getString("title"));
					ndto.setContents(rs.getString("contents"));
					ndto.setCounts(rs.getInt("counts"));
					ndto.setReg_date(rs.getDate("reg_date"));					
					al.add(ndto);
				}	
				} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBcon.discon(con, st, rs);
			}	
			return al;}
		
	//게시글 가져오기 : 최신5개만
		public ArrayList<NtDTO> getconts2(){
			Connection con= DBcon.getcon();
			String sql="select * from notice where rownum between 1 and 5 order by num desc";
			PreparedStatement st= null;
			ResultSet rs=null;
			
			ArrayList<NtDTO> al=new ArrayList<NtDTO>();
			
			try {
				st=con.prepareStatement(sql);
				
				rs=st.executeQuery();
				
				while(rs.next()){
					NtDTO ndto=new NtDTO();
					ndto.setNum(rs.getInt("num"));
					ndto.setWriter(rs.getString("writer"));
					ndto.setTitle(rs.getString("title"));
					ndto.setContents(rs.getString("contents"));
					ndto.setCounts(rs.getInt("counts"));
					ndto.setReg_date(rs.getDate("reg_date"));
					
					al.add(ndto);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				DBcon.discon(con, st, rs);
			}
			
			return al;
		}
		
		//총페이지 숫자 구하는 메소드(이안에서만 쓰는 메소드=private)
		
		private int totallist(){
			int result=0;
			
			Connection con= DBcon.getcon();
			String sql="select count(num) from notice ";
			PreparedStatement st=null;
			ResultSet rs=null;
			try {
				st=con.prepareStatement(sql);
				
				rs=st.executeQuery();
				
				if(rs.next()){
					result=rs.getInt(1);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBcon.discon(con, st, rs);
			}
					
			return result;
		}
		

		//게시글의 페이지 수 정하기
	public Hashtable<String, Integer> getpage(int cp){
		
		Hashtable<String, Integer> hs=new Hashtable<>();
		
		int totallist=totallist();//전체게시글수(위의 메소드)
		int perpagelist=10;//페이지당 보이는 글수
		int totalpage=0;//전체 페이지수
		int perblock=5;//블록당 보이는 페이지수
		int totalblock=0;
		int curblock=0;//cp가 속해있는 블럭
		int startpage=0;//해당블럭의 시작페이지
		int lastpage=0;//해당블럭의 끝페이지
		
		
		//1.토탈페이지 구하기
		if(totallist%perpagelist==0){
			totalpage=totallist/perpagelist;
		}else{
			totalpage=totallist/perpagelist+1;
		}
		
		//2.현재페이지(cp)가 속할 블럭찾기
		if(cp%perblock==0){
			curblock=cp/perblock;
		}else{
			curblock=cp/perblock+1;
		}
		
		//3.토탈블럭(totalblock)구하기
		if(totalpage%perblock==0){
			totalblock=totalpage/perblock;			
		}else{
			totalblock=totalpage/perblock+1;		
		}
		
		//4.현재페이지블럭(curblock)의 시작페이지와 끝페이지 구하기
		startpage=(curblock-1)*perblock+1;
		
		if(totalblock==curblock){//마지막 블럭이라면~
			lastpage=totalpage;
		}else{
			lastpage=curblock*perblock;
		}
		
		
		hs.put("startpage", startpage);
		hs.put("lastpage", lastpage);
		hs.put("totalblock", totalblock);
		hs.put("curblock", curblock);
		
		return hs;
		
	}	
}

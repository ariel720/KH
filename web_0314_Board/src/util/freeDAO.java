package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import org.apache.jasper.tagplugins.jstl.core.Redirect;

public class freeDAO {

	// 원본글저장하는 메소드
	public int setcont(freeDTO fb) {
		Connection con = DBcon.getcon();
		String sql = "insert into free values(f_seq.nextVal,?,?,0,?,f_seq.currVal,0,0,sysdate)";
		PreparedStatement st = null;

		int result = 0;

		try {
			st = con.prepareStatement(sql);

			st.setString(1, fb.getId());
			st.setString(2, fb.getTitle());
			st.setString(3, fb.getContents());
			// step,depth : 원본은 0

			result = st.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st);
		}
		return result;

	}

	// 답글저장하는 메소드
	public int setreply(freeDTO fb,int p_ref) {
		int result = 0;
		//부모 객체 만들기
		freeDTO p_fb=new freeDTO();//새로운 객체생성
		p_fb.setRef(p_ref);//거기에 부모의 번호를 넣고
		p_fb=getcont(p_fb);//getcont메소드로 부모객체를 완성.........//현재, fb와 p_fb 객체가 두개 들어있음.
		
		Connection con = DBcon.getcon();
		String sql = "update free set step=step+1  where ref=? and step>?"; //나를 제외한 다른 애들을 업데이트
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, p_fb.getRef());
			st.setInt(2, p_fb.getStep());			
			
			st.executeUpdate(); //업데이트를 완료시켜요.
			
			
			
			sql = "insert into free values ( f_seq.nextVal,?,?,0,?,?,?,?,sysdate)";//나를 업데이트
			st = con.prepareStatement(sql);

			st.setString(1, fb.getId());
			st.setString(2, fb.getTitle());
			st.setString(3, fb.getContents());
			st.setInt(4, fb.getNum());			
			st.setInt(5, p_fb.getStep()+1);
			st.setInt(6, p_fb.getDepth()+1);

			result = st.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st);}
		return result;
		}

	
	
	
	// 글 하나만 꺼내오는 메소드
	public freeDTO getcont(freeDTO fb) {

		Connection con = DBcon.getcon();

		String sql = "select * from free where num=?";

		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			st = con.prepareStatement(sql);

			st.setInt(1, fb.getNum());
			rs = st.executeQuery();

			if (rs.next()) {
				fb.setContents(rs.getString("contents"));
				fb.setCounts(rs.getInt("counts"));
				fb.setDepth(rs.getInt("depth"));
				fb.setId(rs.getString("id"));
				fb.setRef(rs.getInt("ref"));
				fb.setReg_date(rs.getDate("reg_date"));
				fb.setStep(rs.getInt("step"));
				fb.setTitle(rs.getString("title"));

				
				sql="update notice set counts=? where num=?";
				st=con.prepareStatement(sql);
				
				st.setInt(1, fb.getCounts()+1);
				st.setInt(2, fb.getNum());
				st.executeUpdate();
				
				
				
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBcon.discon(con, st, rs);
		}

		return fb;

	}

	// 업데이트하는 메소드
	public int update(freeDTO fb) {
		Connection con = DBcon.getcon();
		String sql = "update free set title=?, contents=? where num=?";
		PreparedStatement st = null;
		int result = 0;

		try {
			st = con.prepareStatement(sql);
			st.setString(1, fb.getTitle());
			st.setString(2, fb.getContents());
			st.setInt(3, fb.getNum());

			result = st.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st);
		}

		return result;
	}

	// 삭제하는 메소드
	public int delete(freeDTO fb) {
		Connection con = DBcon.getcon();
		String sql = "delete from free where num=?";
		PreparedStatement st = null;
		int result = 0;

		try {
			st = con.prepareStatement(sql);
			st.setInt(1, fb.getNum());

			result = st.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st);
		}

		return result;

	}

	// 글목록 보여주는 메소드
	public ArrayList<freeDTO> getconts(int cp) {
		Connection con = DBcon.getcon();
		String sql = "select * from (select rownum R, A.* from "
				+ "(select * from free order by ref desc, step asc) A) " + "where R between ? and ?";
	
		
		ArrayList<freeDTO> al = new ArrayList<>();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
			
			st.setInt(1, cp * 10 - 9);
			st.setInt(2, cp * 10);
			rs = st.executeQuery();
			while (rs.next()) {
				freeDTO fb = new freeDTO();
				fb.setContents(rs.getString("contents"));
				fb.setCounts(rs.getInt("counts"));
				fb.setDepth(rs.getInt("depth"));
				fb.setId(rs.getString("id"));
				fb.setNum(rs.getInt("num"));
				fb.setRef(rs.getInt("ref"));
				fb.setReg_date(rs.getDate("reg_date"));
				fb.setStep(rs.getInt("step"));
				fb.setTitle(rs.getString("title"));
				al.add(fb);}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st, rs);
		}return al;
	}
	
	// 전체글 갯수 구하는 메소드
	public int totallist() {
		Connection con = DBcon.getcon();
		String sql = "select count(num) from free";
		PreparedStatement st = null;
		ResultSet rs = null;
		int totallist = 0;

		try {
			st = con.prepareStatement(sql);

			rs = st.executeQuery();
			if (rs.next()) {
				totallist = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st, rs);
		}

		return totallist;

	}

	// 페이징하는 메소드
	public Hashtable<String, Integer> pageing(int cp) {
		Hashtable<String, Integer> hs = new Hashtable<String, Integer>();
		  // 1.totalpage 구하기
		int totallist = totallist();
		int perlist = 10;
		int totalpage = 0;
		if (totallist % perlist == 0) {
			totalpage = totallist / perlist;
		} else {totalpage = totallist / perlist + 1;}
		  // 2.totalblock 구하기
		int perblock = 5;
		int totalblock = 0;
		if (totalpage % perblock == 0) {
			totalblock = totalpage / perblock;
		} else {totalblock = totalpage / perblock + 1;}
		  // 3.cp(curpage)가 속하는 블럭 구하기
		int curblock = 0;
		if (cp % perblock == 0) {
			curblock = cp / perblock;
		} else {curblock = cp / perblock + 1;}
		  // 4.curblock의 시작과 끝 페이지 구하기
		int spage = (curblock - 1) * perblock + 1;
		int epage = 0;
		if (curblock == totalblock) {
			epage = totalpage;
		} else {epage = curblock * perblock;}

		hs.put("spage", spage);
		hs.put("epage", epage);
		hs.put("curblock", curblock);
		hs.put("totalblock", totalblock);
		return hs;
		

	}

	
	//검색 메소드
	public ArrayList<freeDTO> search(String s,String s2){
		Connection con = DBcon.getcon();
		String sql = "select * from (select rownum R, A.* from "
				+ "(select * from free where "+s2+" like ? order by ref desc, step asc) A) ";

		ArrayList<freeDTO> al = new ArrayList<>();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			st = con.prepareStatement(sql);			
			st.setString(1, "%"+s+"%");			
			rs = st.executeQuery();
			
			while (rs.next()) {
				freeDTO fb = new freeDTO();
				fb.setContents(rs.getString("contents"));
				fb.setCounts(rs.getInt("counts"));
				fb.setDepth(rs.getInt("depth"));
				fb.setId(rs.getString("id"));
				fb.setNum(rs.getInt("num"));
				fb.setRef(rs.getInt("ref"));
				fb.setReg_date(rs.getDate("reg_date"));
				fb.setStep(rs.getInt("step"));
				fb.setTitle(rs.getString("title"));
				al.add(fb);}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBcon.discon(con, st, rs);
		}
		return al;
		
	}
	
	
	
}

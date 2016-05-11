package com.choa.notice;

import java.util.ArrayList;
import java.util.Hashtable;

public interface NoticeDAO {

public int insert(NoticeDTO ndto);
	
	public int delete(int num);
	
	public int update(NoticeDTO ndto);
	
	public NoticeDTO view(int num);
	
	public ArrayList<NoticeDTO> list(int cp,int perpage);
	
	public Hashtable<String, Integer> map(int cp);
	
	
}

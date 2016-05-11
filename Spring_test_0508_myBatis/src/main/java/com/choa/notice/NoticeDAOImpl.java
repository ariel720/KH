package com.choa.notice;

import java.util.ArrayList;
import java.util.Hashtable;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String nameSpace="NoticeMapper";
	
	@Override
	public int insert(NoticeDTO ndto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO view(int num) {
		NoticeDTO ndto=sqlsession.selectOne(nameSpace+".view", num);
		return ndto;
	}

	@Override
	public ArrayList<NoticeDTO> list(int cp, int perpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Hashtable<String, Integer> map(int cp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(NoticeDTO ndto) {
		// TODO Auto-generated method stub
		return 0;
	}

}

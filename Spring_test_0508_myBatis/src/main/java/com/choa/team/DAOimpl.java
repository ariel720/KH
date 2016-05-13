package com.choa.team;

import java.util.List;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DAOimpl implements DAO {

	@Inject
	private SqlSession sqlsession;
	@Inject
	private static final String nameSpace="TeamMapper.";
	
	@Override
	public void insert(DTO mem) {	
		sqlsession.insert(nameSpace+"insert", mem);
	}

	@Override
	public DTO select(DTO dto) {
		
	DTO dto1=sqlsession.selectOne(nameSpace+"select", dto);
		
		return dto1;
	}
	
	@Override
	public List<DTO> list(){
		
		List<DTO> al= sqlsession.selectList(nameSpace+"list"); 
		
		return al;
	}
	

}

package com.choa.team;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TService {

	
	@Inject
	DAOimpl dao;
	
	public void insert(DTO dto){
		dao.insert(dto);
	}
	
	public DTO search(DTO dto){
		
		DTO dto1=dao.select(dto);
		return dto1;
	}
	
	public List<DTO> list(){
		List<DTO> al = dao.list();
		
		return al;
	}
	
}

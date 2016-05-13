package com.choa.team;

import java.util.List;

public interface DAO {

	public void insert(DTO dto);
	
	public DTO select(DTO dto);
	
	public List<DTO> list();
}

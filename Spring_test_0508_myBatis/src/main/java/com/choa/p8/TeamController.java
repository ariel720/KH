package com.choa.p8;

import java.util.List;
import java.util.Calendar;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.team.DTO;

import com.choa.team.TService;

@Controller
@RequestMapping("/team/")
public class TeamController {

	@Inject
	TService service;
	
	@RequestMapping("/go")
	public String save(@RequestParam String grade,@RequestParam String name,Model m){
	
			Calendar ca = Calendar.getInstance();			
			Random r= new Random(ca.getTimeInMillis());			
			int team=r.nextInt(6)+1;
			
			DTO dto1= new DTO();			
			dto1.setGrade(grade);
			dto1.setName(name);
			dto1.setTeam(team);
			
			
			
			if(null==service.search(dto1)){		
				
				service.insert(dto1);	
				m.addAttribute("msg", dto1.getName()+"님,"+dto1.getTeam()+"팀에 배정되셨습니다.");
			}else{
				m.addAttribute("msg", "저장실패(추첨을 다시 해주세요.)");
			}
	return "/team/result";
	}
	
	@RequestMapping("/form") 
	public void form(){
		
	}
	
	@RequestMapping("/view") 
	public void view(Model m){
		
		List<DTO> al=service.list();
		m.addAttribute("al", al);
	}
	
	
}

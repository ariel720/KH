package com.choa.p8;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.notice.NoticeDAOImpl;
import com.choa.notice.NoticeDTO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	private NoticeDAOImpl ndao;
	
	@RequestMapping("/view")
	public String getview(@RequestParam int num,Model m){
		
		NoticeDTO ndto=ndao.view(num);
		m.addAttribute("ndto", ndto);
		
		return "notice/view";
	}
}

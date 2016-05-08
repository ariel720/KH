package com.choa.p4;

import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.mem.member;

@Controller
@RequestMapping(value="member/")
public class MemberController {

	@RequestMapping(value="/test1.do")//model and view
	public ModelAndView mem1(member m, ModelAndView mv){		
		mv.addObject(m);
		mv.setViewName("member/test1");		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/test5.do") //redirect
	public String mem2(member m, RedirectAttributes ra){	
		ra.addFlashAttribute("mem",m);		
		return "redirect:test5"; //redirect:경로명(상대경로, 절대경로 확실히 쓰기.)
	}
	
	
	@RequestMapping(value="/test3.do")//json
	@ResponseBody //view페이지를 설정해주지않고 return객체를 바로 요청한 주소로 보내줌.
	public member mem3(){	
			
		member m=new member();
		m.setId("ariel720");
		m.setPw("1234");
		
		
		
		return m;
	}
	
	
	
	
}

package com.choa.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test3 {

	//test3.to  요청이 들어오면 test3가 컨트롤러가 됨. 뷰는 view/test/test3
	@RequestMapping(value = "/test3.do")
	public String test3(){
		
		return "test/test3";
	}
	
}

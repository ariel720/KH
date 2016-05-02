package com.choa.p1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  /*=얘는 컨트롤러다.*/
public class TestController {

	@RequestMapping(value="/test2.do")  /*캡핑해주는 메소드*/
	public String Test2(){
		
		return "test2";
	}
	
	
}

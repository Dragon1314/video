package com.zhiyou.video.web.controller;


import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AJAXController {
	
	@RequestMapping("/AJAX.action")
	public void a(HttpServletResponse response,String username) throws Exception{
		System.out.println(username);
		response.getWriter().write(username);
	}
	

}

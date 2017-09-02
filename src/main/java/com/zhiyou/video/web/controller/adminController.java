package com.zhiyou.video.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zhiyou.video.model.Admin;
import com.zhiyou.video.service.AdminService;

@Controller
public class adminController {
	
	@Autowired
	AdminService as;
	
	@RequestMapping("/admin/adminLogin.action")
	public String adminLogin(Admin admin,HttpServletRequest request ) throws Exception{
		String password=admin.getLoginPwd();
		System.out.println(password);
	   String md5password=DigestUtils.md5DigestAsHex(password.getBytes("UTF-8"));
		System.out.println(md5password);
	   admin.setLoginPwd(md5password);
      Admin admin1=as.adminLogin(admin.getLoginName(),admin.getLoginPwd());		
		if(admin1!=null){
			request.getSession().setAttribute("logAdmin", admin1);
			System.out.println(admin1);
			return "forward:/admin/videoList.action";
		}else{
			return "redirect:/admin/index.jsp"; 
		}		
	}

	@RequestMapping({"/admin/logout.action","/admin/logout.action"})
	public String logout(HttpSession session){
		session.removeAttribute("logAdmin");
		return "redirect:/admin/adminlog.action";
	}
	
	
	@RequestMapping("/admin/adminlog.action")
	public String adminLog(){
		return "forward:/WEB-INF/admin/index.jsp";
	}
	
	
}

package com.zhiyou.video.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.video.model.Admin;

public class AdminLoginInteceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object controller, Exception exception)
			throws Exception {
		System.out.println("admin  complete..............");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object controller, ModelAndView md)
			throws Exception {
		System.out.println("admin  post..............");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {		
		 Admin admin=(Admin)request.getAttribute("logAdmin");
		if(admin==null){
			if(request.getServletPath().endsWith("/admin/index.jsp") 
					|| request.getServletPath().endsWith("/admin/adminlog.action") 
					|| request.getServletPath().endsWith("/admin/adminLogin.action") 
					|| request.getServletPath().endsWith("/admin/videoList.action"))
			{
				return true;
			}else{
				System.out.println("后台拦截..............");
			response.sendRedirect(request.getContextPath()+"/admin/adminlog.action");
				return false;
			}
						
		}else{
			return true;
		}		 
	}
}

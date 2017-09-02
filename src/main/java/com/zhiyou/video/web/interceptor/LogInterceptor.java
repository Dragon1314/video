package com.zhiyou.video.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.video.model.Admin;
import com.zhiyou.video.model.User;

public class LogInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object controller, Exception exception)
			throws Exception {
		System.out.println("afterCompletion........................");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object controller, ModelAndView md)
			throws Exception {
		System.out.println("posthandler...................................");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
		System.out.println("prehandler登录拦截..........................");
		Admin admin=(Admin) request.getSession().getAttribute("logAdmin");
		User user=(User) request.getSession().getAttribute("user");
		if(admin==null && user==null){
			if(request.getServletPath().equals("/front/index.action")|| request.getServletPath().endsWith("/front/user/login.do") || request.getServletPath().endsWith("/front/user/regist.action")|| request.getServletPath().endsWith("/admin/adminlog.action")|| request.getServletPath().endsWith("/admin/adminLogin.action")){
				System.out.println("登录放行。。。。。。。。。");
				return true;
			}else{
				System.out.println("登录拦截。。。。。。。。。。");
				response.sendRedirect(request.getContextPath()+"/front/index.action");
				return false;
			}
		}else{
			
			
			return true;
		}
		
		
	}

}

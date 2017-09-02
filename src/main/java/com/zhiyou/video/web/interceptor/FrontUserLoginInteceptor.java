package com.zhiyou.video.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.zhiyou.video.model.User;

public class FrontUserLoginInteceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object controller, Exception exception)
			throws Exception {
		System.out.println("user  complete。。。。。。。。。。");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object controller, ModelAndView md)
			throws Exception {
		System.out.println("user  post。。。。。。。。。。。。。");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {		
		 User user=(User)request.getAttribute("user");
		if(user==null){
			if(request.getServletPath().equals("/front/index.action")|| request.getServletPath().endsWith("/front/user/login.do") || request.getServletPath().endsWith("/front/user/regist.action") || request.getServletPath().endsWith("/front/user/index.do")){
				return true;
			}else{
				System.out.println("前台拦截..............");
			response.sendRedirect(request.getContextPath()+"/front/index.action");
				return false;
			}
						
		}else{
			return true;
		}		 
	}

}

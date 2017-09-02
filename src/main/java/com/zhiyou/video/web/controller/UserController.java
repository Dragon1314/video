package com.zhiyou.video.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.zhiyou.video.model.User;
import com.zhiyou.video.service.UserService;
import com.zhiyou.video.utils.MD5Util;
import com.zhiyou.video.utils.MailUtil;

@Controller
public class UserController {
	
   
	@Autowired
	UserService us;
	
	@RequestMapping("/front/user/regist.action")
	@ResponseBody
	public String regist(User user){
		User ruser=new User();
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());		
		User u=us.findUserByEmail(user.getEmail());
		if(u!=null){
			return "error";
		}else{
			
			ruser.setEmail(user.getEmail());
			ruser.setPassword(user.getPassword());					
			us.addUser(user.getEmail(),user.getPassword());
			return "success";
		}				
}
	
	
	@RequestMapping("/front/index.action")
	public String index(){
		
		return "/front/index";
	}

	@RequestMapping("/front/user/login.do")
	@ResponseBody
	public  User userLogin(User user,HttpSession session){
		
		
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		User loguser=us.longin(user.getEmail(),user.getPassword());
		if(loguser!=null){
			System.out.println(loguser);
			System.out.println(loguser.getPassword());
			//System.out.println(loguser.getBirthday());
			session.setAttribute("user", loguser);
			return loguser;
		}else{			
		     return null;
		}
	}
	/////////
	@RequestMapping("/front/user/index.do")
	public String shouye(String email,HttpSession session){
	
		User user=us.findUserByEmail(email);
		//String s=user.getPassword();
		//System.out.println("pwd:"+s);
				//user.setPassword(user.getPassword());
		System.out.println("shouye 生日"+user.getBirthday());
		System.out.println("头像"+user.getHeadUrl());
		System.out.println("data"+user);
		
		session.setAttribute("user", user);
		//session.setAttribute("head", user.getHeadUrl());
		return "forward:/WEB-INF/front/user/index.jsp";
	}
	//////
	@RequestMapping("/front/index.do")
	public String sy(HttpSession session){
		
		return "redirect:/front/index.action";				
	}
	////////
	@RequestMapping("/front/user/logout.do")
	public String userout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/front/index.action";				
	}
	

	
	@RequestMapping(value="/front/user/password.do",method=RequestMethod.GET)
	public String password(HttpSession session,String email){      
       session.setAttribute("email", email);
		return "forward:/WEB-INF/front/user/password.jsp";
	}
	
	@RequestMapping(value="/front/user/password.do",method=RequestMethod.POST)
	public String updatepassword(HttpSession session,String newPassword,String email){
		System.out.println(newPassword);
		System.out.println(email);		
		User u=us.findUserByEmail(email);
		u.setPassword(newPassword);
		System.out.println(u.getPassword());
		us.update(u);	
		return "forward:/front/user/index.do";
	}	
	
	@RequestMapping("/front/user/checkpassword.do")
	@ResponseBody
	public String cheekword(String email,String checkpassword){
		MD5Util md5=new MD5Util();
		//System.out.println(checkpassword);
		//System.out.println(md5.getMD5(checkpassword));
		User u=us.findPassword(email,md5.getMD5(checkpassword));		
		if(u==null){
		return "error";
		}else{
			return "success";
		}
	}
//修改头像
	
@RequestMapping(value="/front/user/avatar.do",method=RequestMethod.GET)	
public String avatar(HttpServletRequest request,String email){
	return "forward:/WEB-INF/front/user/avatar.jsp";
}

@RequestMapping(value="/front/user/avatar.do",method=RequestMethod.POST)	
public String avatarupdate(String email,MultipartFile pics) throws Exception{
	System.out.println(email);
	User user=us.findUserByEmail(email);
	String str=UUID.randomUUID().toString().replaceAll("-", "");	
	String extension=FilenameUtils.getExtension(pics.getOriginalFilename());
	String filename=str+"."+extension;
	user.setHeadUrl(filename);
	us.update(user);
	pics.transferTo(new File("D:\\uploads"+"\\"+filename));
	return "forward:/front/user/index.do";
}
	
//修改资料	
@RequestMapping(value="/front/user/profile.do",method=RequestMethod.GET)
public String pfofile(){
	return "forward:/WEB-INF/front/user/profile.jsp";	
}	
@RequestMapping(value="/front/user/profile.do",method=RequestMethod.POST)
public String pfofileupdate(User u,String birthdaystr,String email) throws Exception{
	System.out.println("网站"+email);
	System.out.println("表单"+u.getEmail());
	System.out.println(birthdaystr);
    User user=us.findUserByEmail(email);
    System.out.println("更新前"+user);
	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");	
	u.setBirthday(df.parse(birthdaystr));
    user.setNickName(u.getNickName());
    user.setSex(u.getSex());
    user.setBirthday(df.parse(birthdaystr));
    Date birth=df.parse(birthdaystr);
    user.setProvince(u.getProvince());
    user.setCity(u.getCity());
    System.out.println(user.getHeadUrl());
    //System.out.println("data pass"+user.getPassword());
    //user.setPassword(user.getPassword());
    //System.out.println("更新用户"+user);
   // System.out.println("跟新用户"+user.getHeadUrl());
   //user.setHeadUrl(user.getHeadUrl());
	//us.update(user);
	us.updateInfo(u.getNickName(),u.getSex(),birth,u.getProvince(),u.getCity(),user.getHeadUrl(),email);
	return "forward:/front/user/index.do";	
}		
	
	
	
	
	
	@RequestMapping(value="/front/forgetpwd.do",method=RequestMethod.GET)
	public String forget(){
		
		return "forward:/WEB-INF/front/user/forget_pwd.jsp";				
	      
	}
	@RequestMapping(value="/front/forgetpwd.do",method=RequestMethod.POST)
	public String forgetm(String email,String captcha,HttpServletRequest request){
		 User user=us.checkVerify(email,captcha);
		 if(user!=null){
			 request.setAttribute("email", email);
			 request.setAttribute("captcha", captcha);
			 return "forward:/WEB-INF/front/user/reset_pwd.jsp";
		 }else{
			 return "";
		 }	      
	}	
	
	@RequestMapping("/front/resetpwd.do")
	public String resetpwd(String email,String password){
		MD5Util md5=new MD5Util();		
		us.resetPwd(email,md5.getMD5(password));
		return "redirect:/front/index.action";
	}
	
	
	@RequestMapping("/front/sendemail.do")
	@ResponseBody
	public String sendm(String email) throws Exception{
		System.out.println(email);
		Random random=new Random();
		
		int verify=random.nextInt(999999);
		User use=us.findUserByEmail(email);
		use.setCaptcha(String.valueOf(verify));
		us.update(use);
		System.out.println(verify);	
		String ve="尊敬的用户您好：你的验证码为："+String.valueOf(verify);
		MailUtil.send(email, "验证码",ve);
		return "success";
	}
}

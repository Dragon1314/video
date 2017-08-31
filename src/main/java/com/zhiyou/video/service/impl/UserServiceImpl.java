package com.zhiyou.video.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.video.mapper.UserMapper;
import com.zhiyou.video.model.User;
import com.zhiyou.video.model.UserExample;
import com.zhiyou.video.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper um;

	@Override
	public User longin(String email, String password) {
		UserExample ue=new UserExample();
		ue.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(password);
		List<User> list=um.selectByExample(ue);
		if(list.isEmpty()){
			return null;
		}else{
		    return list.get(0);
	   }
}

	@Override
	public User findUserByEmail(String email) {
         UserExample ue=new UserExample();
         ue.createCriteria().andEmailEqualTo(email);
		List<User> list=um.selectByExample(ue); 
		if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}
		
	}

	@Override
	public void update(User u) {
		um.updateByPrimaryKeySelective(u);
	}

	@Override
	public User findPassword(String email, String checkpassword) {
        UserExample ue=new UserExample();
        ue.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(checkpassword);
		List<User> list=um.selectByExample(ue);
		if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}

	}

	@Override
	public void addUser(String email, String password) {
		um.addUser(email,password);
	}

	@Override
	public void updateInfo(String nickName, Integer sex, Date birth, String province, String city,String head,String email) {
		um.updateInfo(nickName,sex,birth,province,city,head,email);
	}

	@Override
	public User checkVerify(String email, String captcha) {
        UserExample ue=new UserExample();
        ue.createCriteria().andEmailEqualTo(email).andCaptchaEqualTo(captcha);
		List<User> list=um.selectByExample(ue);
		if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}
		
	}

	@Override
	public void resetPwd(String email, String password) {
		um.resetPwd(email,password);
	}


	
	
}

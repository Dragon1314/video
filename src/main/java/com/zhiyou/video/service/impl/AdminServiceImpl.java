package com.zhiyou.video.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhiyou.video.mapper.AdminMapper;
import com.zhiyou.video.model.Admin;
import com.zhiyou.video.model.AdminExample;
import com.zhiyou.video.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
	AdminMapper am;

	@Override
	public Admin adminLogin(String loginName, String loginPwd) {
	/*	UserExample ue=new UserExample();		
		UserExample.Criteria ck=ue.createCriteria();
		ck.andUNameEqualTo(username).andUPwdEqualTo(pwd);
		List<User> users=um.selectByExample(ue);
		if(users.isEmpty()){
			return null;
		}else{
			return users.get(0);
		}*/		
		AdminExample ex=new AdminExample();
		AdminExample.Criteria ck=ex.createCriteria();
		ck.andLoginNameEqualTo(loginName).andLoginPwdEqualTo(loginPwd);
		List<Admin> admins=am.selectByExample(ex);
		
		if(admins.isEmpty()){
			System.out.println("没取到值。。。。。。。。。");
			return null;
		}else{
			return admins.get(0);
		}
	}


}

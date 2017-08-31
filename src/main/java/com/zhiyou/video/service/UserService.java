package com.zhiyou.video.service;

import java.util.Date;

import com.zhiyou.video.model.User;

public interface UserService {

	User longin(String email, String password);

	User findUserByEmail(String email);

	void update(User u);

	User findPassword(String email, String checkpassword);

	void addUser(String email, String password);

	void updateInfo(String nickName, Integer sex, Date birth, String province, String city,String head,String email);

	User checkVerify(String email, String captcha);

	void resetPwd(String email, String password);

	


}

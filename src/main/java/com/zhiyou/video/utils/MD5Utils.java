package com.zhiyou.video.utils;

import org.springframework.util.DigestUtils;

public class MD5Utils {
	
	public String getMD5(String pwd){				
		return DigestUtils.md5DigestAsHex(pwd.getBytes());
	}
	
}

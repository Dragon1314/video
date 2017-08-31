package com.zhiyou.video.utils;

import org.springframework.util.DigestUtils;

public class MD5Util {	
	
	
	public String getMD5(String pwd){				
		return DigestUtils.md5DigestAsHex(pwd.getBytes());
	}
	
	
}

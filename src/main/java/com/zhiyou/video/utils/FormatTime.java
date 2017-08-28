package com.zhiyou.video.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class FormatTime implements Converter<String,Timestamp> {

	@Override
	public Timestamp convert(String arg0) {
		DateFormat df=new SimpleDateFormat("yyyy-MM+dd hh:mm:ss");	
		  Timestamp t=null;
        try {
			Date date=df.parse(arg0);
			t=new Timestamp(date.getTime());			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return t;
	}



}

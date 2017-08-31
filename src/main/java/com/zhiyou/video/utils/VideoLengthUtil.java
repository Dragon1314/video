package com.zhiyou.video.utils;

public class VideoLengthUtil {
	
	
	public static String getVideoTime(Integer length){
		String videotime=null;
		int h=length/3600==0?00:length/3600;
		String h1=h<10? "0"+String.valueOf(h) : String.valueOf(h);
		int m=(length-h*3600)/60==0?00:(length-h*3600)/60;
		String m1=m<10 ? "0"+String.valueOf(m) : String.valueOf(m);
		int s=length%60==0?00 :length%60;
		String s1=s<10? "0"+String.valueOf(s) : String.valueOf(s);		
		videotime=h1+":"+m1+":"+s1;		
		return videotime;
	}
	
	

}

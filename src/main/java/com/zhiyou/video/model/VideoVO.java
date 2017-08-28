package com.zhiyou.video.model;

import java.util.List;

public class VideoVO {
	
	
 private Video video;
 private Speaker speaker;
 private Course course;
 
 private List<Video> vlist;
 
 
	public List<Video> getVlist() {
	return vlist;
}
public void setVlist(List<Video> vlist) {
	this.vlist = vlist;
}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public Speaker getSpeaker() {
		return speaker;
	}
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	

}

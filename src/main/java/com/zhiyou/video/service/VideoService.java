package com.zhiyou.video.service;

import java.util.List;

import com.zhiyou.video.model.Video;
import com.zhiyou.video.utils.Page;

public interface VideoService {

	public List<Video> findAllVideo();

	public Page<Video> findAllVideo(String videoTitle, Integer speakerId, Integer courseId, Integer page);

	public Video findVideoById(Integer id);

	public void updateVideo(Video video);

	public void addVideo(Video video);

	public void deleteVideoById(Integer id);

	public List<Video> findCourseWithPlayTimes();

}

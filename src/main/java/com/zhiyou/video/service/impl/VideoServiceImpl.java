package com.zhiyou.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.video.mapper.VideoMapper;
import com.zhiyou.video.model.Video;
import com.zhiyou.video.service.VideoService;
import com.zhiyou.video.utils.Page;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoMapper vm;
	
	@Override
	public List<Video> findAllVideo() {
		return vm.selectByExample(null);
	}
	
	@Override
	public Page<Video> findAllVideo(String videoTitle, Integer speakerId, Integer courseId, Integer page) {
		Page<Video> pageInfo=new Page<Video>();
		pageInfo.setPage(page);
		//System.out.println("ccccccc"+vm.findAllVideoCount(videoTitle,speakerId,courseId,page));
		pageInfo.setTotal(vm.findAllVideoCount(videoTitle,speakerId,courseId,page));
		pageInfo.setSize(10);
		//System.out.println("zzzzzz"+vm.findAllVideo(videoTitle,speakerId,courseId,page));
		pageInfo.setRows(vm.findAllVideo(videoTitle,speakerId,courseId,page));
		return pageInfo;
	}
	
	@Override
	public Video findVideoById(Integer id) {	
		return vm.selectByPrimaryKey(id);
	}
	
	@Override
	public void updateVideo(Video video) {
			vm.updateByPrimaryKeySelective(video);
	}

	@Override
	public void addVideo(Video video) {
	         vm.insertSelective(video);
	}

	@Override
	public void deleteVideoById(Integer id) {
	    vm.deleteByPrimaryKey(id);		
	}

	@Override
	public List<Video> findCourseWithPlayTimes() {
		List<Video> list=vm.findCourseWithPlayTimes();
		
		return list;
	}

	@Override
	public List<Video> findAllVideoByCourseId(Integer id) {
       List<Video> vlist=vm.findAllVideoByCourseId(id);
		return vlist;
	}

}

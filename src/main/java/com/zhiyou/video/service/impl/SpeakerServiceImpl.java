package com.zhiyou.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.video.mapper.SpeakerMapper;
import com.zhiyou.video.model.Speaker;
import com.zhiyou.video.service.SpeakerService;
import com.zhiyou.video.utils.Page;

@Service
public class SpeakerServiceImpl implements SpeakerService {

	@Autowired
	SpeakerMapper sm;
	
	@Override
	public List<Speaker> findAllSpeaker() {
		return sm.selectByExample(null);
	}

	@Override
	public Page<Speaker> findAllSpeaker(String speakerName, String speakerJob, Integer page) {
        Page<Speaker> pageInfo=new Page<Speaker>();
        pageInfo.setPage(page);
        pageInfo.setTotal(sm.findAllSpeakerCount(speakerName,speakerJob,page));
        pageInfo.setSize(10);
        pageInfo.setRows(sm.findAllSpeaker(speakerName,speakerJob,page));
		return pageInfo;
	}

	@Override
	public void addSpeaker(Speaker speaker) {
        sm.insertSelective(speaker);		
	}

	@Override
	public Speaker findSpeakerById(Integer id) {
		return sm.selectByPrimaryKey(id);
	}

	@Override
	public void updateSpeaker(Speaker speaker) {
		sm.updateByPrimaryKeySelective(speaker);
	}

	@Override
	public void deleteSpeaker(Integer id) {
		sm.deleteByPrimaryKey(id);
	}

}

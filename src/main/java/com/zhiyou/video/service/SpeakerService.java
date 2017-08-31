package com.zhiyou.video.service;

import java.util.List;

import com.zhiyou.video.model.Speaker;
import com.zhiyou.video.utils.Page;

public interface SpeakerService {

	List<Speaker> findAllSpeaker();

	Page<Speaker> findAllSpeaker(String speakerName, String speakerJob, Integer page);

	void addSpeaker(Speaker speaker);

	Speaker findSpeakerById(Integer id);

	void updateSpeaker(Speaker speaker);

	void deleteSpeaker(Integer id);

	Speaker findSpeakerByVideoId(Integer videoId);

	

}

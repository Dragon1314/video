package com.zhiyou.video.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhiyou.video.mapper.SubjectMapper;
import com.zhiyou.video.model.Subject;
import com.zhiyou.video.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	SubjectMapper sm;
	@Override
	public List<Subject> findAllSubject() {
		return sm.selectByExample(null);
	}


}

package com.zhiyou.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.video.mapper.CourseMapper;
import com.zhiyou.video.model.Course;
import com.zhiyou.video.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper cm;
	@Override
	public List<Course> findAllCourse() {
		return cm.selectByExample(null);
	}
	@Override
	public List<Course> findAllCourseWithSubjectName() {

		return cm.findAllCourseWithSubjectName();
	}
	@Override
	public void addCourse(Course course) {
		cm.insertSelective(course);
	}
	@Override
	public Course findCourseById(Integer id) {
		return cm.selectByPrimaryKey(id);
	}
	@Override
	public void updateCourse(Course course) {
		cm.updateByPrimaryKeySelective(course);
	}
	@Override
	public void deleteCourseById(Integer id) {
		cm.deleteByPrimaryKey(id);
	}
	@Override
	public List<Course> FindAllCourseWithVideos() {
		
		return cm.findAllCourseWithVideos();
	}
	@Override
	public Course findCourseByVideoId(Integer videoId) {
	   Course course=cm.findCourseByVideoId(videoId);
		return course;
	}
	@Override
	public List<Course> FindAllCourseBySubjectId(Integer subjectId) {
	
		return cm.findAllCourseBySubjectId(subjectId);
	}

}

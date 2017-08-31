package com.zhiyou.video.service;

import java.util.List;

import com.zhiyou.video.model.Course;

public interface CourseService {

	List<Course> findAllCourse();

	List<Course> findAllCourseWithSubjectName();

	void addCourse(Course course);

	Course findCourseById(Integer id);

	void updateCourse(Course course);

	void deleteCourseById(Integer id);

	List<Course> FindAllCourseWithVideos();

	Course findCourseByVideoId(Integer videoId);

	List<Course> FindAllCourseBySubjectId(Integer subjectId);

	

}

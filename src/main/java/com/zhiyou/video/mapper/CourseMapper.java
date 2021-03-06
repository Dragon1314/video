package com.zhiyou.video.mapper;

import com.zhiyou.video.model.Course;
import com.zhiyou.video.model.CourseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CourseMapper {
    int countByExample(CourseExample example);

    int deleteByExample(CourseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    List<Course> selectByExample(CourseExample example);

    Course selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Course record, @Param("example") CourseExample example);

    int updateByExample(@Param("record") Course record, @Param("example") CourseExample example);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

	List<Course> findAllCourseWithSubjectName();

	List<Course> findAllCourseWithVideos();

	Course findCourseByVideoId(@Param("videoId")Integer videoId);

	List<Course> findAllCourseBySubjectId(@Param("subjectId")Integer subjectId);
}
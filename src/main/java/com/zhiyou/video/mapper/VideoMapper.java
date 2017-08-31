package com.zhiyou.video.mapper;

import com.zhiyou.video.model.Video;
import com.zhiyou.video.model.VideoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VideoMapper {
    int countByExample(VideoExample example);

    int deleteByExample(VideoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Video record);

    int insertSelective(Video record);

    List<Video> selectByExample(VideoExample example);

    Video selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Video record, @Param("example") VideoExample example);

    int updateByExample(@Param("record") Video record, @Param("example") VideoExample example);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);

	Integer findAllVideoCount(@Param("videoTitle")String videoTitle, @Param("speakerId")Integer speakerId, @Param("courseId")Integer courseId,@Param("page")Integer page);

	List<Video> findAllVideo(@Param("videoTitle")String videoTitle, @Param("speakerId")Integer speakerId, @Param("courseId")Integer courseId,@Param("page")Integer page);

	List<Video> findCourseWithPlayTimes();

	List<Video> findAllVideoByCourseId(@Param("id")Integer id);
}
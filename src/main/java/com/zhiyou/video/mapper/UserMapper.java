package com.zhiyou.video.mapper;

import com.zhiyou.video.model.User;
import com.zhiyou.video.model.UserExample;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	void addUser(@Param("email")String email,@Param("password")String password);

	void updateInfo(@Param("nickName")String nickName, @Param("sex")Integer sex, @Param("birth")Date parse, @Param("province")String province, @Param("city")String city, @Param("head")String head,@Param("email")String email);

	void resetPwd(@Param("email")String email, @Param("password")String password);
}
package com.offcn.dao;

import com.offcn.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserDao {

    //登录查询
    @Select("select * from user where username = #{username} and password = #{password}")
    public User checkUser(@Param("username") String username,@Param("password") String password);

    //注册操作
    @Insert("insert into user values(null,#{name},#{email},#{status},#{username},#{password},#{modifytime})")
    public int addUser(User user);

    //根据用户名查询
    @Select("select * from user where username = #{username}")
    public User findByUserName(String username);
}

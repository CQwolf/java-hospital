package com.offcn.dao;

import com.offcn.entity.Doctor;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface DoctorDao {

    //查询全部医生的方法
    public List<Doctor> find(@Param("name") String name,@Param("department") int department);

    //添加医生的方法
    @Insert("insert into doctor value(#{did},#{name},#{cardno},#{phone},#{sex},#{age},#{birthday},#{email},#{department},#{education},#{remark})")
    public int add(Doctor doctor);

    //根据id查询信息
    @Select("select * from doctor where did = #{did}")
    public Doctor findById(int did);

    //修改医生信息的方法
    @Update("update doctor set name=#{name},cardno=#{cardno},phone=#{phone}," +
            "sex=#{sex},age=#{age},birthday=#{birthday},email=#{email},department=#{department}," +
            "education=#{education},remark=#{remark} where did=#{did}")
    public int edit(Doctor doctor);

    //批量删除功能
    public int delBatch(List<Integer> ids);
}

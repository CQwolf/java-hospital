package com.offcn.dao;

import com.offcn.entity.Medicine;
import com.offcn.entity.Register;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RegisterDao {

    //    查询全部药品的方法
    public List<Register> find(@Param("rid") String rid,@Param("name") String name, @Param("department") int department);

    //    添加药品的方法
    @Insert("insert into register value(#{rid},#{name},#{idCard},#{siNumber},#{registerMoney}" +
            ",#{phone},#{isPay},#{sex},#{age},#{consultation},#{department},#{did},#{status},#{registerDate},#{remark})")
    public int add(Register register);

    //    根据id查询信息
    @Select("select * from register where rid = #{rid}")
    public Register findById(String rid);

    //    修改药品信息的方法
    @Update("update register set name=#{name},idCard=#{idCard},siNumber=#{siNumber}," +
            "registerMoney=#{registerMoney},phone=#{phone},isPay=#{isPay},sex=#{sex},age=#{age}," +
            "consultation=#{consultation},department=#{department},did=#{did}," +
            "status=#{status},remark=#{remark} where rid=#{rid}")
    public int edit(Register register);

    //    批量删除功能
    public int delBatch(List<String> ids);
}

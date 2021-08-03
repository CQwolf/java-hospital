package com.offcn.dao;

import com.offcn.entity.Medicine;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface MedicineDao {

    //    查询全部药品的方法
    public List<Medicine> find(@Param("name") String name, @Param("type") int type);

    //    添加药品的方法
    @Insert("insert into medicine value(#{mid},#{inPrice},#{salPrice},#{name},#{type},#{descs},#{qualityDate},#{description},#{produceFirm},#{readme},#{remark})")
    public int add(Medicine medicine);

    //    根据id查询信息
    @Select("select * from medicine where mid = #{mid}")
    public Medicine findById(String mid);

    //    修改药品信息的方法
    @Update("update medicine set inPrice=#{inPrice},salPrice=#{salPrice},name=#{name}," +
            "type=#{type},descs=#{descs},qualityDate=#{qualityDate},description=#{description},produceFirm=#{produceFirm}," +
            "readme=#{readme},remark=#{remark} where mid=#{mid}")
    public int edit(Medicine medicine);

    //    批量删除功能
    public int delBatch(List<String> ids);
}

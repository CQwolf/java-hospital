package com.offcn.controller;

import com.offcn.dao.DoctorDao;
import com.offcn.entity.Doctor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("doctor")
public class DoctorController {

    //引用DoctorDao
    @Resource
    private DoctorDao doctorDao;

    //查询医生的信息
    @RequestMapping("find")
    public String find(@RequestParam(name="name",defaultValue = "") String name,@RequestParam(name="department",defaultValue = "0") int department, HttpSession session){
        name = name.trim();
        //查询医生信息
        List<Doctor> doctorList = doctorDao.find(name,department);
        //用session来存放数据
        session.setAttribute("doctorList",doctorList);
        session.removeAttribute("doctorName");
        session.removeAttribute("doctorDepartment");
        if(name != "" && name != null){
            session.removeAttribute("doctorName");
            session.setAttribute("doctorName",name);
        }
        if(department > 0){
            session.removeAttribute("doctorDepartment");
            session.setAttribute("doctorDepartment",department);
        }
        return "redirect:index.jsp";
    }

    //添加医生的信息
    @RequestMapping("add")
    public String add(Doctor doctor){
        //添加信息
        doctorDao.add(doctor);
        return "redirect:find";
    }

    //编辑医生信息
    @RequestMapping("toEdit")
    public String toEdit(int did,HttpSession session){
        Doctor doctor = doctorDao.findById(did);
        session.setAttribute("doctor",doctor);
        return "redirect:edit.jsp";
    }

    //编辑医生信息后提交进行修改
    @RequestMapping("edit")
    public String edit(Doctor doctor){
        //修改信息
        doctorDao.edit(doctor);
        return "redirect:find";
    }

    //批量删除医生信息
    @RequestMapping("delBatch")
    public String delBatch(@RequestParam("ids") List<Integer> ids){
        int i = doctorDao.delBatch(ids);
        System.out.println(i);
        return "redirect:find";
    }

    //医生详情页面的查询
    @RequestMapping("toLook")
    public String toLook(int did,HttpSession session){
        Doctor doctor = doctorDao.findById(did);
        session.setAttribute("doctor",doctor);
        return "redirect:look.jsp";
    }
}

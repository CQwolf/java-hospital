package com.offcn.controller;

import com.offcn.dao.DoctorDao;
import com.offcn.dao.RegisterDao;
import com.offcn.entity.Doctor;
import com.offcn.entity.Medicine;
import com.offcn.entity.Register;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("register")
public class RegisterController {

    //引用RegisterDao
    @Resource
    private RegisterDao registerDao;
    @Resource
    private DoctorDao doctorDao;

    //查询挂号的信息
    @RequestMapping("find")
    public String find(@RequestParam(name="rid",defaultValue = "") String rid,@RequestParam(name="name",defaultValue = "") String name, @RequestParam(name="department",defaultValue = "0") int department, HttpSession session){
        rid = rid.trim();
        name = name.trim();
        //查询挂号信息
        List<Register> registerList = registerDao.find(rid,name,department);
        //查询医生信息
        List<Doctor> doctorList = doctorDao.find("",0);
        //用session来存放数据
        session.setAttribute("registerList",registerList);
        session.setAttribute("doctorList",doctorList);
        if(rid != "" && rid != null){
            session.removeAttribute("registerRid");
            session.setAttribute("registerRid",rid);
        }
        if(name != "" && name != null){
            session.removeAttribute("registerName");
            session.setAttribute("registerName",name);
        }
        if(department > 0){
            session.removeAttribute("registerDepartment");
            session.setAttribute("registerDepartment",department);
        }
        return "redirect:index.jsp";
    }

    //添加挂号的信息
    @RequestMapping("add")
    public void add(Register register, HttpServletResponse response) throws IOException {
        //解决响应体编码
        response.setContentType("text/html;charset=utf-8");
        //查询药品编号是否被使用
        Register registerRid = registerDao.findById(register.getRid());
        if(registerRid == null){
            //查看插入行数
            //添加信息
            //设置挂号时间
            register.setRegisterDate(new Date());
            registerDao.add(register);
            response.getWriter().print("<script>location.href='find'</script>");
        } else {
            response.getWriter().print("<script>alert('挂号失败,此病历号已被添加');location.href='add.jsp'</script>");
        }
    }


    //    处理Rid编号
    @RequestMapping("checkRid")
    public void checkUser(String rid, HttpServletResponse response) throws IOException {
//        判断是否存在用户的输入名
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        Register registerRid = registerDao.findById(rid);
        if(registerRid != null){
//            存在则拒绝且把数据发送到POST的data数据
            writer.print("病历号已存在");
        }
        else {//            不存在则接受
            writer.print("病历号可用");
        }
    }


    //编辑挂号信息
    @RequestMapping("toEdit")
    public String toEdit(String rid,HttpSession session){
        Register register = registerDao.findById(rid);
        session.setAttribute("register",register);
        return "redirect:edit.jsp";
    }

    //编辑药品信息后提交进行修改
    @RequestMapping("edit")
    public String edit(Register register){
        //修改信息
        registerDao.edit(register);
        return "redirect:find";
    }

    //批量删除药品信息
    @RequestMapping("delBatch")
    public String delBatch(@RequestParam("ids") List<String> ids){
        int i = registerDao.delBatch(ids);
        System.out.println(i);
        return "redirect:find";
    }

    //药品详情页面的查询
    @RequestMapping("toLook")
    public String toLook(String rid,HttpSession session){
        Register register = registerDao.findById(rid);
        session.setAttribute("register",register);
        return "redirect:look.jsp";
    }

}

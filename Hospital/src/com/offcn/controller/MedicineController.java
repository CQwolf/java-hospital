package com.offcn.controller;

import com.offcn.dao.MedicineDao;
import com.offcn.entity.Medicine;
import com.offcn.entity.User;
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
@RequestMapping("medicine")
public class MedicineController {
    //引用MedicineDao
    @Resource
    private MedicineDao medicineDao;

    //查询药品的信息
    @RequestMapping("find")
    public String find(@RequestParam(name="name",defaultValue = "") String name, @RequestParam(name="type",defaultValue = "0") int type, HttpSession session){
        name = name.trim();
        //查询药品信息
        List<Medicine> medicineList = medicineDao.find(name,type);
        //用session来存放数据
        session.setAttribute("medicineList",medicineList);
        if(name != "" && name != null){
            session.removeAttribute("medicineName");
            session.setAttribute("medicineName",name);
        }
        if(type > 0){
            session.removeAttribute("medicineType");
            session.setAttribute("medicineType",type);
        }
        return "redirect:index.jsp";
    }

    //添加药品的信息
    @RequestMapping("add")
    public void add(Medicine medicine, HttpServletResponse response) throws IOException {
        //解决响应体编码
        response.setContentType("text/html;charset=utf-8");
        //查询药品编号是否被使用
        Medicine medicineMid = medicineDao.findById(medicine.getMid());
        if(medicineMid == null){
            //查看插入行数
            //添加信息
            medicineDao.add(medicine);
            response.getWriter().print("<script>location.href='find'</script>");
        } else {
            response.getWriter().print("<script>alert('药品添加失败,药品编号已被注册');location.href='add.jsp'</script>");
        }
    }

    //    处理Mid编号
    @RequestMapping("checkMid")
    public void checkUser(String mid, HttpServletResponse response) throws IOException {
//        判断是否存在用户的输入名
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        Medicine medicineMid = medicineDao.findById(mid);
        if(medicineMid != null){
//            存在则拒绝且把数据发送到POST的data数据
            writer.print("药品编号已存在");
        }
        else {
//            不存在则接受
            writer.print("药品编号可用");
        }
    }

    //编辑药品信息
    @RequestMapping("toEdit")
    public String toEdit(String mid,HttpSession session){
        Medicine medicine = medicineDao.findById(mid);
        session.setAttribute("medicine",medicine);
        return "redirect:edit.jsp";
    }

    //编辑药品信息后提交进行修改
    @RequestMapping("edit")
    public String edit(Medicine medicine){
        //修改信息
        System.out.println(medicine.getName());
        medicineDao.edit(medicine);
        return "redirect:find";
    }

    //批量删除药品信息
    @RequestMapping("delBatch")
    public String delBatch(@RequestParam("ids") List<String> ids){
        int i = medicineDao.delBatch(ids);
        System.out.println(i);
        return "redirect:find";
    }

    //药品详情页面的查询
    @RequestMapping("toLook")
    public String toLook(String mid,HttpSession session){
        Medicine medicine = medicineDao.findById(mid);
        session.setAttribute("medicine",medicine);
        return "redirect:look.jsp";
    }
}

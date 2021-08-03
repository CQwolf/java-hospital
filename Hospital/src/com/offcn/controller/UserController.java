package com.offcn.controller;

import com.offcn.dao.UserDao;
import com.offcn.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private UserDao userdao;
    //处理用户的登录请求
    @RequestMapping("login")
    public void userLogin(String username, String password, String verify,
                          HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        //得到生成的验证码
        String verCode = (String) session.getAttribute("verCode");
        if(verCode.equalsIgnoreCase(verify)){
            //连接数据库，查看是否登录成功
            User user = userdao.checkUser(username,password);
            if(user != null){
                session.setAttribute("user",user);
                response.getWriter().print("<script>alert('恭喜！登录成功');location.href='../index.jsp'</script>");
            } else {
                response.getWriter().print("<script>alert('用户名或密码错误');location.href='../login.jsp'</script>");
            }
        }else {
            response.getWriter().print("<script>alert('验证码错误');location.href='../login.jsp'</script>");
        }
    }

    //用户注销操作
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("user");
        return "redirect:../login.jsp";
    }

    //用户注册操作
    @RequestMapping("register")
    public void register(User user,HttpServletResponse response) throws IOException {
        //解决响应体编码
        response.setContentType("text/html;charset=utf-8");
        //查询用户名是否被使用
        User userCh = userdao.findByUserName(user.getUsername());
        if(userCh == null){
            //设置状态
            user.setStatus(1);
            //设置注册时间
            user.setModifytime(new Date());
            //查看插入行数
            int row = userdao.addUser(user);
            if(row > 0) {
                response.getWriter().print("<script>alert('注册成功');location.href='../login.jsp'</script>");
            }else {
                response.getWriter().print("<script>alert('注册失败');location.href='../regist.jsp'</script>");
            }
        } else {
            response.getWriter().print("<script>alert('注册失败,用户名已被注册');location.href='../regist.jsp'</script>");
        }
    }
}

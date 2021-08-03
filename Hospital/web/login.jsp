<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>优就业-线医疗管理系统</title>
	<meta charset="UTF-8">
	<link rel="icon" href="Images/logo_favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
    <script type="text/javascript" src="Js/jquery-3.4.1.js"></script>
    <style type="text/css">
        body {
            padding-top: 140px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
            font-family: "微软雅黑";
            background: url("Images/yy1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: top center;
        }

        .form-signin {
            max-width: 400px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            background: rgba(255,255,255,0.9);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
            font-size: 24px;
            margin-left: 90px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

		#message{
			font-size: 14px;
			color:red;
			margin-left: 40px;
		}
		
		.input-block-level{
			width: 300px;
			margin-left: 40px;
		}
		.input-medium{
			margin-left: 40px;
		}
		.code_images{
			width: 115px;
			height: 35px;
			margin-top: -15px;
			margin-left: 10px;
            cursor: pointer;
		}
		.error{
			color: red;
			font-size: 12px;
		}
        .my-cq-register {
            padding-left: 28px;
            font-size: 16px;
        }
        .my-cq-register:hover {
            color: #ff6c4c;
            text-decoration: none;
        }

    </style>  
</head>
<body>
<div class="container">
	
    <form class="form-signin" method="post" action="user/login">
        <h2 class="form-signin-heading" >在线医疗管理系统</h2>
        <span id="message" class="message">${msg }</span><br>
        <input type="text" name="username" class="input-block-level" value="" placeholder="账号">
        <input type="password" name="password" class="input-block-level" placeholder="密码" value="">
        <input type="text" name="verify" class="input-medium" placeholder="验证码">
        <img id="code" class="code_images"  src="getCode" onclick="javascript:changeImg()" />
		<!--  
			验证码功能参考：
			https://www.cnblogs.com/jianlun/articles/5553452.html
		-->
<%--        <br>--%>
<%--        <a href='#' onclick="javascript:changeImg()" style="color:white;"><label style="color:black;">看不清？</label></a>--%>
        <p>
            <input id="login" type="submit" value="登录" name="login" class="btn btn-large btn-primary" style="width: 150px;margin-left: 42px"/>
            <a href="regist.jsp" class="my-cq-register">请先注册</a>
        </p>
    </form>
</div>
<!-- 触发JS刷新-->
<script type="text/javascript">

    //方法一
    // const code = document.getElementById("code");
    // code.src = "getCode?"+Math.random();

    // 方法二
    // function changeImg() {
    //     $("#code").prop("src","getCode?id =" + new Date()); //有点慢
    // }


    // 方法三
    function changeImg(){
        $("#code").prop("src","getCode?id=" + Math.random());
    }
</script>
</body>
</html>
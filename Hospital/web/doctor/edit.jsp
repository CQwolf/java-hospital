<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>	
	
    <title>修改医生</title>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${path}Js/jquery.validate.js"></script>


    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
        .error{
            display: inline-block;
            vertical-align: top;
            padding: 2px 5px;
            color: red;
            font-size: 14px;
        }

    </style>
    <script type="text/javascript">
        $(function () {
            $("form").validate(
                {
                    errorElement: "span",
                    rules: {
                        name: "required",
                        cardno: {
                            required: true,
                            minlength: 18,
                            maxlength: 18,
                            digits: true
                        },
                        phone: {
                            required: true,
                            minlength: 11,
                            maxlength: 11,
                            digits: true
                        },
                        age: {
                            required: true,
                            digits: true
                        },
                        email:{
                            email:true
                        }
                    },
                    messages: {
                        name: "名字不能为空",
                        cardno: {
                            required: "身份证不能为空",
                            minlength: "身份证必须为18位",
                            maxlength: "身份证必须为18位",
                            digits: "必须输入整数"
                        },
                        phone: {
                            required: "手机号不能为空",
                            minlength: "手机号必须为11位",
                            maxlength: "手机号必须为11位",
                            digits: "必须输入整数"
                        },
                        age: {
                            required: "年龄不能为0",
                            digits: "必须输入整数"
                        },
                        email:{
                            email:"邮箱格式不正确"
                        }
                    }
                }
            );

            $('#backid').click(function(){
                //祖传方法
                window.history.back(-1);
            });

        });
    </script>
</head>
<body>
<form action="${path }doctor/edit" method="post" class="definewidth m20">
<input type="hidden" name="did" value="${doctor.did}"/>
<input type="hidden" name="method" value="updateDoctor"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td><input type="text" name="name" value="${doctor.name}"/></td>
    </tr>
    
    <tr>
        <td width="10%" class="tableleft">身份证号</td>
        <td><input type="text" name="cardno" value="${doctor.cardno}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">手机</td>
        <td><input type="text" name="phone" value="${doctor.phone}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">性别</td>
        <td>
            <input type="radio" name="sex" value="0" <c:if test="${doctor.sex == 0}">checked</c:if> />男&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="sex" value="1" <c:if test="${doctor.sex == 1}">checked</c:if> />女
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">出生年月</td>
        <td><input type="text" name="birthday" class="Wdate" 
        onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                   value="<fmt:formatDate value="${doctor.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">年龄</td>
        <td><input type="text" name="age" value="${doctor.age}"/>岁</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">电子邮箱</td>
        <td><input type="text" name="email" value="${doctor.email}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">所属科室</td>
        <td>
        	<select name="department">
        		<option value="1" <c:if test="${doctor.department == 1}">selected</c:if> >急诊科</option>
        		<option value="2" <c:if test="${doctor.department == 2}">selected</c:if> >儿科</option>
        		<option value="3" <c:if test="${doctor.department == 3}">selected</c:if> >妇科</option>
        		<option value="4" <c:if test="${doctor.department == 4}">selected</c:if> >皮肤科</option>
        		<option value="5" <c:if test="${doctor.department == 5}">selected</c:if> >内分泌科</option>
        		<option value="6" <c:if test="${doctor.department == 6}">selected</c:if> >牙科</option>
        	</select>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">学历</td>
        <td>
        	<select name="education">
        		<option value="1" <c:if test="${doctor.department == 1}">selected</c:if>>专科</option>
        		<option value="2" <c:if test="${doctor.department == 2}">selected</c:if>>本科</option>
        		<option value="3" <c:if test="${doctor.department == 3}">selected</c:if>>研究生</option>
        		<option value="4" <c:if test="${doctor.department == 4}">selected</c:if>>博士</option>
        	</select>
        </td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td><textarea name="remark" >${doctor.remark}</textarea></td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
				<input name="save" id="save" type="submit" class="btn btn-primary" value="保存"/> &nbsp;&nbsp;
				<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
</form>
</body>
</html>
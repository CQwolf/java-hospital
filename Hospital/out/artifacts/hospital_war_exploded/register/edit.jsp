<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>

    <title>挂号</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery-3.4.1.js"></script>
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
    <script>
        $(function () {
            $("form").validate(
                {
                    errorElement: "span",
                    rules: {
                        rid: {
                            required: true,
                        },
                        name: "required",
                        idCard: {
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
                        registerMoney: {
                            required: true,
                            range:[0,2000]
                        },
                        age: {
                            required: true,
                            digits: true
                        }
                    },
                    messages: {
                        rid: {
                            required: "病历号不能为空",
                        },
                        name: "名字不能为空",
                        idCard: {
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
                        registerMoney: {
                            required: "挂号费不能为0",
                        },
                        age: {
                            required: "年龄不能为空",
                            digits: "必须输入整数"
                        }
                    }
                }
            );
            $('#backid').click(function(){
                //祖传方法
                window.history.back(-1);
            });
        })
    </script>
</head>
<body>
<form action="${path }register/edit" method="post" class="definewidth m20">

<input name="method" value="updateRegister" type="hidden">
<input name="rid" value="${register.rid}" type="hidden">

<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td><input type="text" name="name" value="${register.name}"/></td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">身份证号</td>
        <td><input type="text" name="idCard" value="${register.idCard}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">社保号</td>
        <td><input type="text" name="siNumber" value="${register.siNumber}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">挂号费</td>
        <td><input type="text" name="registerMoney" value="${register.registerMoney}"/>元</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">联系电话</td>
        <td><input type="text" name="phone" value="${register.phone}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">是否自费</td>
        <td>
            <input type="radio" name="isPay" value="1" <c:if test="${register.isPay == 1}">checked</c:if>/>否&nbsp;&nbsp;&nbsp;
            <input type="radio" name="isPay" value="0" <c:if test="${register.isPay == 0}">checked</c:if>/>是
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">性别</td>
        <td>
            <input type="radio" name="sex" value="0" <c:if test="${register.sex == 0}">checked</c:if>/>男&nbsp;&nbsp;&nbsp;
            <input type="radio" name="sex" value="1" <c:if test="${register.sex == 1}">checked</c:if>/>女
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">年龄</td>
        <td><input type="text" name="age" value="${register.age}"/>岁</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">状态</td>
        <td>
        	<input type="radio" name="status" value="0" <c:if test="${register.status == 0}">checked</c:if>/>初诊&nbsp;&nbsp;&nbsp;
            <input type="radio" name="status" value="1" <c:if test="${register.status == 1}">checked</c:if>/>复诊&nbsp;&nbsp;&nbsp;
            <input type="radio" name="status" value="2" <c:if test="${register.status == 2}">checked</c:if>/>住院&nbsp;&nbsp;&nbsp;
            <input type="radio" name="status" value="3" <c:if test="${register.status == 3}">checked</c:if>/>出院
         </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">所挂科室</td>
        <td>
        	<select name="department" id="department">
        		<option value="1" <c:if test="${register.department == 1}">selected</c:if>>急诊科</option>
        		<option value="2" <c:if test="${register.department == 2}">selected</c:if>>儿科</option>
        		<option value="3" <c:if test="${register.department == 3}">selected</c:if>>妇科</option>
        		<option value="4" <c:if test="${register.department == 4}">selected</c:if>>皮肤科</option>
        		<option value="5" <c:if test="${register.department == 5}">selected</c:if>>内分泌科</option>
        		<option value="6" <c:if test="${register.department == 6}">selected</c:if>>牙科</option>
        	</select>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">指定医生</td>
        <td>
        	<select name="did" id="doctor">
                <c:forEach items="${doctorList}" var="doctor">
                    <option value="${doctor.did}" <c:if test="${register.did == doctor.did}">selected</c:if>>${doctor.name}</option>
                </c:forEach>
	        </select>
	     </td>  
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td><textarea name="remark">${register.remark}</textarea></td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
				<button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;
				<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
</form>
</body>
</html>
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

    <title>门诊查询</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${path}/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${path}/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/common.js"></script>

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
        .btn-myStyle{
            display: inline-block;
            padding: 0 2px;
            height: 24px;
            line-height: 24px;
            color: #fff;
            background-color: #2daebf;
            border-radius: 3px;
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,.5);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,.5);
            text-shadow: 0 -1px 1px rgba(0,0,0,.5);
            /*box-shadow: 0 1px 1px 2px #ccc;*/
        }
        .btn-myStyle:hover {
            color: #fff;
            background-color: #5EC1CE;
            text-decoration: none;
        }
        .table th, .table td {
            line-height: 20px;
            text-align: center;
        }

    </style>
    <script type="text/javascript">
	 
		
    </script>
</head>
<body>

<form action="${path }register/find" method="post" class="definewidth m20">
<input name="method" value="findRegisterByPage" type="hidden"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">病历号：</td>
        <td><input type="text" id="rid" name="rid" value="${registerRid}"/></td>
		
        <td width="10%" class="tableleft">姓名：</td>
        <td><input type="text" id="name" name="name" value="${registerName}"/></td>
		
        <td width="10%" class="tableleft">科室：</td>
        <td>
        	<select name="department" id="department">
	        	<option value="0" >==请选择==</option>
	        	<option value="1" <c:if test="${registerDepartment == 1}">selected</c:if>>急诊科</option>
	        	<option value="2" <c:if test="${registerDepartment == 2}">selected</c:if>>儿科</option>
	        	<option value="3" <c:if test="${registerDepartment == 3}">selected</c:if>>妇科</option>
	        	<option value="4" <c:if test="${registerDepartment == 4}">selected</c:if>>皮肤科</option>
	        	<option value="5" <c:if test="${registerDepartment == 5}">selected</c:if>>内分泌科</option>
	        	<option value="6" <c:if test="${registerDepartment == 6}">selected</c:if>>牙科</option>
        	</select>
        </td>
    </tr>
    <tr>
		  <td colspan="6">
		  <center>
            <input id="find" name="find" type="submit" class="btn btn-primary" value="查询"/>
			<input name="ret" id="ret" type="button" class="btn btn-primary" value="清空" onclick="resetAll();"/>
            </center>
        </td>
    </tr>
</table>
</form>
<form action="${path}register/delBatch" method="post" id="delForm">
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>病例号</th>
        <th>病人姓名</th>
        <th>主治医生</th>
        <th>挂号时间</th>
        <th>挂号科室</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${registerList}" var="register">
        <tr>
            <td><input type="checkbox" name="ids" class="ids" value="${register.rid}"></td>
            <td>${register.rid}</td>
            <td>${register.name}</td>
            <td>
                <c:forEach items="${doctorList}" var="doctor">
                        <c:if test="${register.did == doctor.did}">${doctor.name}</c:if>
                </c:forEach>
            </td>
            <td>
                <fmt:formatDate value="${register.registerDate}" pattern="yyyy-MM-dd"></fmt:formatDate>&emsp;&emsp;
                <span style="color: orange"><fmt:formatDate value="${register.registerDate}" pattern="hh:mm:ss"></fmt:formatDate></span>
            </td>
            <td>
                <c:if test="${register.department == 1}">急诊科</c:if>
                <c:if test="${register.department == 2}">儿科</c:if>
                <c:if test="${register.department == 3}">妇科</c:if>
                <c:if test="${register.department == 4}">皮肤科</c:if>
                <c:if test="${register.department == 5}">内分泌科</c:if>
                <c:if test="${register.department == 6}">牙科</c:if>
            </td>
            <td>
                <c:if test="${register.status == 0}">初诊</c:if>
                <c:if test="${register.status == 1}">复诊</c:if>
                <c:if test="${register.status == 2}">住院</c:if>
                <c:if test="${register.status == 3}">出院</c:if>
            </td>
            <td>
                <a href="toEdit?rid=${register.rid}" class="btn-myStyle">编辑挂号信息</a>&emsp;
                <a href="toLook?rid=${register.rid}" class="btn-myStyle">查看挂号详情</a>
            </td>
        </tr>
    </c:forEach>
     </tbody>
  </table>
  
  <table class="table table-bordered table-hover definewidth m10" >
  	<tr><th colspan="5">  

		<div>
		   <button type="button" class="btn btn-success" id="newNav">门诊挂号</button>&nbsp;&nbsp;&nbsp;
		   <button type="button" class="btn btn-success" id="delRegister" onclick="delAll()">批量删除</button>
		</div>
	</th></tr>
  </table>
</form>
<script>
    $(function () {
        //跳转添加页面
        $("#newNav").on("click",()=>{
            location.href = "add.jsp";
        })

        //全选反选功能
        $("#checkall").on("change",function () {
            //其他的选中状态根据全选实现
            $(".ids").prop("checked",$(this).prop("checked"));
        });
        $(".ids").on("change",()=>{
            if($(".ids:checked").length === $(".ids").length){
                $("#checkall").prop("checked",true);
            }
            else {
                $("#checkall").prop("checked",false);
            }
        })
    });
    //空删除提交不允许跳转
    function delAll() {
        $(".ids:checked").length <= 0?alert("没有选择删除信息"):$("#delForm").submit();
    }
    //清空操作
    function resetAll() {
        $("#rid").val("");
        $("#name").val("");
        $("#department").val("0");
    }
</script>
</body>
</html>

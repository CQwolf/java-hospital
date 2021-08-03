<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <title>查看</title>
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


    </style>
    <script type="text/javascript">
    $(function () {       
		$('#backid').click(function(){
				window.history.back(-1);
		 });
    });
    </script>
</head>
<body>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">病历号</td>
        <td>${register.rid}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td>${register.name}</td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">身份证号</td>
        <td>${register.idCard}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">挂号费</td>
        <td>${register.registerMoney}元</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">社保号</td>
        <td>${register.siNumber}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">联系电话</td>
        <td>${register.phone}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">是否自费</td>
        <td>
            <c:if test="${register.isPay == 1}">否</c:if>
            <c:if test="${register.isPay == 0}">是</c:if>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">性别</td>
        <td>
            <c:if test="${register.sex == 0}">男</c:if>
            <c:if test="${register.sex == 1}">女</c:if>
       	</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">年龄</td>
        <td>${register.age}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">状态</td>
        <td>
            <c:if test="${register.status == 0}">出诊</c:if>
            <c:if test="${register.status == 1}">复诊</c:if>
            <c:if test="${register.status == 2}">住院</c:if>
            <c:if test="${register.status == 3}">出院</c:if>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">所挂科室</td>
        <td>
            <c:if test="${register.department == 1}">急诊科</c:if>
            <c:if test="${register.department == 2}">儿科</c:if>
            <c:if test="${register.department == 3}">妇科</c:if>
            <c:if test="${register.department == 4}">皮肤科</c:if>
            <c:if test="${register.department == 5}">内分泌科</c:if>
            <c:if test="${register.department == 6}">牙科</c:if>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">指定医生</td>
            <c:forEach items="${doctorList}" var="doctor">
                <c:if test="${register.did == doctor.did}">
                    <td>
                            ${doctor.name}
                    </td>
                </c:if>
            </c:forEach>
    </tr>
    <tr>
        <td width="10%" class="tableleft">挂号时间</td>
        <td>
            <fmt:formatDate value="${register.registerDate}" pattern="yyyy-MM-dd"></fmt:formatDate>&emsp;
            <span style="color: orange"><fmt:formatDate value="${register.registerDate}" pattern="hh:mm:ss"></fmt:formatDate></span>
        </td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td>${register.remark}</td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
				<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
	String imgPath=request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+"/Hospital-pic/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>查看药品</title>
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
				window.location.href="${path}medicine?method=findMedicineByPage";
		 });
    });
    </script>
</head>
<body>
<form action="" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">药品编号</td>
        <td>${medicine.mid}</td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">进价</td>
        <td>${medicine.inPrice}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">售价</td>
        <td>${medicine.salPrice}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">药品名称</td>
        <td>${medicine.name}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">药品类型</td>
        <td>
            <c:if test="${medicine.type == 1}">处方药</c:if>
            <c:if test="${medicine.type == 2}">中药</c:if>
            <c:if test="${medicine.type == 3}">西药</c:if>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">简单描述</td>
        <td>${medicine.descs}</td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">保质期</td>
        <td>${medicine.qualityDate}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">详细描述</td>
        <td>${medicine.description}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">生产厂商</td>
        <td>${medicine.produceFirm}</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">服用说明</td>
        <td>${medicine.readme}</td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td>${medicine.remark}</td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
				<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
</form>
</body>
</html>
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
<base href="<%=this.getServletContext().getContextPath() %>/medicine/">
<head>
    <title>药品查询</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css" />
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

<form action="${path}medicine/find" method="post" class="definewidth m20">
	<table class="table table-bordered table-hover definewidth m10">
	    <tr>
	        <td width="10%" class="tableleft">药品名称：</td>
	        <td><input type="text" id="name" name="name" value="${medicineName}"/></td>
			
	        <td width="10%" class="tableleft">药品类型：</td>
	        <td>
		        <select name="type" id="type">
		        	<option value="0" />==请选择==</option>
		       		<option value="1" <c:if test="${medicineType == 1}">selected</c:if> />处方药</option>
			        <option value="2" <c:if test="${medicineType == 2}">selected</c:if> />中药</option>
			        <option value="3" <c:if test="${medicineType == 3}">selected</c:if> />西药</option>
		        </select>
	        </td>
	    </tr>
	    <tr>
			  <td colspan="4">
				<center>
					<input id="find" name="find" type="submit" class="btn btn-primary" value="查询"/>
			  		<input id="ret" name="ret" type="button" class="btn btn-primary" value="清空" onclick="resetAll();"/>
				</center>
	        </td>
	    </tr>
	</table>
</form>
<form action="${path}medicine/delBatch" method="post" id="delForm">
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>药品编号</th>
        <th>药品名称</th>
        <th>药品类型</th>
        <th>简单描述</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
	<c:forEach items="${medicineList}" var="medicine">
		<tr>
			<td><input type="checkbox" name="ids" class="ids" value="${medicine.mid}"></td>
			<td>${medicine.mid}</td>
			<td>${medicine.name}</td>
			<td>
				<c:if test="${medicine.type == 1}">处方药</c:if>
				<c:if test="${medicine.type == 2}">中药</c:if>
				<c:if test="${medicine.type == 3}">西药</c:if>
			</td>
			<td>${medicine.descs}</td>
			<td>
				<a href="toEdit?mid=${medicine.mid}" class="btn-myStyle">编辑药品信息</a>&emsp;
				<a href="toLook?mid=${medicine.mid}" class="btn-myStyle">查看药品详情</a>
			</td>
		</tr>
	</c:forEach>
     </tbody>
  </table>

<table class="table table-bordered table-hover definewidth m10" >
	<tr>
		<th colspan="5">
			<div>
				<button type="button" class="btn btn-success" id="newNav">添加新药品</button>
				<button type="button" class="btn btn-success" id="delDoctor" onclick="delAll()">批量删除</button>
			</div>
		</th>
	</tr>
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
			// 其他的选中状态根据全选实现
			$(".ids").prop("checked",$(this).prop("checked"));
		});
		$(".ids").on("change",()=>{
			if($(".ids:checked").length === $(".ids").length){
				$("#checkall").prop("checked",true);
			}
			else {
				$("#checkall").prop("checked",false);
			}
		});
	});
	//空删除提交不允许跳转
	function delAll() {
		$(".ids:checked").length <= 0?alert("没有选择删除信息"):$("#delForm").submit();
	}
	function resetAll() {
		$("#name").val("");
		$("#type").val("0");
	}
</script>
</body>
</html>

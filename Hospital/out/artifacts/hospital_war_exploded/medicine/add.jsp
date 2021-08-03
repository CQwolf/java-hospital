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
    <title>添加药品</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Js/common.js"></script>
    <script type="text/javascript" src="${path}Js/jquery.validate.js"></script>
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
        .error{
            display: inline-block;
            vertical-align: top;
            padding: 2px 5px;
            color: red;
            font-size: 14px;
        }

        .right-Title{
            display: inline-block;
            vertical-align: top;
            padding: 2px 5px;
            color: green;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript">
    $(function () {

            $('#backid').click(function(){
                //祖传方法
                window.history.back(-1);
            });


        $("form").validate(
            {
                errorElement: "span",
                rules: {
                    mid: {
                        required: true,
                    },
                    name: "required",
                    inPrice:{
                        required: true,
                        range: [0,1000000]
                    },
                    salPrice:{
                        required: true,
                        range: [0,1000000]
                    },
                    qualityDate: {
                        required: true,
                        digits: true
                    },
                    produceFirm: {
                        required: true,
                    }
                },
                messages: {
                    mid: {
                        required: "药品编号不能为空",
                    },
                    name: "药品名不能为空",
                    inPrice:{
                        required: "进价不能为空",
                        range: "价格应该合理"
                    },
                    salPrice:{
                        required: "售价不能为空",
                        range: "价格应该合理"
                    },
                    qualityDate: {
                        required: "药品有效期不能为0",
                        digits: "必须输入整数"
                    },
                    produceFirm: {
                        required: "生产厂家不能为空",
                    }
                }
            }
        );
    });

    function checkMid() {
        // 发送表单中的数据
        $.post("checkMid",{"mid":$("#mid").val().trim()},function (data) {
            // 根据得到的数据显示到页面中
            if(data.toString() == "药品编号已存在"){
                $("#mid-Msg1").html(data);
                $("#mid-Msg2").html("");
            }
            else {
                $("#mid-Msg2").html(data);
                $("#mid-Msg1").html("");
            }
        },"text");
    }

    </script>
</head>
<body>

<form action="${path }/medicine/add" method="post" class="definewidth m20">
<input type="hidden" name="method" value="insertMedicine">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">药品编号</td>
        <td>
<%--            <input type="text" name="mid" value="" required/>--%>
    <input type="text" name="mid" value="" id="mid" onchange="checkMid();" required/>
    <span id="mid-Msg1" class="error"></span>
    <span id="mid-Msg2" class="right-Title"></span>
        </td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">进价</td>
        <td><input type="text" name="inPrice" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">售价</td>
        <td><input type="text" name="salPrice" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">药品名称</td>
        <td><input type="text" name="name" value="" required/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">药品类型</td>
        <td>
        	<input type="radio" name="type" value="1" checked/>处方药&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="type" value="2"/>中药&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="type" value="3"/>西药</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">简单描述</td>
        <td><input type="text" name="descs" value=""/></td>
    </tr>

    <tr>
        <td width="10%" class="tableleft">保质期</td>
        <td><input type="text" name="qualityDate" value="36"/>月</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">详细描述</td>
        <td><textarea name="description"></textarea></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">生产厂商</td>
        <td><textarea name="produceFirm"></textarea></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">服用说明</td>
        <td><input type="text" name="readme" value=""/></td>
    </tr>
   
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td><textarea name="remark"></textarea></td>
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
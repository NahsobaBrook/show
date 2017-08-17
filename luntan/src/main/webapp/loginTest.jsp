<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="static/plugins/easyUi/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/plugins/easyUi/themes/icon.css"> 
<link rel="stylesheet" type="text/css" href="static/plugins/easyUi/demo.css">
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/plugins/easyUi/jquery.easyui.min.js"></script>

<style type="text/css">
	
	body{
	margin:0;
	padding:0;
	}
	
	input{
	display: inline-block;
	width:80%;
	max-width:300px;
	}

</style>
</head>
<body>
	<div class="container" style="max-width:500px;margin-top:200px">
	
		<h3>登录Cor论坛</h3>
		
		<div class="panel center-block" style="padding-left:20px">		
				
			<form class="form-horizontal" action="${pageContext.request.contextPath}/customer/login" method="post">
				<div class="form-group">
					<input class="easyui-textbox" name="account" data-options="label:'账号:',missingMessage:'账号不能为空'">
				</div>
				
				<div class="form-group">
					<input class="easyui-textbox" name="password" type="password" data-options="label:'密码:',missingMessage:'密码不能为空'">
				</div>
					<c:if test="${not empty error}">
					
						<h6>${error}</h6>
					</c:if>
				<div clss="form-group">
					<input class="easyui-linkbutton" style="margin-top:20px;height:30px" type="submit" value="登录">
				</div>
				
			</form>
			<h6>没有账号？ <a href="${pageContext.request.contextPath }/reg.jsp">请注册</a></h6>
			
		</div>
	
	</div>
	
		<%
		session.removeAttribute("error");
		%>
</body>
</html>
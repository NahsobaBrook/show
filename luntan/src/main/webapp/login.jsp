<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
<title>登录 Cor</title>

		<style type="text/css">
			body{
				background-image: url(${pageContext.request.contextPath }/static/img/codepen-logo-pattern-725360e4ce5b66f968c7f39c80999bdeaa3cbe2f18eac75d58b01f8cf55c26ab.png);
			}
			h1,h2,h3,h4,h5,h6{
				margin: 0;
				padding:0;
			}
			a:hover{
				text-decoration: none;
			}
			.main{
				margin-top: 12em;
				width: 450px;
			}
			.login{
				color: white;
				font-size: 66px;
			}
			.write{
				margin-bottom: 20px;
				padding: 10px;
				font-family: "Lato", "Lucida Grande", "Lucida Sans Unicode", Tahoma, Sans-Serif;
				font-size: 18px;
				font-weight: 800 ;
				border: 4px solid #ccc;
				border-radius: 2px;
    			transition: 0.2s;
				width: 342px;
				height: 49px;
				display: block;
				outline: none;
			}
			.label{
				color: #999999;
				line-height: 22px;
				font-weight: normal;
				font-size: 15px;
			}
			.login-btn{
				background: white;
				color: black;
				width: 68px;
				height: 44px;
				font-size: 18px;
				margin-top: 22px;
				transition-duration: .5s;
				border: 1px solid black;
			}
			.login-btn:hover{
				background: black;
				color: white;
				border: 1px solid white;
			}
			.footer{
				width: 342px;
				height: 62px;
				background: #28282B;
				margin-top: 50px;
				text-align: center;
			}
			.footer>p{
				color: #999;
				line-height: 55px;
				font-size: 15px;
			}
			.error{
			color: white;
			}
		</style>
	
</head>
	<body>
		<div class="container-fluid" style="height: 29px;background: black;">
			<h3 style="color:white">Cor</h3>
		</div>
		
		<div class="container main">
			<div class="row" style="margin-bottom: 30px;">
				<h1 style="color: #909091;font-size: 46px;">cor</h1>
				<h1 class="login">登录！</h1>
			</div>
			<form action="${pageContext.request.contextPath}/customer/login" method="post" autocomplete="off">
				<h4 class="label">用户名</h4>
				<input class="write" name="account" id="account" maxlength="20"/>
				<h4 class="label">密码</h4>
				<input style="font-size: 18px;letter-spacing:0;" class="write"  type="password" name="password" id="password" maxlength="20" />
					<c:if test="${not empty error}">
						<h6 class="error">${error}</h6>
					</c:if>
				<input class="login-btn btn" type="submit" value="登录"/>
				
			</form>
			
			<div class="footer">
				<p>需要一个账户？<a href="${pageContext.request.contextPath }/reg.jsp">请注册！</a></p>
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		$(function(){
			$('.write').on('focus',function(){
				$(this).css('border','4px solid #555555');
			});
			
			$('.write').on('blur',function(){
				$(this).css('border','4px solid #ccc');
			});
		});
	</script>
	</body>
	
</html>
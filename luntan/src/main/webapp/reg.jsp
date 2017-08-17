<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
<title>Cor 注册</title>

	
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
				margin-top: 10em;
				width: 720px;
				background: #EEEEEE;
				padding-bottom: 50px;
			}
			.login{
				color: white;
				font-size: 66px;
				line-height: 100px;
			}
			.write{
				margin-bottom: 10px;
				padding: 10px;
				font-family: "Lato", "Lucida Grande", "Lucida Sans Unicode", Tahoma, Sans-Serif;
				font-size: 18px;
				font-weight: 800 ;
				border: 4px solid #ccc;
				border-radius: 2px;
    			transition: 0.5s;
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
				background: #47cf73;
				color: white;
				width: 168px;
				height: 54px;
				font-size: 25px;
				margin-top: 22px;
				transition-duration: .5s;
			}
			.login-btn:hover{	
				background: white;
				color: #47cf73;
				border: 2px solid #47cf73;
			}
			.group>span{
				display: inline-block;
				background: #FF3C41;
				color: white;
				margin-bottom: 20px;
			}
			.footer{
				height: 62px;
				width: 720px;
				background: #28282B;
				margin-top: 50px;
				margin-bottom: 50px;
				text-align: center;
			}
			.footer>p{
				color: #999;
				line-height: 55px;
				font-size: 15px;
			}
		</style>
	

</head>

	<body>
		<div class="container-fluid" style="height: 29px;background: black;">
			<h3 style="color:white">Cor</h3>
		</div>
		
		<div class="container main">
			<div class="row" style="height: 203px; background: black; text-align: center; margin-bottom: 30px;padding-top: 50px;">
				
				<h1 class="login">自由</h1>
				<h1 style="color: white;font-size: 16px;">欢迎来到Cor论坛。</h1>
			</div>
			<form style="margin-left: 165px;" action="${pageContext.request.contextPath }/customer/reg" method="post" autocomplete="off">
				<div class="group">
					<h4 class="label">选择一个用户名</h4>
					<input class="write account" name="account" id="account" data-regex = "^.{4,20}$" data-message = "账户长度只能在4-20个字符之间" maxlength="20"/>
					<c:if test="${not empty sessionScope.error }">
						<h6 style="display: inline-block;">${sessionScope.error}</h6>
					</c:if>
					<span></span>
				</div>
				<div class="group">
					<h4 class="label">选择密码</h4>
					<input class="write"  type="password" name="password" id="password" data-regex = "^.{6,20}$" data-message = "密码长度只能在6-20个字符之间" maxlength="20"/>
					<span></span>
				</div>
				<div class="group">
					<h4 class="label">确认密码</h4>
					<input class="write"  type="password" name="repass" id="repass" data-message = "两次密码输入不一致" maxlength="20"/>
					<span></span>
				</div>
				<input class="login-btn btn" type="submit" value="注册"/>
				
			</form>		
		</div>
		<div class="footer container">
				<p>已有账户？<a href="${pageContext.request.contextPath }/login.jsp">请登录！</a></p>
			</div>
		<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			
		$(function(){
			
			$('.account').on('blur',function(){
				var $account = $(this);
				$.ajax({
					url:'/luntan/customer/repeatId',
					type:'get',
					dataType:'text',
					data :{
						account : $account.val()
					},
					success:function(result){
						if(result == 'true'){
							$account.next().html('账户已存在');
						}
					}
					
				});
				
			});
			
			
			$('.write').on('regex',function(){
				 var $regex = $(this).data('regex');
				 var $message = $(this).data('message');
			 
			if(!$regex){	
				var $passValue = $(this).closest('form').children('.group').children('input[name="password"]').val();
				if(this.value == $passValue){
					$(this).closest('.group').children('span').text('');	

				}else{
					$(this).closest('.group').children('span').text($message);

				}
			}else{
				
				
				if(new RegExp($regex).test(this.value)){
					$(this).closest('.group').children('span').text('');		
				}else{
					$(this).closest('.group').children('span').text($message);
				}
			}
			});
			
			$('.write').on('focus',function(){
				$(this).css('border','4px solid #555555');
			});
			
			$('.write').on('input',function(){
				$(this).trigger('regex');
			});
			
			$('.write').on('blur',function(){
				$(this).css('border','4px solid #ccc');
				$(this).trigger('regex');
			});
			
			$('[type = "submit"]').on('click',function(event){
			
			$(this).trigger('regex');
				
			var $form = $(this).closest('form');

			var $inputs = $form.find(':input');

			$inputs.trigger('form.valid');
		
				if($form.find('span').text().trim().length != 0){
				event.preventDefault();
					}
				});
		});
	</script>
		<%
		session.removeAttribute("error");
		%>
	</body>
	
</html>
<%@page import="service.TimetoString"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Topic"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerServiceImpl"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
<title>Cor 论坛</title>
		<style type="text/css">
			*{
				box-sizing: border-box;
			}
			body{
				background: #181818;
				font-size: 18px;
			}
			a:hover{
				text-decoration: none;
			}
			
			.headAvg{
				height: 100%;
				text-align: center;
			}
			
			.headAvg>h1{
				font-size: 50px;
				font-family:"Telefon Black", Sans-Serif;
				font-weight: bold;
				color: white;
				margin-top: 80px;
			}
			.main{
				width: 960px;
			}
			.content{
				max-height: 200px;
				overflow: hidden;
				text-overflow:ellipsis;
				border-bottom: 1px solid #eee;
			}
			.customer{
			height: 52px;
			margin-top:10px;
			}
			
			.container p{
				font-size: 1.2em;
			}
			.topic:HOVER{
			border-bottom: 6px solid #47CF73;
			}
			.topic{
				padding-top: 50px;
				padding-left: 80px;
				padding-right: 80px;
				border-bottom: 6px solid #181818;
				transition-duration:.5s;
				min-height: 380px;
				background: white;
				margin-top: 80px;
			}
			.topic>h1>a{
			color: black;
			transition-duration:.5s;
			}
			.topic>h1>a:HOVER{
			color:#47CF73;
			}
			.topic>h1{
				font-family: "arial black";
				font-weight: bolder;
				font-size: 2em;
			}
			.block-time {
			    font-family: Menlo, Monaco, monospace;
			    font-size: 1.5em;
			    display: block;
			    color: #bbbbbb;
			    letter-spacing: 2px;
			    text-transform: uppercase;
			    font-weight: 200;
			    margin: 20px 0 15px 0;
			}
			.footer{
				height: 159px;
				background: black;
				margin-top: 150px;
			}
			.write{
				margin-top: 100px;
				width: 960px;
				height: 500px;
			}
			.btn{
				border: 2px solid white;
				background: black;
				color: white;
				transition: 0.2s;
			}
			.btn:HOVER{
				background: white;
				color: black;
				border: 2px solid black;
				
			}
			.rightTop{
			margin-top:1em;
			float:right;
			margin-right: 20px;
			border-radius: 3px;
			padding:5px;
			transition-duration:.5s;
			}
			.rightTop:HOVER{
			background: #4D4D50;
			}
			
			.rightTop>a{
			color:white;
			}
			.right-avg{
			position: fixed;
			top: 60%;
			right: 10%;
			}
			.headBottom>span{
			display: inline-block;
			}
			.yourHead{
			width: 200px;
			height: 200px;
			border: 5px solid white;
			transition-duration:.5s;
			margin-top: 30px;
			}
			.yourHead:HOVER{
			border: 5px solid #555;
			}
		</style>
</head>

<body>
			<c:if test="${empty customer}">
				<% response.sendRedirect("/login.jsp"); %>
			</c:if>
			
			<div class="right-avg">
				<a href="#title"><div class="btn" style="display: block;margin-bottom: 2em;">发帖</div></a> 
				<div class="btn topp" style="display: block;">顶部(我就是测试下)</div>
			</div>

		<div id="top" class="container-fluid" style="height: 64px; background: black;">
		<span class="rightTop"><a href="${pageContext.request.contextPath}/login.jsp">退出</a> </span>
		<a style="color: white;" href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=${customer.account}"><span class="rightTop">${customer.account}</span></a>
		
			<div class="container">
				<h3 style="color: white;font-weight: bold;">Cor论坛</h3>
			</div>
				
		</div>
		<div class="container-fluid" style="height: 506px;background-image: url(static/img/texture-codepen.png);">
			<div class="container headAvg">
				
				<h1>Welcome</h1>
			
				<a href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=${customer.account}"> <div class="center-block" style="width: 200px;height: 200px;display: inline-block;">
					<img src="/head/${customer.head}" class="yourHead img-circle"/>
							</div>
				</a>
				
			</div>
				
		</div>
		<div class="container main">
		<%
		CustomerService cussice = new CustomerServiceImpl();
		List<Topic> list =  cussice.limitFind("0", "5");
		for(int i = 0; i<list.size();i++){
			%>
			  <div class="row topic">
				<h1><a href="${pageContext.request.contextPath }/topic/toComment?cardId=<%=list.get(i).getId() %>"><%=list.get(i).getTitle() %></a></h1>
				<% TimetoString newTime = new TimetoString(); %>
				<time class="block-time"><%=newTime.timeOut(list.get(i).getSendtime()) %></time>
				<div class="content"><%=list.get(i).getContent() %></div>
				<div class="customer">
				<% Customer cusTopic = cussice.find(list.get(i).getAccount());%>
					<a href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=<%= list.get(i).getAccount()%>">
					<img src="/head/<%=cusTopic.getHead()%>" style="height: 30px;width: 30px;"/></a>
					<a style="font-size: 1.5em;" href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=<%= list.get(i).getAccount()%>"><%=list.get(i).getAccount() %></a>
				</div>
			  </div>
			
			<%
		}
		%>
	</div>
		<div class='btn more center-block' style="width:200px;margin-top: 5em;">显示更多</div>
		
		
		<div class="container write">
			<form class="form-horizontal" action="${pageContext.request.contextPath }/topic/mainSend" autocomplete="off" method="post">
							<div class="form-group" >
							<input id="title" class="title form-control" name="title" placeholder="请填写标题" maxlength="100"/>
							</div>
							<div class="form-group for1">
								<script src="${pageContext.request.contextPath }/static/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
								<textarea id="TextAreal" class="ckeditor" name="content" rows="2" cols="20" placeholder="请填写内容"></textarea>
								<script type="text/javascript">
				 				CKEDITOR.replace('TextArea1');
								</script>
							</div>
							
							<div class="form-group">
								<input id="send" class="btn" type="submit" value="发表"/>
							</div>
						</form>
		</div>
	
		<div class="container-fluid footer" style="position: relative;">
			<h1 style="position: absolute;right: 2%;top: 0;color: white;">Cor show</h1>
		</div>
	
	<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		var $begin = 5;
		var $end = 5;
		$('.more').on('click',function(){
			$.ajax({
				url:'/luntan/topic/litmtTopic',
				type:'post',
				dataType:'text',
				data :{
					begin : $begin,
					end : $end
				},
				success:function(result){
					if(result =='none'){
						$('.more').css('display','none');
					}else{
						$('.main').append(result);
						$begin+=5;
					}
				}
				
			});
		});	
		$('.more').on('click',function(){
			$.ajax({
				url:'/luntan/topic/removeBtn',
				type:'post',
				dataType:'text',
				data :{
					begin : $begin,
					end : $end
				},
				success:function(result){
					if(result =='ok'){
						$('.more').css('display','none');
					}
				}
				
			});
		
		});
		
		$('.topp').click(function(){$('html,body').animate({scrollTop: '0px'}, 400);});
		
	});
	</script>
</body>
</html>
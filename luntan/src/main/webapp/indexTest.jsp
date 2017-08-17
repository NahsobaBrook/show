<%@page import="service.CustomerServiceImpl"%>
<%@page import="service.CustomerService"%>
<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@page import="entity.Topic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/css/bootstrap.css">
		<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			*{
				box-sizing: border-box;
			}
			body{
				background: #DCEFFE;
				padding: 0;
				margin: 0;
			}
			
			.send{
				position: fixed;
				right: 18%;
			}
			.send1{
				position: fixed;
				top:25%;
				right: 18%;
			}
			
			.row{
				margin: 0;
			}
			
			.mainPanel>div{
				width: 100%;
				min-height: 100px;

			}
			.mainPanel>div>h4{
			display: inline-block;
			}
			
			.mainPanel>div{
			position: relative;
			}
			.mainPanel>div>span{
			position:absolute;
			right:1%;
		
			}
			
			.content{
				min-width: 800px;
				max-width: 800px;
				min-height: 280px;
				max-height: 280px;
			}
			
			.head{
			width:150px;
			height: 150px;
			border:10px solid #FFF;
			}
			.myPage h4{
				color:#FFF;
			}
			
		</style>
		
	</head>
	<body>
			<c:choose>
				<c:when test="${not empty sessionScope.customer}">
					<h4  id="top" style="float: right;">欢迎你：${customer.account} </h4>
				</c:when>
				<c:otherwise>
				<% response.sendRedirect("/login.jsp"); %>
				</c:otherwise>
			</c:choose>
	
			<div class="container-fluid" style="height: 137px; background: #FFF; margin-bottom: 50px;">
				<div class="container">
				<h1 class="tabs-title"> Cor论坛</h1>
				<h3>最专业的Java信息交流平台</h3>
				</div>
			</div>
			<a href="#title" style="color: white;">
			<div class="btn btn-primary send">
				发帖
			</div>
			</a> 
			<a href="#top">
			<div class="btn btn-primary send1">
				顶部
			</div>
			</a>
			
			<div class="container">
				<img src="${pageContext.request.contextPath }/static/img/default_head20141014.jpg"/>
			</div>
			<div class="container" style="min-height: 1000px;background: #F4F6F9; padding: 0;">
				<div class="row" style="min-height: 650px; width: 100%;background:#F8F8F8;">
				
					<div class="col-md-3" style="border:2px solid red">
						<div class="myPage">
						<a href="${pageContext.request.contextPath }/cusHome.jsp"><img class="head" src="/head/${customer.head}"></a>
						<h4>${customer.account}</h4>
						<h4>等级：${customer.grade}</h4>
						<h4>积分：${customer.score}</h4>
						</div>
					</div>
					<div class="col-md-9 mainPanel" style="background: #FFF;height: 100%; padding: 0;">
						<% 
						CustomerService cussice = new CustomerServiceImpl();
							List<Topic> list =  cussice.findAll();
							for(int i = 0;i<list.size();i++){
								%>
								<div style="border:1px solid #95D3FB;max-height: 77px;overflow: hidden;">
									<h4><a href="${pageContext.request.contextPath }/topic/toComment?cardId=<%=list.get(i).getId()%>"><%=list.get(i).getTitle() %></a></h4>
									<span>发贴时间：<%=list.get(i).getSendtime() %></span><br>
									<span style="bottom: 2%;">发帖人：<%=list.get(i).getAccount() %><img style="width: 30px;height:30px;" src="/head/${customer.head}"></span>
									<div><%=list.get(i).getContent() %></div> 
								</div>
								<%
							}
						%>
					</div>
				</div>
				<div class="row" style="min-height: 350px;background: #F3F3F3;padding-left:50px;padding-right:50px; padding-top: 50px; border: 1px solid red;">
					
					
						<form class="form-horizontal" action="${pageContext.request.contextPath }/topic/mainSend" autocomplete="off" method="post">
							<div class="form-group" >
							<input id="title" class="title form-control" name="title" placeholder="请填写标题"/>
							</div>
							<div class="form-group">
								<script src="${pageContext.request.contextPath }/static/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
								<textarea id="TextAreal" class="ckeditor" name="content" rows="2" cols="20" placeholder="请填写内容"></textarea>
								<script type="text/javascript">
				 				CKEDITOR.replace('TextArea1');
								</script>
							</div>
							
							<div class="form-group">
								<input id="send" class="btn btn-primary" type="submit" value="发表"/>
							</div>
						</form>
					
		
					
				</div>
			</div>
	

	</body>
</html>
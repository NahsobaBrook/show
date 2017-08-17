<%@page import="service.TimetoString"%>
<%@page import="entity.Reply"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerServiceImpl"%>
<%@page import="service.CustomerService"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Topic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
			<c:if test="${empty customer}">
				<% response.sendRedirect("/login.jsp"); %>
			</c:if>

<%	
	
	Topic topic = new Topic();
	Customer topicCus = new Customer();
	CustomerService cussice = new CustomerServiceImpl();
	
	String cardId = (String)session.getAttribute("cardId");
	 if(cardId != null){	 
		 topic = cussice.topicId(cardId);
	 }
	 
	 topicCus = cussice.find(topic.getAccount());
		
%>

<title><%=topic.getTitle() %></title>


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
			.head{
				text-align: center;
			}
			.title{
				color: white;
				font-family: "Telefon Black", Sans-Serif;
    			font-weight: bold;
    			font-size: 6.5rem;
    			margin: 2rem 0 1rem 0;
   				 line-height: 1.2;
   				 font-style: normal;
			}
			.topic{
				text-align: left;
				min-height: 300px;
				background: white;
				margin-top: 80px;
				padding-top: 80px;
				padding-left: 80px;
				padding-right: 80px;
			}
			.topic p{
				font-size: 1.5em;
			}
			.content{
				border-bottom: 1px solid #EEEEEE;
			}
			
			.main{
				text-align: left;
				margin-top: 50px;
			}
			.main>h1{
				border-bottom: 4px solid #AE63E4;
				color: white;
			}
			
			.reply{
				width: 960px;
				min-height: 260px;
				background: white;
				margin-top: 30px;
				padding-top: 50px;
				padding-left: 80px;
				padding-right: 80px;
				border-radius: 10px;
			}
			.reply p{
				font-size: 1.5em;
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
			.write{
				margin-top: 100px;
				width: 960px;
				height: 500px;
			}
			.footer{
				height: 159px;
				background: black;
				margin-top: 150px;
			}
			.btn{
	
				background: white;
				color: black;
			}
			.btn:HOVER{
				border: 2px solid white;
				background: black;
				color: white;
			}
		</style>
	
</head>
	<body>
			
		<div class="container-fluid" style="height: 64px; background: black;border: 1px solid #222;">
			<a href=""><h3 style="color: white;">Cor</h3></a>
		</div>
		<div class="container-fluid head" style="height: 460px;background: black;padding-top: 100px;">
			<a href=" ${pageContext.request.contextPath}/index.jsp">←返回首页</a>
			<h1 class="title"> <%=topic.getTitle() %></h1>
			<%TimetoString timeto = new TimetoString(); %>
			<h4 style="color: #BBBBBB;"><%=timeto.timeOut(topic.getSendtime())%></h4>
				<div class="container topic">
					<div class="content">
						<%=topic.getContent()%>
					</div>
					<div class="customer" style="height:52px;margin-top:20px;">
						<img src="/head/<%=topicCus.getHead()%>" style="height: 30px;width: 30px;"/>
						<a style="font-size: 1.5em;" href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=<%=topic.getAccount()%>"><%=topic.getAccount() %></a>
					</div>
				</div>
				
				<div class="container main">
					<h1>#评论</h1>
				<%
				List<Reply> list = cussice.findTidpingLun(topic.getId());
				if(list != null){
					for(int i = 0; i<list.size();i++){
						%>
						<div class="reply center-block">
						<%TimetoString timetoString = new TimetoString(); %>
						<h1 style="float: right;color: #555555"><%=i+1%>#</h1>
						<time class="block-time"><%=timetoString.timeOut(list.get(i).getReplytime())%></time>
						<div class="reply-content"style="border-bottom: 1px solid #eee;">
							<%=list.get(i).getContent() %>
						</div>
						<div class="customer" style="height: 52px;margin-top:20px;">
							<% 
							Customer replyCus = cussice.findPingLuner(list.get(i).getAccount());
							%>
							<img src="/head/<%=replyCus.getHead()%>" style="height: 30px;width: 30px;"/>
							<a style="font-size: 1.5em;" href="${pageContext.request.contextPath}/cushome/toHome?tempAccount=<%=list.get(i).getAccount()%>"><%=list.get(i).getAccount() %></a>
						</div>
					</div>
						<%
					}
				}
				%>
				
				</div>
				
				<div class="container write">
				
					<form class="form-horizontal" action=
						
						"<%=request.getContextPath() %>/topic/pingLun?tId=<%=topic.getId() %>" autocomplete="off" method="post">
						<h1># 说说你的看法</h1>
							<div class="form-group">
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
		</div>
		
		
	</body>

</html>
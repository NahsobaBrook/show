<%@page import="entity.Reply"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Topic"%>
<%@page import="service.CustomerServiceImpl"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/static/plugins/bootstrap/dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
	<style type="text/css">
				.row>h3{
					display: inline-block;
				}
				.content{
					min-width: 1050px;
					max-width: 1050px;
					min-height: 280px;
					max-height: 280px;
				}
			</style>
</head>
<body>

<div class="container-fluid" style="height: 137px; background: #DCEFFE;margin-top: 50px;">
				<div class="container">
				<h1 class="tabs-title" style="color: #FFF;"> Cor论坛</h1>
				</div>
			</div>
			
			<div class="container" style="min-height: 800px;background: #F4F6F9;">
				<div class="row" style="background: #FFF;margin-top: 20px;">
			
					<h3 class="col-md-9" style="margin-left: 50px;"><%=topic.getTitle() %></h3>
					<a href="#content" style="color: white;">
					<div class="col-md-2 btn btn-primary" style="margin-top: 12px;">
					回复
					</div>
					</a> 
				</div>
				
				<div class="row"style="background-color: #FFF;border: 1px solid #95D3FB;">
					<div class="col-md-2" style="background: #FAFBFC">
						<h5>发帖人<%=topicCus.getAccount() %></h5>
						<h5>等级：<%=topicCus.getGrade() %></h5>
						<h5>积分：<%=topicCus.getScore() %></h5>
					</div>
					
					<div class="col-md-10" style="padding: 10px 10px; position:relative;">
						<%=topic.getContent() %>
						<div style="position: absolute;right: 0;top:100%"><%=topic.getSendtime() %></div>
					</div>
				</div>
				
				<%
				List<Reply> list = cussice.findTidpingLun(topic.getId());
				if(list != null){
					for(int i = 0; i<list.size();i++){
						%>
						<div class="row" style="background-color: #FFF;border: 1px solid #95D3FB;">
							<div class="col-md-2" style="background: #FAFBFC">
							<% 
							Customer replyCus = cussice.findPingLuner(list.get(i).getAccount());

							%>
							<h5>回帖人：<%=replyCus.getAccount() %></h5>
							<h5>等级：<%=replyCus.getGrade() %></h5>
							<h5>积分：<%=replyCus.getScore() %></h5>
							<%
							%>
							</div>
							<div class="col-md-10" style="padding: 10px 10px; position:relative;">
							<%=list.get(i).getContent() %>
							<div style="position: absolute;right: 0;top:100%"><%=list.get(i).getReplytime() %></div>
							</div>
						</div>
						<%
						
					}
				}
				%>
				
	
						<form class="form-horizontal" style="margin:20px;padding: 0 50px;" action=
						"<%=request.getContextPath() %>/topic/pingLun?tId=<%=topic.getId() %>" autocomplete="off" method="post">
							<div class="form-group">
								<textarea id="content" name="content" class="form-control content" placeholder="请填写内容"></textarea>
							</div>
							
							<div class="form-group ">
								<input class="btn btn-primary" type="submit" value="发表"/>
							</div>
						
					</form>
	
					
					
				</div>
			</div>
		<script type="text/javascript">
		
		$(function(){
			
		});
		</script>
</body>
</html>
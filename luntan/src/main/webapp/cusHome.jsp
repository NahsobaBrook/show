<%@page import="entity.Topic"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerServiceImpl"%>
<%@page import="service.CustomerService"%>
<%@page import="entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/static/img/shortIcon.ico">
<title>个人主页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-image-cut/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-image-cut/css/default.css">
	<link href="${pageContext.request.contextPath }/static/jquery-image-cut/assets/css/bootstrap.min.css" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/static/jquery-image-cut/dist/cropper.css" rel="stylesheet">
  	<link href="${pageContext.request.contextPath }/static/jquery-image-cut/css/main.css" rel="stylesheet">
 <style type="text/css">
 	
 	body{
 	margin: 0;
 	padding: 0;
 	
 	}
 	
 	#shade{
 	position:absolute;
 	top:0;
 	display: none;
 	width:100%;
 	height:100%;
 	background-color:rgba(0,0,0,0.7);
 	padding-top: 200px;
 	}
 	
			*{
				box-sizing: border-box;
			}
			body{
				background: #343338; 
				font-size: 18px;
			}
			a:hover{
				text-decoration: none;
			}
			
			.head{
				text-align: center;
				height: 261px;
				background-image: url(${pageContext.request.contextPath }/static/img/profile-bg-8ff33bd9518be912289d4620cb48f21eb5c9a2e0b9577484126cfe10a5fb354f.svg);
				background-size: cover;
				padding-top: 60px;
			}
			.head>h2{
				-webkit-font-smoothing: antialiased;
  				 -moz-osx-font-smoothing: grayscale;
				color: white;
				font-family: "Telefon Black", Sans-Serif;
    			font-weight: bold;
    			font-size: 6.5rem;
    			margin: 2rem 0 1rem 0;
   				 line-height: 1.2;
   				 font-style: normal;
			}
			.parentHead{
				position:relative;
				width: 150px;
				height: 150px;
			}
			.parentHead>img{
				border: 5px solid #1e1e1e;
				width: 150px;
				height: 150px;
			}
			.parentHead:HOVER>#change{
				display: block;
				cursor: pointer;
			}
			#change{
				
				position: absolute;
				background-color: rgba(0,0,0,0.5);
				text-align:center;
				height: 100%;
				width: 100%;
				top:0;
				display: none;
			}
			#change p{
			margin-top:60px;
			color: white;
			}
			.head-left{
				color: white;
				font-size: 15px;
				color: #8a8a8a;
				margin-left: 20px;
				margin-top: 25px;
				display: inline-block;
			}
			.main>h3{
				color: #EEEEEE;
				border-bottom: 4px solid grey;
				padding-bottom: 10px;
			}
			.topic{
				margin: 0;
				padding: 0;
				list-style: none;
			}
			.topic li{
				padding-left:20px;
				padding-right:20px;
				margin: 0;
				height: 50px;
				margin-bottom: :;0px;
				color: white;
				border: 2px solid #494949;
			}
			
			
			
			.topic li:nth-of-type(odd){
				background: #DDDDDD;
				
			}
			.topic li:nth-of-type(even){
				background: #7D7D7D;
				
			}
			.footer{
				position:absolute;
				
				bottom:0;
				width:100%;
				height: 159px;
				background: black;
				margin-top: 150px;
			}
			
			.topicTitle{
			color: #343338;
			}
			.topic>li>p{
			display: inline-block;
			margin-left: 2em;
			font-size: 0.7em;
			}
			.btn{
				display:inline-block;
				background: black;
				color: white;
				border: 1px solid white;
				transition: 0.5s;
			}
			.btn:HOVER{
				border: 1px solid black;
				background: white;
				color: black;
			}
			
			.del{
			margin-top:5px;
			float: right;
			}
			
			#delKuang{
			position: absolute;
			top:0;
			left:0;
			width: 100%;
			height: 100%;
			background-color: rgba(0,0,0,0.7);
			display: none;
			z-index: 2;
			}
			
			.duihua{
				width: 350px;
				height:200px;
				background: white;
				margin-top: 15em;
				border-radius: 5px;
				text-align: center;
				padding: 10px;
				z-index: 3;
			}
			
			.duihua>h4{
				margin-top:2em;
				margin-bottom:3.5em;
				color: black;
			}
 	
 </style>
</head>
<body>
<p>测试一下这个界面看看是怎么回事~   简直了,为什么倒下来是各种报错.</p>
			<c:if test="${empty customer}">
				<% response.sendRedirect("/login.jsp");%>
			</c:if>
			
			<c:if test="${customer.account == homeCus.account}">
				<% 
				request.setAttribute("isMy", true); %>
			</c:if>
	
		<div class="container-fluid" style="height: 64px; background: black;border: 1px solid #222;">
			<a href="${pageContext.request.contextPath }/index.jsp"><h3 style="color: white;font-weight: bold;">Cor</h3></a>
		</div>
		<div class="container-fluid"style="height: 333px; background: black;padding: 0;">
			<div class="container-fluid head">
					<h2>${homeCus.account}</h2>
					<div class="center-block parentHead">		
					<img src="/head/${homeCus.head}"/>
					<c:if test="${isMy ==true}">
							<div id="change">
							<p>修改头像</p>
							</div>
					</c:if>
				</div>
			</div>
			<div class="head-left">${homeCus.grade} level</div>
			<div class="head-left">${homeCus.score} score</div>
		</div>
	
		<div class="container main">
			<c:choose>
			<c:when test="${isMy == true }">
				<h3>我的帖子</h3>
			</c:when>
			<c:otherwise>
				<h3>他的帖子</h3>
			</c:otherwise>
			</c:choose>
			
				<%
				CustomerService cusService = new CustomerServiceImpl();
				List<Topic> list = cusService.topiclimit(((Customer)request.getAttribute("homeCus")).getAccount(), 0, 5);
				request.setAttribute("tempList", list);
				%>
				<c:if test="${empty tempList}">
					<div style="color: #808080;border:none;text-align: center;margin-top:5em;">还没有发过一条帖子哦</div>
				</c:if>
				
			<ul id="topics" class="topic">
				<c:forEach var="topic" items="${tempList}">
					<li>
						<a href="${pageContext.request.contextPath }/topic/toComment?cardId=${topic.id}">
						<h4 class="topicTitle" style="display: inline-block;">${topic.title}</h4>
						</a>		
						<p><fmt:formatDate value="${topic.sendtime}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
						
						<c:if test="${isMy == true}">
							<div class="del">
								<div class="btn delbtn">删除</div>  
								<div id="delKuang">
								<div class="container duihua">
									<h4>确定要删?</h4>	
									<a href="${pageContext.request.contextPath}/cushome/delTopic?delId=${topic.id}"><div class="btn" style="margin-right: 2em;">确认</div></a>
									<div class="btn close1">再想想</div>
								</div>
								</div>
							</div>
						</c:if>
						
					</li>	
				</c:forEach>
			</ul>
		</div>
		
		
		
		<div class="container-fluid footer">
			<h1 style="position: absolute;right: 2%;top: 0;color: white;">Cor show</h1>
		</div>
		
		<div class="container" style="text-align: center;">
			<ul class="pagination fenye">
			    <li class="disabled"><a href="#">&laquo;</a></li>
			    
			    <%
			   List<Topic> list2 = cusService.topicAccount(((Customer)request.getAttribute("homeCus")).getAccount());
			   
			   	int sum = list2.size();
			    int pageNumber = sum / 5;
			    
			    if(sum % 5 != 0){
			    	pageNumber ++;
			    }
			    
			    for(int i = 0; i < pageNumber; i++){
			    	%>
			    	<li><a href="#" data-page="<%=i+1%>"><%=i+1 %></a></li>
			    	<%
			    }
			    %>
			    <li class="mo"><a href="#">&raquo;</a></li>
			</ul>
		</div>
		<div id="shade">
		<div class="close" style="float: right;color: white;margin-right:1.5em;
		font-size:50px;">
		X
		</div>
			<div class="htmleaf-container">
		<!-- Content -->
		<div style="text-align:center;clear:both">
		<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
		<script src="/follow.js" type="text/javascript"></script>
		</div>
  <div class="container">
    <div class="row">
      <div class="col-md-9">
        <!-- <h3 class="page-header">Demo:</h3> -->
        <div class="img-container">
          <img src="/head/beijing.jpg" alt="Picture">
        </div>
      </div>
      <div class="col-md-3">
        <!-- <h3 class="page-header">Preview:</h3> -->
        <div class="docs-preview clearfix">
          <div class="img-preview preview-lg"></div>
          <div class="img-preview preview-md"></div>
         <!--  <div class="img-preview preview-sm"></div>
          <div class="img-preview preview-xs"></div> -->
        </div>

       </div>
    </div>
    <div class="row">
    <form action="${pageContext.request.contextPath }/cushome/changeHead" method="post" enctype="multipart/form-data">
        <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
            <input class="sr-only" id="inputImage" name="inputImage" type="file" accept="image/*">
            <span class="docs-tooltip" data-toggle="tooltip" title="选择头像">
              <span>上传</span>
            </span>
          </label>
          <button class="btn btn-primary" data-method="getCroppedCanvas" type="button">
            <span class="docs-tooltip" data-toggle="tooltip" title="点击预览">
             	 预览
            </span>
          </button>
        <div class="docs-data" style="display: none;">    
            <input class="form-control" id="dataX" name="dataX" type="text" placeholder="x">
            <input class="form-control" id="dataY" name="dataY" type="text" placeholder="y">      
            <input class="form-control" id="dataWidth" name="dataWidth" type="text" placeholder="width">       
            <input class="form-control" id="dataHeight" name="dataHeight" type="text" placeholder="height">   
        </div>
     	<input class="btn btn-primary" type="submit" value="确认">
     </form>
     
      <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button class="close" data-dismiss="modal" type="button" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="getCroppedCanvasTitle">预览效果</h4>
              </div>
              <div class="modal-body"></div>
              <!-- <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal" type="button">Close</button>
              </div> -->
            </div>
          </div>
        </div><!-- /.modal -->
     </div><!-- /.docs-toggles -->
      
    </div>
  </div> 
		</div>
			
		 <script src="${pageContext.request.contextPath }/static/jquery-image-cut/assets/js/jquery.min.js"></script>
	  	<script src="${pageContext.request.contextPath }/static/jquery-image-cut/assets/js/bootstrap.min.js"></script>
	  	<script src="${pageContext.request.contextPath }/static/jquery-image-cut/dist/cropper.js"></script>
	 	 <script src="${pageContext.request.contextPath }/static/jquery-image-cut/js/main.js"></script>
		<script type="text/javascript">
		$(function(){
			$('#change').on('click',function(){
				$('#shade').css('display','block');
			});
			
			$('.close').on('click',function(){
				$('#shade').css('display','none');
			});
			
			$('.delbtn').on('click',function(){
				$(this).closest('.del').children('#delKuang').css('display','block');
			});
			
			$('.close1').on('click',function(){
				$(this).closest('#delKuang').css('display','none');
			});
			
			
			
			$('.mo').on('click',function(){
				$('.topic').children('li').css('display','none');
			});
			
			
			var isMy;
			if($('div').hasClass('del')){
				isMy = true;
			}else{
				isMy = false;
			}
			
			var $begin;
			
			$('.fenye>li').on('click',function(){
				$.ajax({
					url:'/luntan/cushome/limitPage',
					type:'post',
					dataType:'json',
					data :{
						page : $(this).children('a').data('page')
					},
					success:function(result){
						var json = eval(result);
						var $topic = json.limitTopic;
						console.log($topic);
						
						var $html="";
						$.each($topic,function(){
							console.log(this.sendtime);
							
							$html += "<li><a href='/luntan/topic/toComment?cardId="+this.id+"'>";
							$html += " <h4 class='topicTitle' style='display: inline-block;'>"+this.title+"</h4></a>";
							 if(isMy){	
								$html += "<div class='del'>";
								$html += "<div class='btn delbtn'>删除</div>";
								$html += "<div id='delKuang'>";
								$html += " <div class='container duihua'>";
								$html += "<h4>确定要删?</h4>"
								$html += "<a href='/luntan/cushome/delTopic?delId="+this.id+"'><div class='btn' style='margin-right: 2em;'>确认</div></a>";
								$html += "<div class='btn close1'>再想想</div>";
								$html +="</div></div></div>";					
							} 
							$html += "<p>"+$.format.date(this.sendtime, "dd/MM/yyyy hh:mm:ss");  +"</p></li>";
						});
				
						$('#topics').html($html);
					}
					
				});
			});
		

		});
		</script>
</body>
</html>
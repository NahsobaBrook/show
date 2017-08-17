<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

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
		display:inline-block;
		width:60%;
		max-width:300px;
	}
	#head{
		height:100px
	}
</style>

</head>
<body>

	<div class="container" style="max-width:500px;margin-top:200px">
		
		<h3 style="margin-buttom:100px">注册Cor论坛</h3>

		<div class="panel center-block" style="padding-left:50px">
			<form enctype="multipart/form-data" class="form-horizontal" action="${pageContext.request.contextPath }/customer/reg/" method="post" autocomplete="off">
				
				<div class="form-group">
					<input name="account" class="easyui-textbox" data-options="label:'账号：',
					required:true,missingMessage:'账号不能为空',validType:'length[6,12]',
					invalidMessage:'账号应为6-12位'">
					
					<c:if test="${not empty sessionScope.error }">
						<h6 style="display: inline-block;">${sessionScope.error}</h6>
					</c:if>
				</div>
				
				
				<div class="form-group">
					<input id="pwd" name="password" type="password" class="easyui-textbox" data-options="label:'密码：',
					required:true,missingMessage:'密码不能为空',validType:'length[6,15]',
					invalidMessage:'密码应位6-15位'">
				</div>
				
				<div class="form-group">
					<input name="repass" type="password" class="easyui-textbox" validType="equals['#pwd']"
					data-options="label:'确认密码：',required:true,missingMessage:'确认密码不能为空'"  />
				</div>
				
				<div class="form-group">
					<input id="head" class="easyui-filebox" name="head" accept="image/*">
				</div>
				
				<div class="form-group">
					<input class="easyui-linkbutton" name="reg" type="submit" value="注册" style="height:30px;width:300px">
				</div>
				
			
			</form>
		</div>
	</div>
	
	
	<script type="text/javascript">
	$(function(){
		$.extend($.fn.validatebox.defaults.rules, {  
			equals:{
				validator:function(value,param){
					return value == $(param[0]).val();
				},
				message:'两次密码输入不一致'
			}
		});  

		$('#head').filebox({
			buttonText:'选择头像',
			buttonAlign:'left',
			accept:'image/*'
			
		});
		
	});
	</script>
		<%
		session.removeAttribute("error");
		%>
	
</body>
</html>
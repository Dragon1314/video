<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录界面</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/messages_zh.min.js"></script>   
<style>
    form{ 	
        margin-left: 350px;
    	margin-top: 300px;
    }		
</style>
<script type="text/javascript">
$(function(){
/* 	alert($('input[type=text]').attr("name"));
	
	$('input[type=text]').each(function(index,element){
		alert($(element).attr("name"));
	}); */
	//$("label").html('<font size="15">sss</font>');
	//alert($("button").css('width'));
	//$("button").css('height','300px')

	$('#loginForm').validate({
		   rules:{
			   loginName:{
				   required:true
			   },
			   loginPwd:{
				   required:true,
				   minlength:5
			   }
			   
		   },
		   messages:{
			   loginName:{
				   required:"用户名不能为空！ "
			   },
			   loginPwd:{
				   required:"密码不能为空!"
			   }
			   
		   }
		
		
		
		
		
	});	
});

</script>
</head>
<body>
 	
<div class="container">
  		
  <form  action="${pageContext.request.contextPath}/adminLogin.action" method="post" id="loginForm">		 
  <div class="form-group has-success "  class="col-md-3">
  	<img src="img/logo.png" width="250px" /><br />
    <label for="exampleInputEmail1">用户名</label>
    <input type="text" name="loginName"  class="form-control"      placeholder="用户名" style="width: 250px;">
  </div>
  <div class="form-group has-success">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" name="loginPwd"  class="form-control"  placeholder="登录密码" style="width: 250px;">
    <br/>
  <button type="submit" class="btn btn-success"  style="width: 250px;">提交</button>
  </div>

</form>
  		
  		
  		
  		
  		
  		
  		
  		
  	</div>
  </body>
</html>


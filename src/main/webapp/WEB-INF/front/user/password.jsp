<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="${BaseContext}">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.min.js"></script>
</head>

<body class="w100">
   <jsp:include page="uheader.jsp"></jsp:include>
    <main>
        <div class="container">
            <h2>我的资料</h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <li><a href="${pageContext.request.contextPath}/front/user/profile.do?email=${user.email}">更改资料</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="${pageContext.request.contextPath}/front/user/avatar.do?email=${user.email}">更改头像</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="${pageContext.request.contextPath}/front/user/password.do?email=${user.email}">密码安全</a></li>
                </ul>
                <div class="proflle_tab_body">
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                        
                           <c:if test="${empty user.headUrl}">
		                         <img id="avatar"  src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
		                      </c:if>
		                      
		                      <c:if test="${not empty user.headUrl}">
		                         <img id="avatar" width="200px" height="200px" src="/pics/${user.headUrl}" alt="">
		                      </c:if>
                           
                        </div>
                        
                        <div class="profile_ifo_area">
                        
                         <c:if test="${not empty message}">
				            <div>
				                <strong>${message}</strong>
				            </div>
				            </c:if>
<script type="text/javascript">
$(function(){
	$("#passwordform").validate({
		rules:{
			oldPassword:{
				required:true
			},
			newPassword:{
				required:true
			},
			newPasswordAgain:{
				required:true,
				equalTo:"#newPassword"
			}						
		},
		messages:{
			oldPassword:{
				required:"旧密码不能为空!"
			},
			newPassword:{
				required:"新密码不能为空！"
			},
			newPasswordAgain:{
				required:"确认密码不能为空 ！",
				equalTo:"俩次输入密码不一致 ！"
			}	
		}		
	});

	$("#oldPassword").blur(function(){
		var email='${email}';
		var old=$("#oldPassword").val();
		//alert($("#oldPassword").val());
		//alert(email);
		var checkpassword=$("#oldPassword").val();
		$.ajax({
			type:"POST",
			data:"email="+email+"&checkpassword="+old,
		    dataType:"text",
		    url:"${pageContext.request.contextPath}/front/user/checkpassword.do",
			success:function(msg){
				if(msg=="error"){
					$("#checkspan").text("原始密码错误！ ");
					$("#submitbtn").attr("disabled",true);
				}else{
					$("#checkspan").text("");
					$("#submitbtn").removeAttr("disabled");
				}
				
				}
			
			
			
		});
		
		
		
	});
	
	
});

</script>				            
				            
                            <form id="passwordform" action="${pageContext.request.contextPath}/front/user/password.do?email=${email}" method="post">
                                <div class="form_group">
                                    
                                    <span class="dd">旧&#x3000;密&#x3000;码：</span>
                                    <input type="password" id="oldPassword" name="oldPassword"><span id="checkspan"></span>
                                </div>
                                <div class="form_group">
                                    <span class="dd">新&#x3000;密&#x3000;码：</span>
                                    <input type="password" id="newPassword"  name="newPassword">
                                </div>
                                <div class="form_group">
                                    <span class="dd">确认新密码：</span>
                                    <input type="password" id="newPassword02" name="newPasswordAgain">
                                </div>
                                <div class="form_submit dd">
                                    <input id="submitbtn" type="submit" value="保&#x3000;存">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="ufooter.jsp"></jsp:include>
    <%@include file="../include/script.html"%>
   <script type="text/javascript">

   </script>
</body>
</html>
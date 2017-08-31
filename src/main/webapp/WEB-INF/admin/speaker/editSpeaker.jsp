<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改讲师</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  </head>
  <body>
  <div class="container-fluid  ">
  	
  	
  	
        <div   class="collapse navbar-collapse navbar-inverse navbar-fixed-top  row"  id="bs-example-navbar-collapse-9" >
         
              <div class="col-md-offset-2 col-md-9" style="width: 1200px;">
                        <ul class="nav navbar-nav " >
                             <li class="active "><a href="#">视频管理系统</a></li>
                             <li><a href="${pageContext.request.contextPath}/admin/video/videoList.action">视频管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/admin/speaker/speakerList.action">主讲人管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/admin/course/courseList.action">课程管理</a></li>
                             <li><a href="#">统计分析</a></li>
                        </ul>          
                         <a style="padding-right:3px" class="navbar-brand col-md-offset-5" href="#">${logAdmin.loginName}</a>  
                         <a style="padding-left:0px" class="navbar-brand " href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
              </div>
    
          </div>
  
  
 <div class="row" style="padding-left: 34px;">
<div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
  <h3>编辑主讲人-主讲人管理</h3>
</div>
</div> 


<div class="col-md-offset-2 col-md-9 " style="width: 1080px;">
<form action="${pageContext.request.contextPath}/admin/speaker/editSpeaker.action" method="post" class="navbar-form navbar-left form-group has-success" role="search" style="width: 1080px;">
<table width="100%" border="0" height="400px">
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">名字</font></b></td>
	     	  <td width="70%"><input  type="text"  placeholder="主讲人名字"  style="width: 100%;" name="speakerName" value="${speaker.speakerName}"></td>
	     </tr>

	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">职业</font></b></td>
	     	  <td width="70%"><input type="text" placeholder="主讲人职业" style="width: 100%;" name="speakerJob" value="${speaker.speakerJob}"></td>
	     </tr>	
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">头像图片</font></b></td>
	     	  <td width="70%"><input type="text" placeholder="主讲人头像地址，网络图片" style="width: 100%;" name="speakerHeadUrl" value="${speaker.speakerHeadUrl}"></td>
	     </tr>	
	
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">简介</font></b></td>
	     	  <td width="70%">
<textarea  style="width: 100%;height: 100%;" name="speakerDescr">${speaker.speakerDescr}</textarea>
	     	  </td>
	     </tr>	     
	     
	     <tr>
	     	<td></td>
	     	<td><input type="submit" class="btn btn-primary" value="保存"> <a class="btn btn-default" href="javascript:history.go(-1)">返回列表</a></td>
	     </tr>
</table>
<input type="hidden" name="id" value="${speaker.id}">                        
</form> 
</div>







  		
  		
  		
 </div>	 	
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改视频</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


  </head>
  <body>
  <div class="container-fluid  ">
<jsp:include page="../header.jsp">
<jsp:param value="video" name="jsp"/>
</jsp:include>  	
  	
  	

  
  
 <div class="row" style="padding-left: 34px;">
<div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
  <h3>编辑视频信息-视频管理</h3>
</div>
</div> 


<div class="col-md-offset-2 col-md-9" style="width: 1080px;">
<form action="${pageContext.request.contextPath}/admin/video/updateVideo.action" class="navbar-form navbar-left" role="search" style="width: 1080px;">
<table width="100%" border="0" height="400px">
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">视频标题</font></b></td>
	     	  <td width="70%"><input type="text" name="videoTitle" placeholder="视频标题" style="width: 100%;" value="${video.videoTitle}"></td>
	     </tr>
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">主讲人</font></b></td>
	     	  <td width="70%">
	     	  	               <select name="spaekerId" style="width: 100%;">
	     	  	               	  	<option>请选择主讲人</option>
	     	  	               	  	<c:forEach items="${speakerList}" varStatus="status" var="speaker">
	     	  	               	  	          <option ${video.speakerId eq speaker.id ? "selected" : "" } value="${speaker.id}">${speaker.speakerName}</option>
	     	  	               	  	</c:forEach>
	     	                   </select>
	     	  </td>
	     </tr>
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">所属课程</font></b></td>
	     	  <td width="70%">
	     	  	             <select  name="courseId" style="width: 100%;">
	     	  	                         <option>请选择课程</option>
	     	  	                         <c:forEach items="${courseList}" varStatus="status" var="course">
  	     	  	                                    <option ${video.courseId eq course.id ? "selected" : ""} value="${course.id}">${course.courseName}</option>
	     	  	                         </c:forEach>
	     	  	             </select>
	     	  </td>
	     </tr>	
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">视频时长</font></b></td>
	     	  <td width="70%"><input type="text" name="videoLength" placeholder="视频时长(秒)" style="width: 100%;" value="${video.videoLength}"></td>
	     </tr>	
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">封面图片</font></b></td>
	     	  <td width="70%"><input type="text" name="videoImageUrl" placeholder="视频封面图片地址，网络图片" style="width: 100%;" value="${video.videoImageUrl}"></td>
	     </tr>	
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">视频播放地址</font></b></td>
	     	  <td width="70%"><input type="text" name="videoUrl" placeholder="视频播放地址，网络地址" style="width: 100%;" value="${video.videoUrl}"></td>
	     </tr>
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">视频简介</font></b></td>
	     	  <td width="70%">
<textarea name="videoDescr" autocomplete="on" style="width: 100%;height: 100%;">${video.videoDescr}</textarea>
	     	  </td>
	     </tr>	     
	     
	     <tr>
	     	<td></td>
	     	<td><input type="submit" class="btn btn-primary" value="保存">  <a class="btn btn-default" href="javascript:history.go(-1)">返回列表</a></td>
	     </tr>
</table>
<input type="hidden" name="id" value="${video.id}">                        
</form> 
</div>

 		
 </div>	 	
  </body>
</html>
    
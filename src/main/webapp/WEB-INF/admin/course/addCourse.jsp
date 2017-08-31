<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加课程</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
  <body>
  <div class="container-fluid  ">
<jsp:include page="../header.jsp">
<jsp:param value="course" name="jsp"/>
</jsp:include> 	 	
  	
  	
  
  
 <div class="row" style="padding-left: 34px;">
<div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
  <h3>添加课程</h3>
</div>
</div> 


<div class="col-md-offset-2 col-md-9" style="width: 1080px;">
<form action="${pageContext.request.contextPath}/admin/course/addCourse.action" method="post" class="navbar-form navbar-left" role="search" style="width: 1080px;">
<table width="100%" border="0" height="400px">
	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">所属学科</font></b></td>
	     	  <td width="70%">
	     	  <select name="subjectId"  style="width: 100%;">
	               <option>请选择所属学科</option>
	               <c:forEach items="${subjectList}" varStatus="status" var="subject">
	                          <option value="${subject.id}">${subject.subjectName}</option>
	               </c:forEach>
	          </select>
	          </td>
	     </tr>
	    

	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">标题</font></b></td>
	     	  <td width="70%"><input type="text" name="courseName" placeholder="课程标题" style="width: 100%;"></td>
	     </tr>	

	     <tr>
	     	  <td width="30%" align="center"><b><font size="4" class="">简介</font></b></td>
	     	  <td width="70%">
<textarea  style="width: 100%;height: 100%;" name="courseDescr"></textarea>
	     	  </td>
	     </tr>	     
	     
	     <tr>
	     	<td></td>
	     	<td><input type="submit" class="btn btn-default" value="保存">
	     </tr>
</table>
                        
</form> 
</div>







  		
  		
  		
 </div>	 	
  </body>
</html>
    
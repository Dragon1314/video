<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zhiyou100.com/common/" prefix="x" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课程列表</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  </head>
  <body>
  <div class="container-fluid  ">
  	
  	<jsp:include page="../header.jsp">
  	<jsp:param value="course" name="jsp"/>
  	</jsp:include>
  	
<%--           <div   class="collapse navbar-collapse navbar-inverse navbar-fixed-top  row"  id="bs-example-navbar-collapse-9" >
         
              <div class="col-md-offset-2 col-md-9" style="width: 1200px;">
                        <ul class="nav navbar-nav " >
                             <li class="active "><a href="#">视频管理系统</a></li>
                             <li><a href="${pageContext.request.contextPath}/video/videoList.action">视频管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/speaker/speakerList.action">主讲人管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/course/courseList.action">课程管理</a></li>
                             <li><a href="#">统计分析</a></li>
                        </ul>          
                         <a style="padding-right:3px" class="navbar-brand col-md-offset-5" href="#">${logAdmin.loginName}</a>  
                         <a style="padding-left:0px" class="navbar-brand " href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
              </div>
    
          </div> --%>
  
  
 <div class="row" style="padding-left: 34px;">
<div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
  <h3>课程列表-课程管理</h3>
</div>
</div> 


<div class="col-md-offset-2 col-md-9" style="width: 1080px;">
<form class="navbar-form navbar-left" role="search" style="width: 1080px;">
     <div class="form-group" style="width: 1080px;">
       <a href="${pageContext.request.contextPath}/admin/course/addCourse.action" class="btn btn-primary navbar-btn  active " >添加课程</a>
    </div>
</form> 

<table class="table table-hover" width="100%">
 <tr>
 	 <th width="10%">序号</th>
 	 <th width="10%">标题</th>
 	 <th width="10%">学科</th>
 	 <th width="50%">简介</th>
 	 <th width="10%">编辑</th>
 	 <th width="10%">删除</th>
 	
 </tr>
   <c:forEach items="${courseList}" varStatus="status" var="course">
     <tr>
     <th width="10%">${status.count}</th>
 	 <th width="10%">${course.courseName}</th>
 	 <th width="10%">${course.subjectName}</th>
 	 <th width="50%"><textarea class="form-control"  rows="5" style="width: 100%;resize: none;border-style: none;background: transparent;overflow: hidden;">${course.courseDescr}</textarea></th>
 	 <th width="10%"><a href="${pageContext.request.contextPath}/admin/course/editCourse.action?upid=${course.id}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></th>
 	 <th width="10%"><a onclick="del('${pageContext.request.contextPath}/admin/course/deleteCourse.action?delid=${course.id}')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></th>   	   	
    </tr>  
   </c:forEach>

</table>
<script type="text/javascript">
function del(url){
	$('#url').val(url);
	$('#myModal').modal();
}

function suburl(){
	var url=$.trim($('#url').val());
	location.href=url;
}

</script>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="url">
        <p>确认删除？&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="suburl()" >确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>



 		
 </div>	 	
  </body>
</html>
    
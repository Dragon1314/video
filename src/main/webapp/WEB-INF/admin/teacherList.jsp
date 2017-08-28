<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员界面</title>

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
            <li><a href="${pageContext.request.contextPath}/video/videoList.html">视频管理</a></li>
            <li><a href="${pageContext.request.contextPath}/speaker/speakerList.html">主讲人管理</a></li>
            <li><a href="${pageContext.request.contextPath}/course/courseList.html">课程管理</a></li>
            <li><a href="#">统计分析</a></li>
          </ul>
          
         <a class="navbar-brand col-md-offset-5" href="#">admin</a>  
         <a class="navbar-brand " href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
        </div>
    
  </div>
  
  
 <div class="row" style="padding-left: 34px;">
<div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
  <h3>主讲人列表-主讲人管理</h3>
</div>
</div> 
<!--*********************************************************************************分割线-->

<div class="col-md-offset-2 col-md-9 " style="width: 1080px;">
<form class="navbar-form navbar-left " role="search" style="width: 1080px;">
     <div class="form-group" style="width: 1080px;">
       <a href="#" class="btn btn-primary navbar-btn   " >添加主讲人</a>
       
       <font class="col-md-offset-5">名称</font><input class="form-control" type="text" placeholder="主讲人名称" />
       <font>职位</font><input type="text" class="form-control" placeholder="主讲人职位" />
       
       <a href="#" class="btn btn-primary navbar-btn  active " >查询</a>
    </div>
  
  
  
  
<table class="table table-hover" width="100%">
 <tr>
 	 <th width="10%">序号</th>
 	 <th width="10%">名称</th>
 	 <th width="10%">职位</th>
 	 <th width="50%">简介</th>
 	 <th width="10%">编辑</th>
 	 <th width="10%">删除</th>
 	
 </tr>
 
    <tr>
     <th width="10%">1</th>
 	 <th width="10%">张强</th>
 	 <th width="10%">高级讲师</th>
 	 <th width="50%"><textarea style="width: 100%;resize: none;border-style: none;background: transparent;"></textarea></th>
 	 <th width="10%"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></th>
 	 <th width="10%"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></th>   	   	
    </tr>
    
    <tr>
     <th width="10%">2</th>
 	 <th width="10%">xx</th>
 	 <th width="10%">xx</th>
 	 <th width="50%"><textarea style="width: 100%;resize: none;background:transparent;border-style: none;"></textarea></th>
 	 <th width="10%"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></th>
 	 <th width="10%"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></th>   	   	
    </tr>
    <tr>
     <th width="10%">3</th>
 	 <th width="10%">xx</th>
 	 <th width="10%">xx</th>
 	 <th width="50%"><textarea style="width: 100%;resize: none;border-style: none;background: transparent;"></textarea></th>
 	 <th width="10%"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></th>
 	 <th width="10%"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></th>   	   	
    </tr>
   
    <tr>
     <th width="10%">4</th>
 	 <th width="10%">xx</th>
 	 <th width="10%">xx</th>
 	 <th width="50%"><textarea style="width: 100%;resize: none;border-style: none;background: transparent;"></textarea></th>
 	 <th width="10%"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></th>
 	 <th width="10%"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></th>   	   	
    </tr>

 	 
 	
 	

</table>
  
  

</form>

</div>







  		
  		
  		
 </div>	 	
  </body>
</html>


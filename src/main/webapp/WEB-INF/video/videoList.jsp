<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zhiyou100.com/common/" prefix="x" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>视频列表</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  </head>
  <body>
  
  
<div class="container-fluid">
  	
  	
  	
          <div   class="collapse navbar-collapse navbar-inverse navbar-fixed-top  row"  id="bs-example-navbar-collapse-9" >
         
              <div class="col-md-offset-2 col-md-9" style="width: 1200px;">
                        <ul class="nav navbar-nav " >
                             <li class="active "><a href="#">视频管理系统</a></li>
                             <li><a href="${pageContext.request.contextPath}/video/videoList.action">视频管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/speaker/speakerList.action">主讲人管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/course/courseList.action">课程管理</a></li>
                             <li><a href="${pageContext.request.contextPath}/analysis/analysis.action">统计分析</a></li>
                        </ul>          
                         <a style="padding-right:3px" class="navbar-brand col-md-offset-5" href="#">${logAdmin.loginName}</a>  
                         <a style="padding-left:0px" class="navbar-brand " href="${pageContext.request.contextPath}/admin/logout.action"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
              </div>
    
          </div>
  
  
                        <div class="row" style="padding-left: 34px;">
                               <div class="jumbotron col-md-offset-2 col-md-8" style="width: 1080px;">
                                      <h3>视频列表-视频管理</h3>
                               </div>
                        </div> 


   <div class="col-md-offset-2 col-md-9 form-group " style="width: 1080px;">
          <form class="navbar-form navbar-left" role="search" style="width: 1080px;" action="${pageContext.request.contextPath}/video/videoList.action" method="post">
                     <div class="form-group" style="width: 1080px;">
                                 <a href="${pageContext.request.contextPath}/video/addVideo.action" class="btn btn-primary navbar-btn  active " >添加视频</a>
                                 <a href="#" class="btn btn-primary navbar-btn  active " >批量删除<span class="badge">0</span></a> 
                                    
       <font class="col-md-offset-3"></font>
       <input class="form-control " type="text" name="videoTitle" placeholder="视频标题" value="${title}" />
       <select class="form-control" name="speakerId">
       	         <option  ${speakerId eq "" ? "selected" : ""} value="">请选择主讲人</option>
       	         <c:forEach items="${speakerList}" varStatus="status" var="speaker">
       	                   <option ${speakerId eq speaker.id ? "selected" : ""} value="${speaker.id}">${speaker.speakerName}</option>
       	         </c:forEach>     	
       </select>
       <select class="form-control" name="courseId">
              <option ${courseId eq "" ? "selected" : ""} value="">请选择课程</option> 
               <c:forEach items="${courseList}" varStatus="status" var="course">              
                             <option ${courseId eq course.id ? "selected" : ""} value="${course.id}">${course.courseName}</option> 
               </c:forEach>       	             	
       </select>      
       <input type="submit"  class="btn btn-primary navbar-btn  active "  value="提交">
                     </div>
   </form> 
   
   
<form action="${pageContext.request.contextPath}/video/deleteVideos.action"> 
<div style="float:left;position:absolute;margin-top:8px;margin-left:100px;">
<!-- <a href="#" class="btn btn-primary navbar-btn  active " >批量删除<span class="badge" >0</span></a> -->
<button  class="btn btn-primary navbar-btn  active " id="classbtn"  onclick="deleteAll(this)">批量删除<span class="badge" id="badge">0</span></button>                    
</div>
<table class="table table-hover" width="100%">
 <tr>
 	 <th width="5%">序号<input type="checkbox" id="all"  onclick="selectAll(this)"/></th>
 	 <th width="5%">名称</th>
 	 <th width="60%">介绍</th>
     <th width="5%">讲师</th>
     <th width="5%">课程</th>
     <th width="5%">时长(秒)</th>
     <th width="5%">播放次数</th>
 	 <th width="5%">编辑</th>
 	 <th width="5%">删除</th>	
 </tr>
 
 <c:forEach items="${page.rows}" varStatus="status" var="video">
  	 <tr>
  	 <th width="5%"><input type="checkbox" id="check" onclick="badgeCount()"  name="checkrow" value="${video.id}" />${status.count}</th>
 	 <th width="5%">${video.videoTitle}</th>
 	 <td width="60%"> 
<textarea   readonly="readonly" rows="3"  style="width: 100%;resize: none;border-style: none;background: transparent;overflow: hidden;">${video.videoDescr}</textarea>
 	 </td>
     <th width="5%">${video.speakerName}</th>
     <th width="5%">${video.courseName}</th>
     <th width="5%">${video.videoLength}</th>
     <th width="5%">${video.videoPlayTimes}</th>
 	 <th width="5%"><a href="${pageContext.request.contextPath}/video/editVideo.action?upid=${video.id}"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></th>
<%--  	 <th width="5%"><a data-toggle="modal" data-target="#myModal" href="${pageContext.request.contextPath}/video/deleteVideo.action?delid=${video.id}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></th> --%>
  	 <th width="5%"><a  onclick="del('${pageContext.request.contextPath}/video/deleteVideo.action?delid=${video.id}')" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></th>
 </tr>
 
 </c:forEach>
</table>
 <script>
 var total=0;
window.onload=function(){
	//alert(1);	
	//alert(document.getElementById("check"));

}
$(document).ready(function(){
	$("#classbtn").click(function(){
		$('#myModal').modal();
	});
	
 	$("input[value=xxx]").attr({
		value:"yyy",
		style:"color:red;background-color:white;",		
	}); 

//alert($("span[name=span]").text());
//$("span[name=span]").html("<b>mm</b>");
	
	//$("p[name=p]").css("color","yellow");
/*  	$("select[name=select]");
	var $s1=$("<option>China</option>");
	var $s2=$("<option>US</option>");
	var $s3=$("<option>333</option>");
	var $s4=$("<option>444</option>");
	$("select[name=select]").append($s1);
	$s2.appendTo($("select[name=select]"));
	$s2.prepend($s3);
	$s2.prepend($s4);
	$s1.remove();
	$s1.empty();  */
/* 	var $s=$("select[name=select]");
	//操作节点以及HTMdom
	var $s1=$("<option>AAAA</option>");
	var $s2=$("<option>BBBB</option>");
	var $s3=$("<option>CCCC</option>");
	var $s4=$("<option>DDDD</option>");
     $s.append($s1); 
     $s2.appendTo($s);
     $s.prepend($s3);
     $s.prepend($s4);
   
 // alert($s1[0].parentNode);
  //$s[0].removeChild($s1[0]);
	//($s1[0].parentNode).removeChild($s1[0]);
 var option=document.createElement("option");
 var text=document.createTextNode("EEE");
 option.appendChild(text);
 option.setAttribute("style","color:red");
 alert(option);
 $s[0].appendChild(option); */
 	var sarr=document.getElementsByName("checkrow");
 	total=sarr.length;
 	//alert(total);
 	//alert(typeof(total));
}); 
 
 
 
function badgeCount(){
var count=0;	 
var arr=document.getElementsByName("checkrow");

for(var i=0;i<arr.length;i++){
	if(arr[i].checked==true){
		count=count+1;
	}
}
//alert(count);
//alert(typeof(count));
document.getElementById("badge").innerHTML=count;  

 if(total-count>0){
	($('#all')[0]).checked=false;
}else{
	($('#all')[0]).checked=true;
} 


} 
 
 
              function selectAll(s){
            	 var arr=document.getElementsByName("checkrow");
            	 var counts=arr.length;
            	for(var i=0;i<arr.length;i++){
            		arr[i].checked=s.checked;
            	}  
            	if(s.checked==true){
            	document.getElementById("badge").innerHTML=counts;
            	    }else{
                document.getElementById("badge").innerHTML=0;    	
            	    }
              } 
 
              function del(url){
            	  $('#url').val(url);
            	  $('#myModal').modal();
              }
              
              function suburl(){
            	 var url=$.trim($("#url").val());
            	 window.location.href=url;  
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


</form>  
<x:page url="${pageContext.request.contextPath}/admin/videoList.action"></x:page>


  </div>

<!-- &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="xxx">
<span name="span">wo</span></br>
<p name="p" class="btn btn-success">00000</p><br>

<a class="form-control navbar navbar-inverse" style="border:solid 1px black;">链接</a>
 -->
<!-- <select name="select" class="btn btn-success">
</select> -->






</div>	 	
  </body>
</html>



    
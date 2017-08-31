<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>统计分析</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/echarts-all.js"></script>

</head>
<body>
<div class="container-fluid  ">
  	<jsp:include page="../header.jsp">
  	<jsp:param value="analysis" name="jsp"/>
  	</jsp:include>
  		
<%-- <div   class="collapse navbar-collapse navbar-inverse navbar-fixed-top  row"  id="bs-example-navbar-collapse-9" >       
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
  <h3>统计-统计分析</h3>
</div>
</div> 




<div id="Echar" class="col-md-offset-2 col-md-9" style="width: 1080px;height:500px;">
</div>

    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
window.onload=function(){       
        var myChart = echarts.init(document.getElementById('Echar'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '课程平均播放次数 '
            },
            tooltip: {},
            legend: {
                data:['平均播放次数 ']
            },
            xAxis: {
            	
                /* data: ["前端开发与Git入门 ","每天20分钟轻松入门React","UI基础入门 ","Python编程零基础入门 ","轻松进击PHP基础 "] */
                data:["前端开发与Git入门 ","每天20分钟轻松入门React","UI基础入门 ","Python编程零基础入门 ","轻松进击PHP基础 "]
            },
            yAxis: {
            	min:100,
            	max:500
            },
            series: [{
                name: '播放次数 ',
                type: 'bar',
                /* data: [5, 20, 36, 10, 10] */
                data:[199,378,189,211,342]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
        //alert($('#titles').val());
        //alert($('#times').val());

    	    
      
       // window.onresize = curChart.resize;
        
}        
</script>

<input type="hidden" name="title" id="titles" value="${titles}">
<input type="hidden" name="times" id="times" value="${times}">




  		
  		
  		
</div>	 	
</body>
</html>
    
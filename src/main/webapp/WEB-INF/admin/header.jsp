<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <div   class="collapse navbar-collapse navbar-inverse navbar-fixed-top  row"  id="bs-example-navbar-collapse-9" >
      
              <div class="col-md-offset-2 col-md-9" style="width: 1200px;">
                        <ul class="nav navbar-nav " >
                             <li><a href="#">视频管理系统</a></li>
                             <li ${param.jsp eq "video" ? "class='active'":""}><a href="${pageContext.request.contextPath}/admin/video/videoList.action">视频管理</a></li>
                             <li ${param.jsp eq "speaker" ? "class='active'":""}><a href="${pageContext.request.contextPath}/admin/speaker/speakerList.action">主讲人管理</a></li>
                             <li ${param.jsp eq "course" ? "class='active'":""}><a href="${pageContext.request.contextPath}/admin/course/courseList.action">课程管理</a></li>
                             <li ${param.jsp eq "analysis" ? "class='active'":""}><a href="${pageContext.request.contextPath}/admin/analysis/analysis.action">统计分析</a></li>
                        </ul>          
                         <a style="padding-right:3px" class="navbar-brand col-md-offset-5" href="#">${logAdmin.loginName}</a>  
                         <a style="padding-left:0px" class="navbar-brand " href="${pageContext.request.contextPath}/admin/logout.action"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
              </div>
    
          </div>
    
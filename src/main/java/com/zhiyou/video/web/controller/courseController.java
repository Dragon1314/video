package com.zhiyou.video.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.zhiyou.video.model.Course;
import com.zhiyou.video.model.Subject;
import com.zhiyou.video.model.Video;
import com.zhiyou.video.service.CourseService;
import com.zhiyou.video.service.SubjectService;

@Controller
public class courseController {
	
	@Autowired
	CourseService cs;
	
	@Autowired
	SubjectService ss;
	
	@RequestMapping("/admin/course/courseList.action")
	public String courseList(HttpServletRequest request){
		List<Course> courseList=cs.findAllCourseWithSubjectName();
		request.setAttribute("courseList", courseList);		
		return "/admin/course/courseList";
	}
	
	@RequestMapping(value="/admin/course/addCourse.action",method=RequestMethod.GET)
	public String addSpeakerPage(HttpServletRequest request){	
		List<Subject> subjectList=ss.findAllSubject();
		request.setAttribute("subjectList", subjectList);
		return "forward:/WEB-INF/admin/course/addCourse.jsp";
	}
	
	@RequestMapping(value="/admin/course/addCourse.action",method=RequestMethod.POST)
	public String addSpeaker(Course course){	
		cs.addCourse(course);
		return "redirect:/admin/course/courseList.action";
	}
	
	@RequestMapping(value="/admin/course/editCourse.action",method=RequestMethod.GET)
	public String editSpeakerPage(HttpServletRequest request,@RequestParam("upid")Integer id){
		Course course=cs.findCourseById(id);
		request.setAttribute("course",course);
		List<Subject> subjectList=ss.findAllSubject();
		request.setAttribute("subjectList", subjectList);
		return "forward:/WEB-INF/admin/course/editCourse.jsp";
	}
	
	@RequestMapping(value="/admin/course/editCourse.action",method=RequestMethod.POST)
	public String editSpeaker(Course course){	
		cs.updateCourse(course);
		return "redirect:/admin/course/courseList.action";
	}
	
	@RequestMapping("/admin/course/deleteCourse.action")
	public String deleteCourse(@RequestParam("delid")Integer id){
		cs.deleteCourseById(id);
		return "redirect:/admin/course/courseList.action";
	}
	
	
	@RequestMapping("/front/course/index.do")
	public String videocourse(HttpServletRequest request,Integer subjectId){
		request.setAttribute("subjectId", subjectId);
		Subject subject=ss.FindSubjectNameById(subjectId);
		request.setAttribute("subject", subject);
		//List<Course> courses=cs.FindAllCourseWithVideos();
		List<Course> courses=cs.FindAllCourseBySubjectId(subjectId);
        for(Course course:courses){
        	
        	List<Video> vlist=course.getVideoList();
            for(Video v:vlist){
            	v.setVideoLengthStr(v.getVideoLength());
            }
        	
        }
		System.out.println(courses);
		request.setAttribute("courses", courses);
		return "forward:/WEB-INF/front/course/index.jsp";
	}
	
	
	
	
}

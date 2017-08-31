package com.zhiyou.video.web.controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.zhiyou.video.model.Course;
import com.zhiyou.video.model.Speaker;
import com.zhiyou.video.model.Video;
import com.zhiyou.video.service.CourseService;
import com.zhiyou.video.service.SpeakerService;
import com.zhiyou.video.service.SubjectService;
import com.zhiyou.video.service.VideoService;
import com.zhiyou.video.utils.Page;

@Controller
public class videoController {
	
	@Autowired
	VideoService vs;
	@Autowired
	SpeakerService ss;
	@Autowired
	CourseService cs;
	@Autowired
	SubjectService sss;
	
	
	@RequestMapping({"/admin/videoList.action","/admin/video/videoList.action"})
	public String videoList(HttpServletRequest request,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="")String videoTitle,@RequestParam(defaultValue="")Integer speakerId,@RequestParam(defaultValue="")Integer courseId ){
		List<Video> vlist=vs.findAllVideo();
		request.setAttribute("videoList", vlist);
		List<Speaker> slist=ss.findAllSpeaker();
		request.setAttribute("speakerList", slist);
		List<Course> clist=cs.findAllCourse();
		request.setAttribute("courseList",clist);
		Page<Video> pageInfo=vs.findAllVideo(videoTitle,speakerId,courseId,page);
		request.setAttribute("page", pageInfo);
		request.setAttribute("title", videoTitle);
		request.setAttribute("speakerId", speakerId);		
		request.setAttribute("courseId", courseId);
		
		return "/admin/video/videoList";
		/*return "forward:/WEB-INF/video/videoList.jsp";*/
		
	}
	
	
/*	@RequestMapping("/admin/videoList.action")
	public String videoList(HttpServletRequest request,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="")String videoTitle,@RequestParam(defaultValue="8")Integer speakerId,@RequestParam(defaultValue="8")Integer courseId ){
		List<Video> vlist=vs.findAllVideo();
		request.setAttribute("videoList", vlist);
		List<Speaker> slist=ss.findAllSpeaker();
		request.setAttribute("speakerList", slist);
		List<Course> clist=cs.findAllCourse();
		request.setAttribute("courseList",clist);
		Page pageInfo=vs.findAllVideo(videoTitle,speakerId,courseId,page);
		request.setAttribute("page", pageInfo);	
		return "video/videoList";
	
	}*/
	
	
	@RequestMapping(value="/admin/video/addVideo.action",method=RequestMethod.GET)
	public String addVideoPage(HttpServletRequest request){
		List<Speaker> slist=ss.findAllSpeaker();
		request.setAttribute("speakerList", slist);
		List<Course> clist=cs.findAllCourse();
		request.setAttribute("courseList",clist);		
		return "forward:/WEB-INF/adminvideo/addVideo.jsp";
	}
	@RequestMapping(value="/admin/video/addVideo.action",method=RequestMethod.POST)
	public String addVideo(Video video){
		vs.addVideo(video);
		return "redirect:/admin/videoList.action";
	}
	

	@RequestMapping("/admin/video/editVideo.action")
	public String editVideo(HttpServletRequest request ,@RequestParam("upid")Integer id){
        Video video=vs.findVideoById(id);
        request.setAttribute("video",video);
        
        List<Speaker> slist=ss.findAllSpeaker();
        request.setAttribute("speakerList", slist);
		
        List<Course> clist=cs.findAllCourse();
		request.setAttribute("courseList", clist);
		return "forward:/WEB-INF/adminvideo/editVideo.jsp";
	}
	
	@RequestMapping("/admin/video/updateVideo.action")
	public String updateVideo(Video video){
         vs.updateVideo(video);
		return "redirect:/admin/videoList.action";
	}
	
	
	@RequestMapping("/admin/video/deleteVideo.action")
	public String deleteVideo(@RequestParam("delid")Integer id){
         vs.deleteVideoById(id);
		return "redirect:/admin/videoList.action";
	}
	
	
	@RequestMapping("/admin/video/deleteVideos.action")
	public String deleteVideos(HttpServletRequest request,String[] checkrow){
	    for(int i=0;i<checkrow.length;i++){
	    	System.out.println(checkrow[i]);	    
	    	//vs.deleteVideoById(Integer.parseInt(checkrow[i]));
	    }
          	
		return "redirect:/admin/video/videoList.action";	
	}
	
	
	@RequestMapping("/admin/analysis/analysis.action")
	public String analysis(HttpServletRequest request){
		List<Video> vidlist=vs.findCourseWithPlayTimes();
		List<String> titleList=new ArrayList<String>();
		List<Integer> timeList=new ArrayList<Integer>();
		for(Video v:vidlist){
			titleList.add(v.getVideoTitle());
			timeList.add(v.getPlayTimes());
		}
		System.out.println(titleList);
		System.out.println(timeList);
		
		request.setAttribute("titles",titleList);
		request.setAttribute("times", timeList);
		return "forward:/WEB-INF/admin/analysis/analysis.jsp";
	}

	
	
  @RequestMapping("/front/video/index.do")
  public String frontVideo(HttpServletRequest request,Integer videoId,Integer subjectId){
	  System.out.println(videoId);
	  System.out.println(subjectId);
	  
	  request.setAttribute("subject",sss.FindSubjectNameById(subjectId));
	  request.setAttribute("videoId", videoId);
	  return "forward:/WEB-INF/front/video/index.jsp";
  }
	
  @RequestMapping("/front/video/videoData.do")
  public String videoContent(Integer videoId,HttpServletRequest request){
	 Video video=vs.findVideoById(videoId);
	 Speaker speaker=ss.findSpeakerByVideoId(videoId);
	 Course course=cs.findCourseByVideoId(videoId);
	 
	 System.out.println(video);
	 System.out.println(speaker);
	 System.out.println(course);
	 List<Video> videoList=vs.findAllVideoByCourseId(speaker.getId());
	 for(Video v:videoList){
		 v.setVideoLengthStr(v.getVideoLength());
	 }
	 System.out.println(videoList);
	 request.setAttribute("video", video);
	  request.setAttribute("speaker",speaker);
	  request.setAttribute("course", course);
	  request.setAttribute("videoList", videoList);
	  return "forward:/WEB-INF/front/video/content.jsp";
  }
  
      @RequestMapping("/front/video/state.do")
      public void hitCount(Integer videoId){
    	 Video video=vs.findVideoById(videoId);
    	 video.setVideoPlayTimes(video.getVideoPlayTimes()+1);
    	 vs.updateVideo(video);
     }
  
	
	
}

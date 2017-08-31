package com.zhiyou.video.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou.video.model.Speaker;
import com.zhiyou.video.service.SpeakerService;
import com.zhiyou.video.utils.Page;

@Controller
public class speakerController {
	
	@Autowired
	SpeakerService ss;
	
	@RequestMapping("/admin/speaker/speakerList")
	public String speakerList(HttpServletRequest request,@RequestParam(defaultValue="")String speakerName,@RequestParam(defaultValue="")String speakerJob,@RequestParam(defaultValue="1")Integer page){
		
		Page<Speaker> pageInfo=ss.findAllSpeaker(speakerName,speakerJob,page); 
		request.setAttribute("page", pageInfo);
		request.setAttribute("speakerName", speakerName);
		request.setAttribute("speakerJob", speakerJob);		
		return "/admin/speaker/speakerList";
	}
	
	@RequestMapping(value="/admin/speaker/addSpeaker.action",method=RequestMethod.GET)
	public String addSpeakerPage(){				
		return "forward:/WEB-INF/admin/speaker/addSpeaker.jsp";
	}
	
	@RequestMapping(value="/admin/speaker/addSpeaker.action",method=RequestMethod.POST)
	public String addSpeaker(Speaker speaker){	
		ss.addSpeaker(speaker);
		return "redirect:/admin/speaker/speakerList.action";
	}
	
	
	@RequestMapping(value="/admin/speaker/editSpeaker.action",method=RequestMethod.GET)
	public String editSpeakerPage(HttpServletRequest request,@RequestParam("upid")Integer id){
		Speaker speaker=ss.findSpeakerById(id);
		request.setAttribute("speaker",speaker);
		return "forward:/WEB-INF/admin/speaker/editSpeaker.jsp";
	}
	
	@RequestMapping(value="/admin/speaker/editSpeaker.action",method=RequestMethod.POST)
	public String editSpeaker(Speaker speaker){	
		ss.updateSpeaker(speaker);
		return "redirect:/admin/speaker/speakerList.action";
	}
	
	@RequestMapping(value="/admin/speaker/deleteSpeaker.action")
	public String deleteSpeaker(@RequestParam("delid")Integer id){	
		ss.deleteSpeaker(id);
		return "redirect:/admin/speaker/speakerList.action";
	}

}

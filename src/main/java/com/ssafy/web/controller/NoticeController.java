package com.ssafy.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.Notice;
import com.ssafy.web.service.NoticeService;
import com.ssafy.web.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService ser;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "notice/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Notice notice, Model model, HttpSession session) {
		Member member =  (Member) session.getAttribute("member");
		if(member != null) {
			System.out.println("로그인은 되어있음");
			notice.setUserid(member.getUserid());
			try {
				ser.write(notice);
				
				return "notice/success";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "글작성중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "5");//sizePerPage
		try {
			List<Notice> list = ser.list(map);
			PageNavigation pageNavigation = ser.makePageNavigation(map);
			model.addAttribute("notices", list);
			model.addAttribute("navigation", pageNavigation);
			
			return "notice/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("articleno") int articleno, Model model) {
		try {
			Notice notice = ser.get(articleno);
			model.addAttribute("notice", notice);
			return "notice/modify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Notice notice, Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if(member != null) {
			notice.setUserid(member.getUserid());
			try {
				ser.modify(notice);
				return "notice/detail?articleno="+notice.getArticleno();
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("articleno") int articleno, Model model) {
		try {
			ser.delete(articleno);
			return "redirect:list?pg=1&key=&word=";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("articleno") int articleno, Model model) {
		try {
			Notice notice = ser.get(articleno);
			model.addAttribute("notice", notice);
			return "notice/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
}

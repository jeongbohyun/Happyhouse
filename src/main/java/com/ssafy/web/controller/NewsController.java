package com.ssafy.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.web.dto.News;
import com.ssafy.web.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	NewsService ser;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<News> list=ser.getContent("http://www.renews.co.kr/rss/allArticle.xml");
		model.addAttribute("list", list);
		
		return "news/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		try {
			ArrayList<News> list=ser.getContent("http://www.renews.co.kr/rss/allArticle.xml");
			System.out.println(list.get(no-1));
			model.addAttribute("news", list.get(no-1));
			
			return "news/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
}

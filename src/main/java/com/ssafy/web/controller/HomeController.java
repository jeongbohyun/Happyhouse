package com.ssafy.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.News;
import com.ssafy.web.service.HouseMapService;
import com.ssafy.web.service.NewsService;


@Controller
public class HomeController {
	
	@Autowired
	NewsService ser;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<News> list=ser.getContent("http://www.renews.co.kr/rss/allArticle.xml");
		model.addAttribute("one", list.get(0));
		model.addAttribute("two", list.get(1));
		model.addAttribute("three", list.get(2));
		model.addAttribute("four", list.get(3));
		
		return "index";
	}
	
	@RequestMapping(value = "/dong", method = RequestMethod.GET)
	public String map(Model model) {
		
		return "searchasdong";
	}
	
	@RequestMapping(value = "/aptt", method = RequestMethod.GET)
	public String apt(Model model) {
		
		return "searchAsApt";
	}
	
	@RequestMapping(value = "/inter", method = RequestMethod.GET)
	public String inter(Model model) {
		
		return "searchinter";
	}
	
	@RequestMapping(value = "/reco", method = RequestMethod.GET)
	public String reco(Model model) {
		
		return "reco";
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String store(Model model) {
		
		return "store";
	}
	
	
}

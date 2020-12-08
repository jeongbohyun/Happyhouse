package com.ssafy.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.Recojuso;
import com.ssafy.web.dto.SidoGugunCode;
import com.ssafy.web.service.HouseMapService;

@Controller
@RequestMapping("/reco")
public class RecoController {
	private static final Logger logger = LoggerFactory.getLogger(MapController3.class);
	
	@Autowired
	HouseMapService service;
	
	@GetMapping(value = "/sido")
	public @ResponseBody List<SidoGugunCode> sido() {
		logger.info("/sido 입니다");
		List<SidoGugunCode> list = null;
		try {
			list= service.getSido();
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}

	@GetMapping(value = "/gugun")
	public @ResponseBody List<SidoGugunCode> gugun(@RequestParam("sido") String sido) {
		logger.info("/gugun 입니다");
		List<SidoGugunCode> list = null;
		try {
			list= service.getGugunInSido(sido);
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}

	@GetMapping(value = "/list")
	public @ResponseBody List<Recojuso> apt(HttpSession session,
			@RequestParam("sido") String sido,
			@RequestParam("gugun") String gugun) {
		
		logger.info("/list 입니다");
		
		List<Recojuso> donglist = null;
		
		try {
			
			Member m = (Member) session.getAttribute("member");
			if(sido.equals("0")) {				
				donglist = service.getSiGunDong(m);
				System.out.println(sido+" "+gugun);
			}
			else if(gugun.equals("0")) {
				sido = service.getSido3(sido);
				donglist = service.getSiGunDong2(m,sido);
				System.out.println(sido+" "+gugun);
			}
			else {
				sido = service.getSido3(sido);
				gugun = service.getGugun2(gugun);
				donglist = service.getSiGunDong3(m,sido,gugun);
				System.out.println(sido+" "+gugun);
			}
			
			for (int i = 0; i < donglist.size(); i++) {
				System.out.println(donglist.get(i));
			}
			
			
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		
		return donglist;
	}
	
}

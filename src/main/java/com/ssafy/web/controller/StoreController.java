package com.ssafy.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.SidoGugunCode;
import com.ssafy.web.dto.Store;
import com.ssafy.web.repository.StoreService;
import com.ssafy.web.service.HouseMapService;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	StoreService ser;
	
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

	@GetMapping(value = "/dongg")
	public @ResponseBody List<HouseInfo> dong(@RequestParam("gugun") String gugun) {
		logger.info("/dongg 입니다");
		List<HouseInfo> list = null;
		try {
			list= service.getDongInGugun(gugun);
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}
	
	@GetMapping(value = "/list")
	public @ResponseBody List<Store> store( @RequestParam("sido") String sido,
											@RequestParam("gugun") String gugun,
											@RequestParam("dong") String dong,
											@RequestParam("store") String store) {
			
		List<Store> list = null;
		Map<String,String> map = new HashMap<>();
		try {
			sido = service.getSido3(sido);
			gugun = service.getGugun2(gugun);
			System.out.println(sido+" "+gugun+" "+dong+" "+store);
			if(dong.equals("1")) {
				map.put("sido", sido);
				map.put("gugun", gugun);
				list= ser.storeGet2(map);
			}
			else {
				map.put("sido", sido);
				map.put("gugun", gugun);
				map.put("dong", dong);
				list= ser.storeGet(map);
			}
			
			if(!store.equals("0")) {
				List<Store> list2 = find(list, store);
				return list2;
			}
			
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}

	private List<Store> find(List<Store> list, String store) {
		
		List<Store> list2 = new ArrayList<Store>();
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getType2().equals(store)) {
				list2.add(list.get(i));
			}
		}
		
		return list2;
	}
	
	
	
}

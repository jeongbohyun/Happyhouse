package com.ssafy.web.controller;

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

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.service.HouseMapService;

@Controller
@RequestMapping(value = "/aptt")
public class MapController2 {
	private static final Logger logger = LoggerFactory.getLogger(MapController2.class);

	@Autowired
	HouseMapService service;

	@GetMapping(value = "/name")
	public @ResponseBody List<HouseInfo> name(@RequestParam("aptName") String aptName,
			@RequestParam("apt") boolean apt,
			@RequestParam("house") boolean house,
			@RequestParam("a") boolean a,
			@RequestParam("b") boolean b,
			@RequestParam("c") boolean c
			) {
		logger.info("/name 입니다");

		List<HouseInfo> list = null;
		if(!apt&&!house) return null;
		if(!a&&!b&&!c) return null;
		
		try {
			list= service.getAptInName(aptName);
			if(!apt) list = remove_apt(list,true);
			if(!house) list = remove_apt(list,false);
			if(!a) list = remove_deal(list,true);
			if(!b) list = remove_deal2(list,false);
			if(!c) list = remove_deal3(list,true);
			
			for (int i = 0; i <list.size(); i++) {
				String code= list.get(i).getCode();
				list.get(i).setSi(service.getSido2(code));
				System.out.println(list.get(i));
			}
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}



	private List<HouseInfo> remove_deal3(List<HouseInfo> list, boolean b) {
		while(true) {
			boolean flag = false;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).isDealType2()==b) {
					flag = true;
					list.remove(i);
					break;
				}
			}
			if(!flag) break;
		}
		return list;
	}



	private List<HouseInfo> remove_deal(List<HouseInfo> list, boolean b) {
		while(true) {
			boolean flag = false;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).isDealType()==b) {
					flag = true;
					list.remove(i);
					break;
				}
			}
			if(!flag) break;
		}
		return list;
	}

	private List<HouseInfo> remove_deal2(List<HouseInfo> list, boolean b) {
		while(true) {
			boolean flag = false;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).isDealType()==b&&list.get(i).isDealType2()==b) {					
					flag = true;
					list.remove(i);
					break;					
				}
			}
			if(!flag) break;
		}
		return list;
	}



	private List<HouseInfo> remove_apt(List<HouseInfo> list, boolean b) {
		while(true) {
			boolean flag = false;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).isAptType()==b) {
					flag = true;
					list.remove(i);
					break;
				}
			}
			if(!flag) break;
		}
		return list;
	}


	@GetMapping(value = "/detail")
	public @ResponseBody List<HouseDeal> detail(@RequestParam("no") String no){
		logger.info("/detail 입니다");
		List<HouseDeal> list = null;
		try {

			Map<String,String> map = new HashMap<>();
			map.put("no", no);

			list= service.getDealDetail(map);

			for (int i = 0; i <list.size(); i++) {
				String code= list.get(i).getCode();
				list.get(i).setSi(service.getSido2(code));
				System.out.println(list.get(i));
			}

		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}
	
}

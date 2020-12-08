package com.ssafy.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Store;
import com.ssafy.web.repository.StoreService;
import com.ssafy.web.service.HouseMapService;

@Controller
@RequestMapping(value = "/detail")
public class DetailController {
	@Autowired
	HouseMapService ser;
	@Autowired
	StoreService ser2;
	
	@GetMapping(value = "/store")
	public @ResponseBody List<Store> store(@RequestParam("sido") String sido,
											@RequestParam("gugun") String gugun,
											@RequestParam("dong") String dong) {
		System.out.println(sido+" "+gugun+" "+dong);
		List<Store> list = null;
		Map<String,String> map = new HashMap<>();
		map.put("sido",sido);
		map.put("gugun",gugun);
		map.put("dong",dong);
		try {
			list= ser2.storeGet(map);
		}		
		catch (Exception e) {			
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping(value = "/detailinfo", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("inputno") String inputno, ModelAndView mv) {
		System.out.println(inputno);
		
		try {	
			HouseInfo info = ser.getAptDetail(inputno);
			info.setSi(ser.getSido2(info.getCode()));
			
			
			Map<String,String> map = new HashMap<>();
			map.put("no", inputno);
			List<HouseDeal> list = ser.getDealDetail(map);		
			List<String> labels = new ArrayList<String>();
			List<Integer> data = new ArrayList<Integer>();
			
			for (int i = 0; i <list.size(); i++) {
				
				//날짜 라벨 생성
				//String year= Integer.toString(list.get(i).getDealYear());
				String month = Integer.toString(list.get(i).getDealMonth());
				String day = Integer.toString(list.get(i).getDealDay());			
				String s = month+'.'+day;
				System.out.println(s);
				labels.add(s);
				
				//데이터 생성
				data.add(list.get(i).getDealAmount());
			
				System.out.println(list.get(i));
			}
			
			
						
			mv.addObject("info", info);
			mv.addObject("deal", list);
			
			Collections.reverse(labels);
			Collections.reverse(data);
			
			mv.addObject("labels",labels);
			mv.addObject("data",data);
			
			
			mv.setViewName("detail");
		}

		catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "문제가 발생했습니다.");
			mv.setViewName("/error/error");        
		}
		
		return mv;
	}
}

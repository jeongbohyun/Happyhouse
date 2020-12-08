package com.ssafy.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.SidoGugunCode;
import com.ssafy.web.service.HouseMapService;

@Controller
@RequestMapping(value = "/inter")
public class MapController3 {
	private static final Logger logger = LoggerFactory.getLogger(MapController3.class);

	@Autowired
	HouseMapService service;

	@GetMapping(value = "/list")
	public @ResponseBody List<HouseInfo> apt(HttpSession session,
			@RequestParam("apt") boolean apt,
			@RequestParam("house") boolean house,
			@RequestParam("a") boolean a,
			@RequestParam("b") boolean b,
			@RequestParam("c") boolean c) {
		logger.info("/list 입니다");
		List<HouseInfo> list = null;
		try {
			
			Member m = (Member) session.getAttribute("member");
			System.out.println(m.getUserid());
			
			list= service.getinter(m.getUserid());
			if(!apt&&!house) return null;
			if(!a&&!b&&!c) return null;
			
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
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(@RequestParam("inputno") int no, Model model) {
		try {
			service.delete(no);
			model.addAttribute("msg", "삭제되었습니다.");
			return "searchinter";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
}

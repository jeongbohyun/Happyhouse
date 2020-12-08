package com.ssafy.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.Recojuso;
import com.ssafy.web.dto.SidoGugunCode;
import com.ssafy.web.repository.HouseMapRepository;

@Service
public class HouseMapServiceImpl implements HouseMapService{
	
	@Autowired
	HouseMapRepository repo;
	
	@Override
	public List<SidoGugunCode> getSido() throws Exception {		
		return repo.getSido();
	}

	@Override
	public List<SidoGugunCode> getGugunInSido(String sido) throws Exception {
		return repo.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfo> getDongInGugun(String gugun) throws Exception {
		return repo.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfo> getAptInDong(String code, String dong) throws Exception {
		return repo.getAptInDong(code,dong);
	}

	@Override
	public List<HouseInfo> getAptInName(String aptName) throws Exception {
		return repo.getAptInName(aptName);
	}

	@Override
	public HouseInfo getAptDetail(String no) throws Exception {
		return repo.getAptDetail(no);
	}

	@Override
	public List<HouseDeal> getDealDetail(Map<String, String> map) throws Exception {
	
		return repo.getDealDetail(map);
	}

	

	@Override
	public void add(String no, String id) throws Exception {
		repo.add(no, id);
	}

	@Override
	public List<HouseInfo> getinter(String userid) throws Exception {
		
		return repo.getinter(userid);
	}

	@Override
	public void delete(int no) throws Exception {
		repo.delete(no);
	}


	@Override
	public String getGugun2(String gugun) throws Exception {
		return repo.getGugun2(gugun);
	}

	@Override
	public String getSido2(String code) throws Exception {
		
		return repo.getSido2(code);
	}
	
	@Override
	public String getSido3(String code) throws Exception {
		
		return repo.getSido3(code);
	}
	
	@Override
	public List<Recojuso> getSiGunDong(Member m) throws Exception {
		
		return repo.getSiGunDong(m);
	}

	@Override
	public List<Recojuso> getSiGunDong2(Member m, String sido) throws Exception {
		
		return repo.getSiGunDong2(m, sido);
	}

	@Override
	public List<Recojuso> getSiGunDong3(Member m, String sido, String gugun) throws Exception {
		
		return repo.getSiGunDong3(m, sido, gugun);
	}

}

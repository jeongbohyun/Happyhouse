package com.ssafy.web.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.Recojuso;
import com.ssafy.web.dto.SidoGugunCode;

public interface HouseMapRepository {

	List<SidoGugunCode> getSido() throws Exception;

	List<SidoGugunCode> getGugunInSido(String sido) throws Exception;

	List<HouseInfo> getDongInGugun(String gugun) throws Exception;
	
	List<HouseInfo> getAptInDong(String code, String dong) throws Exception;
	

	List<HouseInfo> getAptInName(String aptName) throws Exception;
	
	int getTotalCount(String dong) throws Exception;
	
	
	HouseInfo getAptDetail(String no) throws Exception;
	
	List<HouseDeal> getDealDetail(Map<String, String> map) throws Exception;
	

	void add(String no, String id) throws Exception;

	List<HouseInfo> getinter(String userid) throws Exception;

	void delete(int no) throws Exception;

	

	String getGugun2(String gugun) throws Exception;
	
	String getSido2(String code) throws Exception;
	
	String getSido3(String code) throws Exception;
	
	
	List<Recojuso> getSiGunDong(Member m) throws Exception;

	List<Recojuso> getSiGunDong2(Member m, String sido) throws Exception;

	List<Recojuso> getSiGunDong3(Member m, String sido, String gugun) throws Exception;

}

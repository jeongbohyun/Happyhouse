package com.ssafy.web.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.web.dto.HouseDeal;
import com.ssafy.web.dto.HouseInfo;
import com.ssafy.web.dto.Member;
import com.ssafy.web.dto.Recojuso;
import com.ssafy.web.dto.SidoGugunCode;

@Repository
public class HouseMapRepositoryImpl implements HouseMapRepository {
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<SidoGugunCode> getSido() throws Exception {
		return session.selectList("ssafy.housemap.getsido");
	}

	@Override
	public List<SidoGugunCode> getGugunInSido(String sido) throws Exception {
		return session.selectList("ssafy.housemap.getguguninsido", sido);
	}

	@Override
	public List<HouseInfo> getDongInGugun(String gugun) throws Exception {
		return session.selectList("ssafy.housemap.getdongingugun", gugun);
	}

	@Override
	public List<HouseInfo> getAptInDong(String code, String dong) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("dong", dong);
		return session.selectList("ssafy.housemap.getaptindong", map);
	}

	@Override
	public List<HouseInfo> getAptInName(String aptName) throws Exception {
		aptName = aptName+"%";
		return session.selectList("ssafy.housemap.getaptinname", aptName);
	}

	@Override
	public int getTotalCount(String dong) throws Exception {
		return session.selectOne("ssafy.housemap.gettotalcount", dong);
	}

	@Override
	public HouseInfo getAptDetail(String no) throws Exception {
		return session.selectOne("ssafy.housemap.getaptdetail", no);
	}

	@Override
	public List<HouseDeal> getDealDetail(Map<String, String> map) throws Exception {
		
		return session.selectList("ssafy.housemap.getdealdetail", map);
	}


	@Override
	public void add(String no, String id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("no", no);
		session.insert("ssafy.housemap.insert", map);
	}

	@Override
	public List<HouseInfo> getinter(String userid) throws Exception {
		
		return session.selectList("ssafy.housemap.getinter", userid);
	}

	@Override
	public void delete(int no) throws Exception {
		
		session.delete("ssafy.housemap.delete", no);
		
	}

	

	@Override
	public String getGugun2(String code) throws Exception {
		
		return session.selectOne("ssafy.housemap.getgugun2", code);
	}
	
	@Override
	public String getSido2(String code) throws Exception {
		 
		return session.selectOne("ssafy.housemap.getsido2", code);
	}
	
	@Override
	public String getSido3(String code) throws Exception {
		 
		return session.selectOne("ssafy.housemap.getsido3", code);
	}
	
	@Override
	public List<Recojuso> getSiGunDong(Member m) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();	
		map.put("school",Integer.toString(m.getHakgun()));
		map.put("cafe",Integer.toString(m.getCafe()));
		map.put("hospital",Integer.toString(m.getHospital()));
		map.put("movie",Integer.toString(m.getTheater()));
		map.put("mart",Integer.toString(m.getDepart()));
		map.put("fast",Integer.toString(m.getMac()));
		map.put("subway",Integer.toString(m.getSubway()));
		
		return session.selectList("ssafy.housemap.recodong", map);
	}

	@Override
	public List<Recojuso> getSiGunDong2(Member m, String sido) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();		
		map.put("school",Integer.toString(m.getHakgun()));
		map.put("cafe",Integer.toString(m.getCafe()));
		map.put("hospital",Integer.toString(m.getHospital()));
		map.put("movie",Integer.toString(m.getTheater()));
		map.put("mart",Integer.toString(m.getDepart()));
		map.put("fast",Integer.toString(m.getMac()));
		map.put("subway",Integer.toString(m.getSubway()));
		map.put("sido",sido);
		
		return session.selectList("ssafy.housemap.recodong2", map);
	}

	@Override
	public List<Recojuso> getSiGunDong3(Member m, String sido, String gugun) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();		
		map.put("school",Integer.toString(m.getHakgun()));
		map.put("cafe",Integer.toString(m.getCafe()));
		map.put("hospital",Integer.toString(m.getHospital()));
		map.put("movie",Integer.toString(m.getTheater()));
		map.put("mart",Integer.toString(m.getDepart()));
		map.put("fast",Integer.toString(m.getMac()));
		map.put("subway",Integer.toString(m.getSubway()));
		map.put("sido",sido);
		map.put("gugun",gugun);
		
		return session.selectList("ssafy.housemap.recodong3", map);
	}
}

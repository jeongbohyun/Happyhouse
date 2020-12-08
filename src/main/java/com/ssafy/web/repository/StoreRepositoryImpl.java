package com.ssafy.web.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.web.dto.Store;

@Repository
public class StoreRepositoryImpl implements StoreRepository{
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Store> storeGet(Map<String, String> map) throws Exception {
		
		List<Store> list = session.selectList("ssafy.store.storeget", map);
		
		return list;
	}

	@Override
	public List<Store> storeGet2(Map<String, String> map) throws Exception {
		List<Store> list = session.selectList("ssafy.store.storeget2", map);
		
		return list;
	}

}

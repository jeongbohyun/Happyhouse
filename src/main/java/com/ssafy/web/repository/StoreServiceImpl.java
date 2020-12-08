package com.ssafy.web.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.web.dto.Store;

@Repository
public class StoreServiceImpl implements StoreService{
	@Autowired
	StoreRepository repo;

	@Override
	public List<Store> storeGet(Map<String, String> map) throws Exception {
		
		return repo.storeGet(map);
	}

	@Override
	public List<Store> storeGet2(Map<String, String> map) throws Exception {
		
		return repo.storeGet2(map);
	}
	
	
}

package com.ssafy.web.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.Store;

public interface StoreService {
	public List<Store> storeGet(Map<String, String> map) throws Exception;

	public List<Store> storeGet2(Map<String, String> map) throws Exception;
}

package com.ssafy.web.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.Notice;

public interface NoticeRepository {
	public void write(Notice notice) throws Exception;
	public List<Notice> list(Map<String, Object> map) throws Exception;
	public int getTotalCount(Map<String, String> map) throws Exception;
	
	public Notice get(int articleno) throws Exception;
	public void modify(Notice notice) throws Exception;
	public void delete(int articleno) throws Exception;
}

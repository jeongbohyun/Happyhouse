package com.ssafy.web.service;

import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.Notice;
import com.ssafy.web.util.PageNavigation;

public interface NoticeService {
	public void write(Notice notice) throws Exception;
	public List<Notice> list(Map<String, String> map) throws Exception;
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	
	public Notice get(int articleno) throws Exception;
	public void modify(Notice notice) throws Exception;
	public void delete(int articleno) throws Exception;
}

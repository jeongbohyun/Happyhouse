package com.ssafy.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.Notice;
import com.ssafy.web.repository.NoticeRepository;
import com.ssafy.web.util.PageNavigation;

@Service
public class NoticeServieImpl implements NoticeService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(Notice notice) throws Exception {
		if(notice.getSubject() == null || notice.getContent() == null) {
			throw new Exception();
		}
		
		sqlSession.getMapper(NoticeRepository.class).write(notice);
	}

	@Override
	public List<Notice> list(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		System.out.println(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		return sqlSession.getMapper(NoticeRepository.class).list(param);
	}
	
	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(NoticeRepository.class).getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	
	@Override
	public Notice get(int articleno) throws Exception {
		return sqlSession.getMapper(NoticeRepository.class).get(articleno);
	}

	@Override
	public void modify(Notice notice) throws Exception {
		sqlSession.getMapper(NoticeRepository.class).modify(notice);
	}

	@Override
	public void delete(int articleno) throws Exception {
		sqlSession.getMapper(NoticeRepository.class).delete(articleno);
	}	
}

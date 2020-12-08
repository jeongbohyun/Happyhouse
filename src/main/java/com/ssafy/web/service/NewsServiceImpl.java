package com.ssafy.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.News;
import com.ssafy.web.repository.NewsRepository;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	NewsRepository repo;
	
	@Override
	public ArrayList<News> getContent(String url) {
		return repo.getContent(url);
	}

}

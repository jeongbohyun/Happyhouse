package com.ssafy.web.service;

import java.util.ArrayList;

import com.ssafy.web.dto.News;

public interface NewsService {
	ArrayList<News> getContent(String url);
}

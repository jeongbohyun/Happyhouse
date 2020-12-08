package com.ssafy.web.repository;

import java.util.ArrayList;

import com.ssafy.web.dto.News;

public interface NewsRepository {
	ArrayList<News> getContent(String url);
}

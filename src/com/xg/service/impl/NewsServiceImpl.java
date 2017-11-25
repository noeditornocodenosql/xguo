package com.xg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xg.mapper.NewsMapper;
import com.xg.model.News;
import com.xg.model.Page;
import com.xg.service.NewsService;

@Transactional
@Service
public class NewsServiceImpl implements NewsService {
	
	@Resource
	private NewsMapper newsMapper;

	@Override
	public long getAllNewsCount() {
		return newsMapper.getAllNewsCount();
	}

	@Override
	public List<News> getAllNews(Page page) {
		return newsMapper.getAllNews(page);
	}

	@Override
	public News findNewsByNid(Integer nId) {
		return newsMapper.findNewsByNid(nId);
	}

	@Override
	public void saveNews(News news) {
		newsMapper.saveNews(news);
		
	}

	@Override
	public void updateNewsByNid(News news) {
		newsMapper.updateNewsByNid(news);
		
	}

	@Override
	public void deleteNewsByNid(Integer nId) {
		newsMapper.deleteNewsByNid(nId);
		
	}

	@Override
	public List<News> getNewsByChildType(Integer nChildType, Integer startPos,Integer pageSize) {
		return newsMapper.getNewsByChildType(nChildType,startPos,pageSize);
	}

	@Override
	public long getChildNewsCount(Integer nChildType) {
		return newsMapper.getChildNewsCount(nChildType);
	}

	@Override
	public List<News> getAllNewsWithNoPage() {
		return newsMapper.getAllNewsWithNoPage();
	}

	@Override
	public News getNextNewsByChildType(Integer nChildType, Integer startPos,
			Integer pageSize) {
		return newsMapper.getNextNewsByChildType(nChildType, startPos, pageSize);
	}

}

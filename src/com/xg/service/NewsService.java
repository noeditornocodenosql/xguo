package com.xg.service;

import java.util.List;
import com.xg.model.News;
import com.xg.model.Page;

public interface NewsService {
	public long getAllNewsCount();
	public List< News> getAllNews(Page page);
	public News findNewsByNid(Integer nId);
	public void saveNews(News news);
	public void updateNewsByNid(News news);
	public void deleteNewsByNid(Integer nId);
	public long getChildNewsCount(Integer nChildType);
	public List<News>getNewsByChildType(Integer nChildType, Integer startPos,Integer pageSize);
	public List<News> getAllNewsWithNoPage();
	public News getNextNewsByChildType(Integer nChildType, Integer startPos,Integer pageSize); //动态详细页里的PREV&NEXT,返回一页
}

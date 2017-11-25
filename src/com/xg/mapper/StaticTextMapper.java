package com.xg.mapper;

import com.xg.model.StaticText;


public interface StaticTextMapper {
	public StaticText findStaticText();
	public StaticText findStaticTextById(Integer id);
	public void updateStaticTextById(StaticText staticText);
}

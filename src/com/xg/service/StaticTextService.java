package com.xg.service;

import com.xg.model.StaticText;

public interface StaticTextService {
	public StaticText findStaticText();
	public StaticText findStaticTextById(Integer id);
	public void updateStaticTextById(StaticText staticText);
}

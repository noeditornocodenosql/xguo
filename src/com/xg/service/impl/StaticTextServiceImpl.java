package com.xg.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xg.mapper.StaticTextMapper;
import com.xg.model.StaticText;
import com.xg.service.StaticTextService;

@Transactional
@Service
public class StaticTextServiceImpl implements StaticTextService {
	@Resource
	private StaticTextMapper staticTextMapper;
	
	@Override
	public StaticText findStaticText() {
		return staticTextMapper.findStaticText();
	}

	@Override
	public StaticText findStaticTextById(Integer id) {
		return staticTextMapper.findStaticTextById(id);
	}

	@Override
	public void updateStaticTextById(StaticText staticText) {
		staticTextMapper.updateStaticTextById(staticText);

	}

}

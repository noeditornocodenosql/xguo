package com.xg.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xg.mapper.ConstantMapper;
import com.xg.model.Constant;
import com.xg.service.ConstantService;

@Transactional
@Service
public class ConstantServiceImpl implements ConstantService {

	@Resource
	private ConstantMapper constantMapper;

	@Override
	public Constant findAllConstants(){
		return constantMapper.findAllConstants();
	}

	@Override
	public void updateConstantByCid(Constant constant) {
		constantMapper.updateConstantByCid(constant);
		
	}

	@Override
	public Constant findConstantByCid(int cId) {
		return constantMapper.findConstantByCid(cId);
	}

}

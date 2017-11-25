package com.xg.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xg.mapper.DynamicCirculateMapper;
import com.xg.model.DynamicCirculate;
import com.xg.model.Page;
import com.xg.service.DynamicCirculateService;

@Transactional
@Service
public class DynamicCirculateServiceImpl implements DynamicCirculateService {

	@Resource
	private DynamicCirculateMapper dynamicCirculateMapper;
	
	@Override
	public List<DynamicCirculate> findAllDynamicCirculates() {
		return dynamicCirculateMapper.findAllDynamicCirculates();
	}

	@Override
	public Integer getAllDynamicCirculateCount() {
		return dynamicCirculateMapper.getAllDynamicCirculateCount();
	}

	@Override
	public List<DynamicCirculate> getAllDynamicCirculate(Page page) {
		return dynamicCirculateMapper.getAllDynamicCirculate(page);
	}

	@Override
	public DynamicCirculate findDynamicCirculateByDid(Integer dId) {
		return dynamicCirculateMapper.findDynamicCirculateByDid(dId);
	}

	@Override
	public void saveDynamicCirculate(DynamicCirculate dynamicCirculate) {
		dynamicCirculateMapper.saveDynamicCirculate(dynamicCirculate);
		
	}

	@Override
	public void updateDynamicCirculateByDid(DynamicCirculate dynamicCirculate) {
		dynamicCirculateMapper.updateDynamicCirculateByDid(dynamicCirculate);
		
	}

	@Override
	public void deleteDynamicCirculateByDid(Integer dId) {
		dynamicCirculateMapper.deleteDynamicCirculateByDid(dId);
		
	}

}

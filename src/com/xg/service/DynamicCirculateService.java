package com.xg.service;

import java.util.List;

import com.xg.model.DynamicCirculate;
import com.xg.model.Page;

public interface DynamicCirculateService {
	public List<DynamicCirculate>findAllDynamicCirculates();
	public Integer getAllDynamicCirculateCount();
	public List< DynamicCirculate> getAllDynamicCirculate(Page page);
	public DynamicCirculate findDynamicCirculateByDid(Integer dId);
	public void saveDynamicCirculate(DynamicCirculate dynamicCirculate);
	public void updateDynamicCirculateByDid(DynamicCirculate dynamicCirculate);
	public void deleteDynamicCirculateByDid(Integer dId);
}

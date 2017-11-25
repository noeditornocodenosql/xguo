package com.xg.service;

import java.util.List;
import com.xg.model.Example;
import com.xg.model.Page;

public interface ExampleService {
	public long getAllExamplesCount();
	public List< Example> getAllExamples(Page page);
	public Example findExampleByEid(Integer eId);
	public void saveExample(Example example);
	public void updateExampleByEid(Example example);
	public void deleteExampleByEid(Integer eId);
	public List<Example> getExamplesWithNoPage();
	public long getChildExampleCount(Integer eChildType); 
	public List<Example>getExampleByChildType(Integer eChildType, Integer startPos,Integer pageSize);
	public Example getNextExampleByChildType(Integer eChildType, Integer startPos,Integer pageSize); //案例详细页里的PREV&NEXT,返回一页
}

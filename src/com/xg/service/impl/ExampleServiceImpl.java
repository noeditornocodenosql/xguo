package com.xg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xg.mapper.ExampleMapper;
import com.xg.model.Example;
import com.xg.model.Page;
import com.xg.service.ExampleService;

@Transactional
@Service
public class ExampleServiceImpl implements ExampleService{

	@Resource
	private ExampleMapper exampleMapper;
	@Override
	public long getAllExamplesCount() {
		return exampleMapper.getAllExamplesCount();
	}

	@Override
	public List<Example> getAllExamples(Page page) {
		return exampleMapper.getAllExamples(page);
	}

	@Override
	public Example findExampleByEid(Integer eId) {
		return exampleMapper.findExampleByEid(eId);
	}

	@Override
	public void saveExample(Example example) {
		exampleMapper.saveExample(example);
		
	}

	@Override
	public void updateExampleByEid(Example example) {
		exampleMapper.updateExampleByEid(example);
		
	}

	@Override
	public void deleteExampleByEid(Integer eId) {
		exampleMapper.deleteExampleByEid(eId);
		
	}

	@Override
	public List<Example> getExamplesWithNoPage() {
		return exampleMapper.getExamplesWithNoPage();
	}

	@Override
	public long getChildExampleCount(Integer eChildType) {
		return exampleMapper.getChildExampleCount(eChildType);
	}

	@Override
	public List<Example> getExampleByChildType(Integer eChildType,
			Integer startPos, Integer pageSize) {
		return exampleMapper.getExampleByChildType(eChildType, startPos, pageSize);
	}

	@Override
	public Example getNextExampleByChildType(Integer eChildType,
			Integer startPos, Integer pageSize) {
		return exampleMapper.getNextExampleByChildType(eChildType, startPos, pageSize);
	}

}

package com.xg.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xg.mapper.CategoryMapper;
import com.xg.model.Category;
import com.xg.service.CategoryService;

@Transactional
@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Resource
	private CategoryMapper categoryMapper;
	@Override
	public List<Category> findAllCategorys() {
		return categoryMapper.findAllCategorys();
	}

	@Override
	public void saveCategory(Category category) {
		categoryMapper.saveCategory(category);
		
	}

	@Override
	public Category findCategoryByCid(Integer cId) {
		return categoryMapper.findCategoryByCid(cId);
	}

	@Override
	public void updateCategoryByCid(Category category) {
		categoryMapper.updateCategoryByCid(category);
		
	}

	@Override
	public void deleteCategoryByCid(Integer cId) {
		categoryMapper.deleteCategoryByCid(cId);
		
	}

}

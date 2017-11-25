package com.xg.service;

import java.util.List;
import com.xg.model.Category;

public interface CategoryService {
	public List<Category>findAllCategorys();
	public void saveCategory(Category category);
	public Category findCategoryByCid(Integer cId);
	public void updateCategoryByCid(Category category);
	public void deleteCategoryByCid(Integer cId);
}

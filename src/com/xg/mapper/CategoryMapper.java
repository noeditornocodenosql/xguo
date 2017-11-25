package com.xg.mapper;

import java.util.List;
import com.xg.model.Category;

public interface CategoryMapper {
	public List<Category>findAllCategorys();
	public void saveCategory(Category category);
	public Category findCategoryByCid(Integer cId);
	public void updateCategoryByCid(Category category);
	public void deleteCategoryByCid(Integer cId);
}

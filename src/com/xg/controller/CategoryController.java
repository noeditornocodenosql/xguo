package com.xg.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.xg.model.Category;
import com.xg.service.CategoryService;

@Controller
public class CategoryController {

	@Resource
	private CategoryService categoryService;
	
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	@RequestMapping(value="/getAllCategorys")
	public ModelAndView  getAllCategorys(){
		ModelAndView mav=new ModelAndView("index");
		List<Category> categoryList=categoryService.findAllCategorys();
		mav.addObject(categoryList);
		return mav;
	}
	
	@RequestMapping(value="/categorysOneLevel")
	public ModelAndView  findCategorysOneLevel(){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/menu_one_level");
		List<Category> categoryList=categoryService.findAllCategorys();
		mav.addObject(categoryList);
		return mav;
	}
	
	@RequestMapping(value="/saveCategorysOneLevel",method=RequestMethod.GET)
	public ModelAndView  saveCategorysOneLevel(){
		return new ModelAndView("WEB-INF/xg_admin/menu_one_save");
	}
	
	@RequestMapping(value="/saveCategorysOneLevel",method=RequestMethod.POST)
	public ModelAndView  saveCategorysOneLevel(Category category){
		categoryService.saveCategory(category);
		return new ModelAndView("redirect:/categorysOneLevel");
	}
	
	@RequestMapping(value="/updateCategorysOneLevel/{cId}",method=RequestMethod.GET)
	public ModelAndView  updateCategorysOneLevel(@PathVariable Integer cId){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/menu_one_update");
		Category category=categoryService.findCategoryByCid(cId);
		mav.addObject(category);
		return mav;
	}
	
	@RequestMapping(value="/updateCategorysOneLevel",method=RequestMethod.POST)
	public ModelAndView  updateCategorysOneLevel(Category category,RedirectAttributes attr){
		categoryService.updateCategoryByCid(category);
		message="修改成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/categorysOneLevel");
	}
	
	@RequestMapping(value="/deleteCategorysOneLevel/{cId}",method=RequestMethod.GET)
	public ModelAndView  deleteCategorysOneLevel(@PathVariable Integer cId){
		categoryService.deleteCategoryByCid(cId);
		return new ModelAndView("redirect:/categorysOneLevel");
	}
	
}

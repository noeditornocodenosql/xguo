package com.xg.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xg.model.Category;
import com.xg.model.Constant;
import com.xg.model.DynamicCirculate;
import com.xg.model.Example;
import com.xg.model.News;
import com.xg.model.Page;
import com.xg.model.StaticText;
import com.xg.model.Team;
import com.xg.service.CategoryService;
import com.xg.service.ConstantService;
import com.xg.service.DynamicCirculateService;
import com.xg.service.ExampleService;
import com.xg.service.NewsService;
import com.xg.service.StaticTextService;
import com.xg.service.TeamService;

/**
 * 初始化
 * @author Administrator
 *
 */

@Controller
public class InitializationController {
	
	@Resource
	private CategoryService categoryService;
	@Resource
	private ConstantService constantService;
	@Resource
	private ExampleService exampleService;
	@Resource
	private DynamicCirculateService dynamicCirculateService;
	@Resource
	private TeamService teamService;
	@Resource
	private NewsService newsService;
	@Resource
	private StaticTextService staticTextService;
	
	@RequestMapping(value="/initialization")
	public ModelAndView initialization(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("index");
		List<Category> categoryList=categoryService.findAllCategorys();
		Constant constant=constantService.findAllConstants();
		List<Example>exampleList=exampleService.getExamplesWithNoPage();
		List<DynamicCirculate> dynamicCirculateList=dynamicCirculateService.findAllDynamicCirculates();
		List<News> newsList=newsService.getAllNewsWithNoPage();
		Page page = new Page(3,1);
		List<Team> teamList=teamService.findAllTeam(page);
		StaticText  staticText= staticTextService.findStaticText();
		mav.addObject(categoryList);
		request.getSession().setAttribute("constant", constant);
		mav.addObject(exampleList);
		mav.addObject(dynamicCirculateList);
		mav.addObject(teamList);
		mav.addObject(newsList);
		request.getSession().setAttribute("staticText", staticText);
		return mav;
	}

}

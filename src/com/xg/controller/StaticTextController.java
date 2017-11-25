package com.xg.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.xg.model.StaticText;
import com.xg.service.StaticTextService;

@Controller
public class StaticTextController {
	@Resource
	private StaticTextService staticTextService;

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * backstage 查询所有静态文字
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/staticText", method = RequestMethod.GET)
	public ModelAndView findAllStaticText() {
		ModelAndView mav = new ModelAndView("WEB-INF/xg_admin/staticText_info");
		StaticText staticText =staticTextService.findStaticText();
		mav.addObject(staticText);
		return mav;
	}
	
	/**
	 * backstage 修改静态文字
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/updateStaticText", method = RequestMethod.POST)
	public ModelAndView updateStaticText(StaticText staticText,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("WEB-INF/xg_admin/staticText_info");
		staticTextService.updateStaticTextById(staticText);
		message="修改成功";
		request.setAttribute("message", message);
		return mav;
	}
}

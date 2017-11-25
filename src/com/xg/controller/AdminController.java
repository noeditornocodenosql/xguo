package com.xg.controller;

import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.xg.model.Admin;
import com.xg.model.Page;
import com.xg.service.AdminService;
import com.xg.util.Md5Utils;

@Controller
public class AdminController {
	 static Logger log4j = Logger.getLogger(AdminController.class.getClass());  
	@Resource
	private AdminService adminService;
	
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * 进入后台
	 * @return
	 */
	@RequestMapping(value="/wh_2884",method=RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/login2");
		return mav;
	}
	
	/**
	 * 登录验证
	 * @param admin
	 * @param attr
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.POST)
	public ModelAndView login(Admin admin,RedirectAttributes attr,HttpSession session){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/main");
		admin.setaPassword(Md5Utils.md5(admin.getaPassword()));
		Admin  currentAdmin=adminService.checkLogin(admin);
		if(currentAdmin != null){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentDate=df.format(new Date());
			currentAdmin.setaLastLogonTime(currentDate);
			adminService.updateAdminByAid(currentAdmin);
			session.setAttribute("currentAdmin", currentAdmin);
  		return mav;
		}else{
			log4j.info("登录失败:用户名?密码错误?用户未激活?");
			message="登录失败:用户名?密码错误?用户未激活?";
			 attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/wh_2884");
		}
	}
	
	@RequestMapping(value="/accountSettings/{pageNow}",method=RequestMethod.GET)
	public ModelAndView accountSettings(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/admin_info");
		List<Admin> adminList=null;
		Page page = null;
		int totalCount = (int) adminService.getAllAdminCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			adminList = adminService.getAdmins(page);
		} else {
			page = new Page(totalCount, 1);
			adminList = adminService.getAdmins(page);
		}
		mav.addObject(page);
		mav.addObject(adminList);
		return mav;
	}
	
	@RequestMapping(value="/updateAdmin/{aId}",method=RequestMethod.GET)
	public ModelAndView updateAdmin(@PathVariable Integer aId){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/admin_update");
		Admin admin=adminService.findAdminByAid(aId);
		mav.addObject(admin);
		return mav;
	}
	
	@RequestMapping(value="/updateAdmin",method=RequestMethod.POST)
	public ModelAndView updateAdmin(Admin admin){
		adminService.updateAdminByAid(admin);
		if(admin.getaUserName()=="admin"){
			return new ModelAndView("redirect:/accountSettings/1");
		}else{
			return new ModelAndView("redirect:/indexMain");
		}
	}
	
	@RequestMapping(value="/saveAdmin",method=RequestMethod.GET)
	public ModelAndView saveAdmin(){
		return new ModelAndView("WEB-INF/xg_admin/admin_save");
	}
	
	@RequestMapping(value="/saveAdmin",method=RequestMethod.POST)
	public ModelAndView saveAdmin(Admin admin){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=df.format(new Date());
		admin.setaRegisterTime(currentDate);
		adminService.saveAdmin(admin);
		return new ModelAndView("redirect:/accountSettings/1");
	}
	
	@RequestMapping(value="/deleteAdmin/{pageNow}/{aId}",method=RequestMethod.GET)
	public ModelAndView deleteAdmin(@PathVariable Integer aId,@PathVariable Integer pageNow){
		adminService.deleteAdminByAid(aId);
		return new ModelAndView("redirect:/accountSettings/{pageNow}");
	}
	
	//frame重定向
	@RequestMapping(value="/topMain",method=RequestMethod.GET)
	public ModelAndView topMain(){
		return new ModelAndView("WEB-INF/xg_admin/top");
	}
	
	@RequestMapping(value="/leftMain",method=RequestMethod.GET)
	public ModelAndView leftMain(){
		return new ModelAndView("WEB-INF/xg_admin/left");
	}
	
	@RequestMapping(value="/indexMain",method=RequestMethod.GET)
	public ModelAndView indexMain(){
		return new ModelAndView("WEB-INF/xg_admin/index");
	}
	
	@RequestMapping(value="/regMain",method=RequestMethod.GET)
	public ModelAndView regMain(){
		return new ModelAndView("WEB-INF/xg_admin/login2");
	}
	
	/**
	 * 注册
	 * @param admin
	 * @param attr
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/regMain",method=RequestMethod.POST)
	public ModelAndView regMain(Admin admin,RedirectAttributes attr,HttpServletResponse response){
		Admin currentRegName=adminService.findByUsername(admin.getaUserName());
		response.setContentType("text/html;charset=UTF-8");
		if (currentRegName != null) {
				message="用户名已存在！";
				attr.addFlashAttribute("duplicateMessage", message);
				return new ModelAndView("redirect:/regMain");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=df.format(new Date());
		admin.setaRegisterTime(currentDate);
		admin.setaStatus(0);
		admin.setaPassword(Md5Utils.md5(admin.getaPassword()));
		adminService.saveAdmin(admin);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out;
		try {
			out = response.getWriter();
			out.flush();
			out.println("<script>");
		    out.println("alert('注册成功，返回登录页面！');");
			out.println("</script>"); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ModelAndView("WEB-INF/xg_admin/login2");
	}
	
	/**
	 * 激活
	 * @param aCode
	 * @param attr
	 * @return
	 */
	@RequestMapping(value="/activateAdmin",method=RequestMethod.GET)
	public ModelAndView activateAdmin(@RequestParam String aCode,RedirectAttributes attr){
		Admin  currentAdmin=adminService.findByACode(aCode);
		if(currentAdmin == null){
			 message="用户已激活，请登录!";
			 attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/wh_2884");
		}else{
			currentAdmin.setaStatus(1);
			currentAdmin.setaCode(null);
			adminService.updateAdminByAid(currentAdmin);
			message="激活成功，请登录!";
			attr.addFlashAttribute("activateSuccess", message);
			return new ModelAndView("redirect:/wh_2884");
		}
	}
	
	//常规错误
	@RequestMapping(value="/overallError ")
	public ModelAndView overallError (){
		return new ModelAndView("common/error/error");
	}
	
}

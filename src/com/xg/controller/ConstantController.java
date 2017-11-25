package com.xg.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.xg.model.Constant;
import com.xg.service.ConstantService;

@Controller
public class ConstantController {
	@Resource
	private ConstantService constantService;

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * backstage 查询所有联系信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/constant", method = RequestMethod.GET)
	public ModelAndView findAllConstants() {
		ModelAndView mav = new ModelAndView("WEB-INF/xg_admin/constant_info");
		Constant constant = constantService.findAllConstants();
		mav.addObject(constant);
		return mav;
	}

	/**
	 * backstage 跳转到常用信息修改页
	 * 
	 * @param cId
	 * @return
	 */
	@RequestMapping(value = "/updateConstant/{cId}", method = RequestMethod.GET)
	public ModelAndView updateConstant(@PathVariable Integer cId) {
		ModelAndView mav = new ModelAndView("WEB-INF/xg_admin/constant_update");
		Constant constant = constantService.findConstantByCid(cId);
		mav.addObject(constant);
		return mav;
	}

	/**
	 * backstage 修改联系等常用信息
	 * 
	 * @param constant
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/updateConstant", method = RequestMethod.POST)
	public ModelAndView updateConstant(Constant constant,
			RedirectAttributes attr) {
		constantService.updateConstantByCid(constant);
		message = "修改成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/constant");
	}

	/**
	 * backstage 4张首页图
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/carouselFigureupload", method = RequestMethod.GET)
	public ModelAndView findCarouselFigure() {
		return new ModelAndView("WEB-INF/xg_admin/carouselFigure_info");
	}

	/**
	 * 开始上传
	 * 
	 * @param request
	 * @param response
	 * @param attr
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/backstage/carouselFigureupload", method = RequestMethod.POST)
	public ModelAndView carouselFigureupload(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes attr)
			throws IllegalStateException, IOException {
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						System.out.println(myFileName);
						// 重命名上传后的文件名
						/** 构建图片保存的目录 **/
						String logoPathDir = "templets/images/";
						/** 得到图片保存目录的真实路径 **/
						String logoRealPathDir = request.getSession()
								.getServletContext().getRealPath(logoPathDir);
						/** 根据真实路径创建目录 **/
						File logoSaveFile = new File(logoRealPathDir);
						if (!logoSaveFile.exists())
							logoSaveFile.mkdirs();
						String fileName = file.getOriginalFilename();
						String path = logoRealPathDir + "\\" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						message = "上传成功";
						attr.addFlashAttribute("message", message);
					}
				}
			}

		}
		return new ModelAndView("redirect:/backstage/carouselFigureupload");
	}

	/**
	 * backstage Words
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/wordsupload", method = RequestMethod.GET)
	public ModelAndView findWords() {
		return new ModelAndView("WEB-INF/xg_admin/words_info");
	}

	/**
	 * backstage Words
	 * 
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/backstage/wordsupload", method = RequestMethod.POST)
	public ModelAndView wordsupload(
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr) {
		if (!multipartFile.isEmpty()) {
			String logoPathDir = "templets/images/";
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext()
					.getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),
						localFile);
				message = "上传成功";
				attr.addFlashAttribute("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/wordsupload");// 返回成功视图
		} else {
			message = "上传失败,未检查到需要上传的文件";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/wordsupload"); // 返回失败视图
		}
	}

	/**
	 * backstage 简介图
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/introductionupload", method = RequestMethod.GET)
	public ModelAndView findIntroduction() {
		return new ModelAndView("WEB-INF/xg_admin/introduction_info");
	}

	/**
	 * backstage 简介图
	 * 
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/backstage/introductionupload", method = RequestMethod.POST)
	public ModelAndView introductionupload(
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr) {
		if (!multipartFile.isEmpty()) {
			String logoPathDir = "resources/front/we/images/";
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext()
					.getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),
						localFile);
				message = "上传成功";
				attr.addFlashAttribute("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/introductionupload");// 返回成功视图
		} else {
			message = "上传失败,未检查到需要上传的文件";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/introductionupload"); // 返回失败视图
		}
	}

	/**
	 * backstage 
	 * Background Image
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/backgroundImageupload", method = RequestMethod.GET)
	public ModelAndView findBackgroundImage() {
		return new ModelAndView("WEB-INF/xg_admin/backgroundImage_info");
	}
	
	/**
	 *  backstage 
	 *  Background Image
	 * @param request
	 * @param response
	 * @param attr
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/backstage/backgroundImageupload", method = RequestMethod.POST)
	public ModelAndView backgroundImageupload(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes attr)
			throws IllegalStateException, IOException {
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != ""){
						// 重命名上传后的文件名
						/** 构建图片保存的目录 **/
						String logoPathDir = "templets/images/";
						/** 得到图片保存目录的真实路径 **/
						String logoRealPathDir = request.getSession()
								.getServletContext().getRealPath(logoPathDir);
						/** 根据真实路径创建目录 **/
						File logoSaveFile = new File(logoRealPathDir);
						if (!logoSaveFile.exists())
							logoSaveFile.mkdirs();
						String fileName = file.getOriginalFilename();
						String path = logoRealPathDir + "\\" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						message = "上传成功";
						attr.addFlashAttribute("message", message);
					}
				}
			}

		}
		return new ModelAndView("redirect:/backstage/backgroundImageupload");
	}
	
	/**
	 * backstage 动态详细页/广告图
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/advertisementupload", method = RequestMethod.GET)
	public ModelAndView findAdvertisement() {
		return new ModelAndView("WEB-INF/xg_admin/advertisement_info");
	}
	
	/**
	 * backstage 动态详细页/广告图
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/backstage/advertisementupload", method = RequestMethod.POST)
	public ModelAndView advertisementupload(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr) {
		if (!multipartFile.isEmpty()) {
			String logoPathDir = "templets/Picture/";
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),localFile);
				message = "上传成功";
				attr.addFlashAttribute("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/advertisementupload");// 返回成功视图
		} else {
			message = "上传失败,未检查到需要上传的文件";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/advertisementupload"); // 返回失败视图
		}
	}
	
	/**
	 * backstage 客户图
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/customerupload", method = RequestMethod.GET)
	public ModelAndView findCustomer() {
		return new ModelAndView("WEB-INF/xg_admin/customer_info");
	}
	
	/**
	 * backstage 客户图
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/backstage/customerupload", method = RequestMethod.POST)
	public ModelAndView customerupload(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr) {
		if (!multipartFile.isEmpty()) {
			String logoPathDir = "templets/Images/";
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),localFile);
				message = "上传成功";
				attr.addFlashAttribute("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/customerupload");// 返回成功视图
		} else {
			message = "上传失败,未检查到需要上传的文件";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/customerupload"); // 返回失败视图
		}
	}
	
	/**
	 * backstage 欢迎图
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/welcomeupload", method = RequestMethod.GET)
	public ModelAndView findWelcome() {
		ModelAndView modelAndView=new ModelAndView();
		Constant  constant=constantService.findAllConstants();
		modelAndView.addObject(constant);
		modelAndView.setViewName("WEB-INF/xg_admin/welcome_info");
		return modelAndView;
	}
	
	/**
	 *  backstage  欢迎图
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value = "/backstage/welcomeupload", method = RequestMethod.POST)
	public ModelAndView welcomeupload(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr,Constant constant) {
		if (!multipartFile.isEmpty()) {
			String logoPathDir = "templets/Images/";
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),localFile);
				String cExtra5=logoPathDir+fileName;
				constant.setcId(1);
				constant.setcExtra5(cExtra5);
				constantService.updateConstantByCid(constant);
				message = "上传成功";
				attr.addFlashAttribute("message", message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/welcomeupload");// 返回成功视图
		} else {
			message = "上传失败,未检查到需要上传的文件";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/welcomeupload"); // 返回失败视图
		}
	}
	
	/**
	 * backstage logo&wechat
	 * 
	 * @return
	 */
	@RequestMapping(value = "/backstage/logoupload", method = RequestMethod.GET)
	public ModelAndView findLogo() {
		return new ModelAndView("WEB-INF/xg_admin/logo_info");
	}
	
	
	/**
	 * backstage logo&wechat
	 * 
	 * @param request
	 * @param response
	 * @param attr
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/backstage/logoupload", method = RequestMethod.POST)
	public ModelAndView logoupload(HttpServletRequest request,HttpServletResponse response, RedirectAttributes attr)
			throws IllegalStateException, IOException {
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						System.out.println(myFileName);
						// 重命名上传后的文件名
						/** 构建图片保存的目录 **/
						String logoPathDir = "templets/Picture/";
						/** 得到图片保存目录的真实路径 **/
						String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
						/** 根据真实路径创建目录 **/
						File logoSaveFile = new File(logoRealPathDir);
						if (!logoSaveFile.exists())
							logoSaveFile.mkdirs();
						String fileName = file.getOriginalFilename();
						String path = logoRealPathDir + "\\" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						message = "上传成功";
						attr.addFlashAttribute("message", message);
					}
				}
			}

		}
		return new ModelAndView("redirect:/backstage/logoupload");
	}

}

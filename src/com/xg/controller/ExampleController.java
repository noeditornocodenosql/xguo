package com.xg.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.xg.model.Example;
import com.xg.model.Page;
import com.xg.service.ExampleService;

/**
 * 案例
 * @author Administrator
 *
 */
@Controller
public class ExampleController {

	@Resource
	private ExampleService exampleService;
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	@RequestMapping(value="/cases/{pageNow}",method=RequestMethod.GET)
	public ModelAndView indexExample(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("a/cases/index");
		List<Example> exampleList=null;
		Page page = null;
		int totalCount = (int) exampleService.getAllExamplesCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			exampleList = exampleService.getAllExamples(page);
		} else {
			page = new Page(totalCount, 1);
			exampleList = exampleService.getAllExamples(page);
		}
		mav.addObject(page);
		mav.addObject(exampleList);
		return mav;
	}
	
	/**
	 * front/子分类查询
	 * @param pageNow
	 * @param eChildType
	 * @return
	 */
	@RequestMapping(value="/childExample/{pageNow}/{eChildType}",method=RequestMethod.GET)
	public ModelAndView getExampleByChildType(@PathVariable Integer pageNow,@PathVariable Integer eChildType){
		ModelAndView mav=new ModelAndView("a/cases/childCases");
		List<Example> exampleList=null;
		Page page = null;
		int totalCount = (int) exampleService.getChildExampleCount(eChildType);
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			int startPos=page.getStartPos();
			int pageSize=page.getPageSize();
			exampleList = exampleService.getExampleByChildType(eChildType, startPos, pageSize);
		} else {
			page = new Page(totalCount, 1);
			int startPos=page.getStartPos();
			int pageSize=page.getPageSize();
			exampleList = exampleService.getExampleByChildType(eChildType, startPos, pageSize);
		}
		mav.addObject(eChildType);
		mav.addObject(page);
		mav.addObject(exampleList);
		return mav;
	}
	
	/**
	 * front/详细页
	 * @param eId
	 * @return
	 */
	@RequestMapping(value="/cases/detail/{eChildType}/{eId}",method=RequestMethod.GET)
	public ModelAndView detailExample(@PathVariable Integer eId,@PathVariable Integer eChildType){
		ModelAndView mav=new ModelAndView("a/cases/detail");
		Example  example=exampleService.findExampleByEid(eId);
		mav.addObject(example);
		//案例详细页添加当前分类的page
		int totalCount = (int) exampleService.getChildExampleCount(eChildType);
		Page page = new Page(totalCount, 1);
		mav.addObject(page);
		return mav;
	}
	
	/**
	 * 案例详细页里的PREV&NEXT
	 * @param nId
	 * @return
	 */
	@RequestMapping(value="/cases/detail/next/{eChildType}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView detailNewsNext(@PathVariable Integer eChildType,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("a/cases/detail");
		int totalCount = (int)exampleService.getChildExampleCount(eChildType);
		Page page = new Page(totalCount, pageNow);
		int pageSize=1;
		Example example= null;
		if(pageNow<totalCount){
			example= exampleService.getNextExampleByChildType(eChildType, pageNow, pageSize);
		}else{
			example= exampleService.getNextExampleByChildType(eChildType, pageNow-1, pageSize);
		}
		mav.addObject(page);
		mav.addObject(example);
		return mav;
	}
	
	/**
	 * back/案例详细页
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/cases/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageExample(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/cases_info");
		List<Example> exampleList=null;
		Page page = null;
		int totalCount = (int) exampleService.getAllExamplesCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			exampleList = exampleService.getAllExamples(page);
		} else {
			page = new Page(totalCount, 1);
			exampleList = exampleService.getAllExamples(page);
		}
		mav.addObject(page);
		mav.addObject(exampleList);
		return mav;
	}
	
	/**
	 *   back/新增or修改
	 * @param eId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/cases/soru/{pageNow}/{eId}",method=RequestMethod.GET)
	public ModelAndView backstageSaveOrUpdateExample(@PathVariable Integer eId,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView();
		if(eId==0){
			mav.setViewName("WEB-INF/xg_admin/cases_save");
		}else{
			Example  example=exampleService.findExampleByEid(eId);
			mav.addObject(example);
			mav.setViewName("WEB-INF/xg_admin/cases_update");
			mav.addObject(pageNow);
		}
		return mav;
	}
	
	/**
	 *  back/新增or修改
	 * @param eId
	 * @param pageNow
	 * @param example
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value="/backstage/cases/soru/{pageNow}/{eId}",method=RequestMethod.POST)
	public ModelAndView backstageSaveOrUpdateExamples(@PathVariable Integer eId,@PathVariable Integer pageNow,Example example,HttpServletRequest request,RedirectAttributes attr){
			  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;     
		        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd");     
		        /**构建图片保存的目录**/    
		        String logoPathDir = "uploads/"+ dateformat.format(new Date());     
		        /**得到图片保存目录的真实路径**/    
		        String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);     
		        /**根据真实路径创建目录**/    
		        File logoSaveFile = new File(logoRealPathDir);     
		        if(!logoSaveFile.exists())     
		            logoSaveFile.mkdirs();           
		        /**页面控件的文件流**/    
		        MultipartFile multipartFile = multipartRequest.getFile("file");      
		        if (multipartFile.getSize()!=0) {   
		        /**获取文件的后缀**/    
		        String suffix = multipartFile.getOriginalFilename().substring  
		                        (multipartFile.getOriginalFilename().lastIndexOf("."));     
		        if(!suffix.endsWith(".jpg") || suffix.endsWith(".png")){
		        	message="图片格式不正确，请上传jpg式或png格式";
					 attr.addFlashAttribute("message", message);
		            return new ModelAndView("redirect:/backstage/cases/soru/1/0");
		     }else{
		        /**使用UUID生成文件名称**/    
		        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
		        /**拼成完整的文件保存路径加文件**/    
		        String fileName = logoRealPathDir + File.separator   + logImageName;                
		        File file = new File(fileName);          
		        try {     
		            multipartFile.transferTo(file);     
		            String eThumbnail=logoPathDir+"/"+logImageName;
		            example.seteThumbnail(eThumbnail);
		            example.seteCreateTime(new Date());
		    		if(eId==0){
		    			exampleService.saveExample(example);
		    			message="添加成功";
		    			attr.addFlashAttribute("message", message);
		    			return new ModelAndView("redirect:/backstage/cases/1");
		    		}else{
		    			exampleService.updateExampleByEid(example);
		    			message="修改成功";
		    			attr.addFlashAttribute("message", message);
		    			return new ModelAndView("redirect:/backstage/cases/{pageNow}");
		    		}
		        } catch (IllegalStateException e) {     
		            e.printStackTrace();     
		        } catch (IOException e) {            
		            e.printStackTrace();     
		        }     
		     }   
		     }else if(multipartFile.getSize()==0&&eId==0) {   
		                 message="添加失败：文件为空";
						 attr.addFlashAttribute("message", message);
			            return new ModelAndView("redirect:/backstage/cases/soru/1/0");
		            }   
		    exampleService.updateExampleByEid(example);
	    	message="修改成功";
	    	attr.addFlashAttribute("message", message);
	    	return new ModelAndView("redirect:/backstage/cases/{pageNow}");
	}
	
	/**
	 *  back/返回上一级
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/cases/back/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageBackNews(@PathVariable Integer pageNow){
		return new ModelAndView("redirect:/backstage/cases/{pageNow}");
	}
	
	/**
	 *  back/删除
	 * @param eId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/cases/delete/{pageNow}/{eId}",method=RequestMethod.GET)
	public ModelAndView backstageDeleteExample(@PathVariable Integer eId,@PathVariable Integer pageNow,RedirectAttributes attr){
		exampleService.deleteExampleByEid(eId);
		message="删除成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/backstage/cases/{pageNow}");
	}

}

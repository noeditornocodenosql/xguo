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
import com.xg.model.News;
import com.xg.model.Page;
import com.xg.service.NewsService;

/**
 * 公司新闻&动态
 * @author Administrator
 *
 */
@Controller
public class NewsController {
	
	@Resource
	private NewsService newsService;
	
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * 查看动态
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/news/{pageNow}",method=RequestMethod.GET)
	public ModelAndView indexNews(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("a/news/index");
		List<News> newsList=null;
		Page page = null;
		int totalCount = (int) newsService.getAllNewsCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			newsList = newsService.getAllNews(page);
		} else {
			page = new Page(totalCount, 1);
			newsList = newsService.getAllNews(page);
		}
		mav.addObject(page);
		mav.addObject(newsList);
		return mav;
	}
	
	/**
	 * 动态分类
	 * @param pageNow
	 * @param nChildType
	 * @return
	 */
	@RequestMapping(value="/childNews/{pageNow}/{nChildType}",method=RequestMethod.GET)
	public ModelAndView getNewsByChildType(@PathVariable Integer pageNow,@PathVariable Integer nChildType){
		ModelAndView mav=new ModelAndView("a/news/childNews");
		List<News> newsList=null;
		Page page = null;
		int totalCount = (int) newsService.getChildNewsCount(nChildType);
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			int startPos=page.getStartPos();
			int pageSize=page.getPageSize();
			newsList = newsService.getNewsByChildType(nChildType, startPos,pageSize);
		} else {
			page = new Page(totalCount, 1);
			int startPos=page.getStartPos();
			int pageSize=page.getPageSize();
			newsList = newsService.getNewsByChildType(nChildType, startPos,pageSize);
		}
		mav.addObject(nChildType);
		mav.addObject(page);
		mav.addObject(newsList);
		return mav;
	}
	
	/**
	 * 动态详细页
	 * @param nId
	 * @return
	 */
	@RequestMapping(value="/news/detail/{nChildType}/{nId}",method=RequestMethod.GET)
	public ModelAndView detailNews(@PathVariable Integer nId,@PathVariable Integer nChildType){
		ModelAndView mav=new ModelAndView("a/news/detail");
		News  news=newsService.findNewsByNid(nId);
		//推荐阅读
		List<News> newsList=newsService.getAllNewsWithNoPage();
		news.setnOnlookerNum(news.getnOnlookerNum()+1);
		newsService.updateNewsByNid(news);
		mav.addObject(news);
		mav.addObject(newsList);
		//动态详细页添加当前分类的page
		int totalCount = (int) newsService.getChildNewsCount(nChildType);
		Page page = new Page(totalCount, 1);
		mav.addObject(page);
		
		return mav;
	}
	
	/**
	 * 动态详细页里的PREV&NEXT
	 * @param nId
	 * @return
	 */
	@RequestMapping(value="/news/detail/next/{nChildType}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView detailNewsNext(@PathVariable Integer nChildType,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("a/news/detail");
		int totalCount = (int) newsService.getChildNewsCount(nChildType);
		Page page = new Page(totalCount, pageNow);
		int pageSize=1;
		News news= null;
		if(pageNow<totalCount){
		   news= newsService.getNextNewsByChildType(nChildType, pageNow, pageSize);
		   news.setnOnlookerNum(news.getnOnlookerNum()+1);
			newsService.updateNewsByNid(news);
		}else{
			news= newsService.getNextNewsByChildType(nChildType, pageNow-1, pageSize);
		}
		//推荐阅读
		List<News> newsList=newsService.getAllNewsWithNoPage();
		mav.addObject(page);
		mav.addObject(news);
		mav.addObject(newsList);
		return mav;
	}
	
	/**
	 *  back/查看所有动态
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/news/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageNews(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/news_info");
		List<News> newsList=null;
		Page page = null;
		int totalCount = (int) newsService.getAllNewsCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			newsList = newsService.getAllNews(page);
		} else {
			page = new Page(totalCount, 1);
			newsList = newsService.getAllNews(page);
		}
		mav.addObject(page);
		mav.addObject(newsList);
		return mav;
	}
	
	/**
	 *  back/跳转到修改页
	 * @param nId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/news/update/{nId}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageUpdateNews(@PathVariable Integer nId,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/news_update");
		News  news=newsService.findNewsByNid(nId);
		mav.addObject(news);
		mav.addObject(pageNow);
		return mav;
	}
	
	/**
	 *  back/修改
	 * @param pageNow
	 * @param news
	 * @param request
	 * @param attr
	 * @return
	 */
	@RequestMapping(value="/backstage/news/update/{nId}/{pageNow}",method=RequestMethod.POST)
	public ModelAndView backstageUpdateNews(@PathVariable Integer pageNow,@PathVariable Integer nId,News news,HttpServletRequest request,RedirectAttributes attr){
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
	            return new ModelAndView("redirect:/backstage/news/update/{nId}/{pageNow}");
	     }else{
	        /**使用UUID生成文件名称**/    
	        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
	        /**拼成完整的文件保存路径加文件**/    
	        String fileName = logoRealPathDir + File.separator   + logImageName;                
	        File file = new File(fileName);          
	        try {     
	            multipartFile.transferTo(file);     
	            String nThumbnail=logoPathDir+"/"+logImageName;
	            news.setnThumbnail(nThumbnail);
	            news.setnCreateTime(new Date());
	            newsService.updateNewsByNid(news);
	            message="修改成功";
	    		attr.addFlashAttribute("message", message);
	        } catch (IllegalStateException e) {     
	            e.printStackTrace();     
	        } catch (IOException e) {            
	            e.printStackTrace();     
	        }     
	        	return new ModelAndView("redirect:/backstage/news/{pageNow}");
	     }
	        }else{
	        	   news.setnCreateTime(new Date());
	        	   newsService.updateNewsByNid(news);
	        	   message="修改成功";
		    	   attr.addFlashAttribute("message", message);
	        	 return new ModelAndView("redirect:/backstage/news/{pageNow}");
	        } 
	}
	
	/**
	 *  back/返回上一级
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/news/back/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageBackNews(@PathVariable Integer pageNow){
		return new ModelAndView("redirect:/backstage/news/{pageNow}");
	}
	
	/**
	 *  back/删除
	 * @param nId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/news/delete/{nId}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageDeleteNews(@PathVariable Integer nId,@PathVariable Integer pageNow,RedirectAttributes attr){
		newsService.deleteNewsByNid(nId);
		message="删除成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/backstage/news/{pageNow}");
	}
	
	/**
	 *  back/跳转到添加页
	 * @return
	 */
	@RequestMapping(value="/backstage/news/save",method=RequestMethod.GET)
	public ModelAndView backstageSaveNews(){
		return new ModelAndView("WEB-INF/xg_admin/news_save");
	}
	
	/**
	 *  back/添加
	 * @param news
	 * @param request
	 * @param attr
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/backstage/news/save",method=RequestMethod.POST)
	public ModelAndView backstageSaveNews(News news,HttpServletRequest request,RedirectAttributes attr) throws IllegalStateException,IOException{
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
	        if (multipartFile.getSize()==0) {   
                message="上传失败：文件为空";
				 attr.addFlashAttribute("message", message);
	            return new ModelAndView("redirect:/backstage/news/save");
            }   
	        /**获取文件的后缀**/    
	        String suffix = multipartFile.getOriginalFilename().substring  
	                        (multipartFile.getOriginalFilename().lastIndexOf("."));     
	        if(!suffix.endsWith(".jpg") || suffix.endsWith(".png")){
	        	message="图片格式不正确，请上传jpg式或png格式";
				 attr.addFlashAttribute("message", message);
	            return new ModelAndView("redirect:/backstage/news/save");
	     }else{
	        /**使用UUID生成文件名称**/    
	        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
	        /**拼成完整的文件保存路径加文件**/    
	        String fileName = logoRealPathDir + File.separator   + logImageName;                
	        File file = new File(fileName);          
	        try {     
	            multipartFile.transferTo(file);     
	            String nThumbnail=logoPathDir+"/"+logImageName;
	            news.setnThumbnail(nThumbnail);
	            news.setnCreateTime(new Date());
	            news.setnOnlookerNum(0);
	            newsService.saveNews(news);
	            message="添加成功";
	    		attr.addFlashAttribute("message", message);
	        } catch (IllegalStateException e) {     
	            e.printStackTrace();     
	        } catch (IOException e) {            
	            e.printStackTrace();     
	        }     
	        	return new ModelAndView("redirect:/backstage/news/1");
	     }
	}
	
}

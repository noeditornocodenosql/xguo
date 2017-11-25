package com.xg.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xg.model.Page;
import com.xg.model.Team;
import com.xg.service.TeamService;

@Controller
public class TeamController {
	@Resource
	 private TeamService teamService;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * 查看团队
	 * @return
	 */
	@RequestMapping(value="/teamMore/{pageNow}",method=RequestMethod.GET)
	public ModelAndView indexTeam(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("a/team/index");
		List<Team> teamList=teamService.findAllTeamWithNoPage();
		mav.addObject(teamList);
		return mav;
	}
	
	/**
	 * backstage
	 * teamInfo页
	 * @return
	 */
	@RequestMapping(value="/backstage/team/{pageNow}")
	public ModelAndView findAllTeam(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/team_info");
		int totalCount = (int) teamService.getAllTeamCount();
		Page page = new Page(totalCount,pageNow);
		List<Team> teamList=teamService.findAllTeam(page);
		mav.addObject(teamList);
		mav.addObject(page);
		return mav;
	}
	
	/**
	 *  backstage
	 *  back/返回上一级
	 * @return
	 */
	@RequestMapping(value="/backstage/team/back/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageBackNews(@PathVariable Integer pageNow){
		return new ModelAndView("redirect:/backstage/team/{pageNow}");
	}
	
	/**
	 *  backstage
	 *  跳转到team修改页
	 * @param tId
	 * @return
	 */
	@RequestMapping(value="/backstage/team/update/{tId}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView updateTeam(@PathVariable Integer tId,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/team_update");
		Team team=teamService.findTeamByTid(tId);
		mav.addObject(team);
		mav.addObject(pageNow);
		return mav;
	}
	
	/**
	 *  backstage
	 *  team修改
	 * @param team
	 * @param multipartFile
	 * @param request
	 * @param attr
	 * @param tId
	 * @return
	 */
	@RequestMapping(value="/backstage/team/update/{tId}/{pageNow}",method=RequestMethod.POST)
	public ModelAndView updateTeams(Team team,@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, RedirectAttributes attr,@PathVariable Integer tId,@PathVariable Integer pageNow){
		String logoPathDir = null;
		if (!multipartFile.isEmpty()) {
			/** 判断修改的是首页的团队图片，还是详细里的团队图片 **/
			if(team.gettTitle()!=null && "" !=team.gettTitle()){
				 logoPathDir = "resources/front/team/images/";
			}else if(team.gettExtra1()!=null && "" !=team.gettExtra1()){
				logoPathDir = "a/team/photo/";
			}
			/** 得到图片保存目录的真实路径 **/
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			String fileName = multipartFile.getOriginalFilename();
			String path = logoRealPathDir + "\\" + fileName;
			File localFile = new File(path);
			try {
				FileUtils.copyInputStreamToFile(multipartFile.getInputStream(),localFile);
				message = "修改成功";
				attr.addFlashAttribute("message", message);
				String realPath=logoPathDir+fileName;
				if(team.gettTitle()!=null && "" !=team.gettTitle()){
					  team.settThumbnail(realPath);
				}else if(team.gettExtra1()!=null && "" !=team.gettExtra1()){
					  team.settExtra2(realPath);
				}
				teamService.updateTeamByTid(team);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView("redirect:/backstage/team/{pageNow}");// 返回成功视图
		} else {
			message = "未检查到需要上传的文件,图片未修改";
			attr.addFlashAttribute("message", message);
			teamService.updateTeamByTid(team);
			return new ModelAndView("redirect:/backstage/team/{pageNow}");// 返回失败视图
		}
	}
	
	/**
	 *  back/删除
	 * @param tId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/team/delete/{tId}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageDeleteNews(@PathVariable Integer tId,@PathVariable Integer pageNow,RedirectAttributes attr){
		teamService.deleteTeamByTid(tId);
		message="删除成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/backstage/team/{pageNow}");
	}
	
	/**
	 *  back/跳转到添加页
	 * @return
	 */
	@RequestMapping(value="/backstage/team/save",method=RequestMethod.GET)
	public ModelAndView backstageSaveTeam(){
		return new ModelAndView("WEB-INF/xg_admin/team_save");
	}
	
	/**
	 *  back/添加
	 * @param team
	 * @param request
	 * @param attr
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/backstage/team/save",method=RequestMethod.POST)
	public ModelAndView backstageSaveTeam(Team team,HttpServletRequest request,RedirectAttributes attr) throws IllegalStateException,IOException{
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
	            return new ModelAndView("redirect:/backstage/team/save");
            }   
	        /**获取文件的后缀**/    
	        String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));     
	        if(!suffix.endsWith(".jpg") || suffix.endsWith(".png")){
	        	message="图片格式不正确，请上传jpg式或png格式";
				 attr.addFlashAttribute("message", message);
	            return new ModelAndView("redirect:/backstage/team/save");
	     }else{
	        /**使用UUID生成文件名称**/    
	        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
	        /**拼成完整的文件保存路径加文件**/    
	        String fileName = logoRealPathDir + File.separator   + logImageName;                
	        File file = new File(fileName);          
	        try {     
	            multipartFile.transferTo(file);     
	            String tExtra2=logoPathDir+"/"+logImageName;
	            team.settExtra2(tExtra2);
	            teamService.saveTeam(team);
	            message="添加成功";
	    		attr.addFlashAttribute("message", message);
	        } catch (IllegalStateException e) {     
	            e.printStackTrace();     
	        } catch (IOException e) {            
	            e.printStackTrace();     
	        }     
	        	return new ModelAndView("redirect:/backstage/team/1");
	     }
	}

}

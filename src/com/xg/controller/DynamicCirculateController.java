package com.xg.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.xg.model.DynamicCirculate;
import com.xg.model.Page;
import com.xg.service.DynamicCirculateService;

@Controller
public class DynamicCirculateController {
	
	@Autowired
	private DynamicCirculateService dynamicCirculateService;
	
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * back/查看所有动态 8张
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/dynamicCirculate/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageDynamicCirculate(@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/dynamicCirculate_info");
		List<DynamicCirculate> dynamicCirculateList=null;
		Page page = null;
		int totalCount =dynamicCirculateService.getAllDynamicCirculateCount();
		if (pageNow != null) {
			page = new Page(totalCount,pageNow);
			dynamicCirculateList = dynamicCirculateService.getAllDynamicCirculate(page);
		} else {
			page = new Page(totalCount, 1);
			dynamicCirculateList = dynamicCirculateService.getAllDynamicCirculate(page);
		}
		mav.addObject(page);
		mav.addObject(dynamicCirculateList);
		return mav;
	}
	
	/**
	 *  back/跳转到修改页 8张
	 * @param dId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/dynamicCirculate/update/{dId}/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageUpdateDynamicCirculate(@PathVariable Integer dId,@PathVariable Integer pageNow){
		ModelAndView mav=new ModelAndView("WEB-INF/xg_admin/dynamicCirculate_update");
		DynamicCirculate dynamicCirculate=dynamicCirculateService.findDynamicCirculateByDid(dId);
		mav.addObject(dynamicCirculate);
		mav.addObject(pageNow);
		return mav;
	}
	
	/**
	 *  back/返回上一级 8张
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/dynamicCirculate/back/{pageNow}",method=RequestMethod.GET)
	public ModelAndView backstageBackDynamicCirculate(@PathVariable Integer pageNow){
		return new ModelAndView("redirect:/backstage/dynamicCirculate/{pageNow}");
	}
	
	/**
	 *  back/跳转到添加页 8张
	 * @return
	 */
	@RequestMapping(value="/backstage/dynamicCirculate/save",method=RequestMethod.GET)
	public ModelAndView backstageSaveDynamicCirculate(){
		return new ModelAndView("WEB-INF/xg_admin/dynamicCirculate_save");
	}
	
    /*** 
     * 保存文件 
     * @param file 
     * @return 
     */  
    private boolean saveFile(MultipartFile file,HttpServletRequest request,DynamicCirculate dynamicCirculate) {  
        // 判断文件是否为空  
        if (file.getSize()!=0) {  
            try {  
            	  SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd");     
  		        /**构建图片保存的目录**/    
  		        String logoPathDir = "uploads/8p/"+ dateformat.format(new Date());     
  		        /**得到图片保存目录的真实路径**/    
  		        String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);     
  		        /**根据真实路径创建目录**/    
  		        File logoSaveFile = new File(logoRealPathDir);     
  		        if(!logoSaveFile.exists())     
  		            logoSaveFile.mkdirs();           
                // 文件保存路径  
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));     
                /**使用UUID生成文件名称**/    
		        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
		        /**拼成完整的文件保存路径加文件**/    
		        String fileName = logoRealPathDir + File.separator   + logImageName;                
                // 转存文件  
                file.transferTo(new File(fileName));  
                String bigPictureThumbnail=logoPathDir+"/"+logImageName;
                long CurrentSize=file.getSize();
                if(CurrentSize<30000){
                	dynamicCirculate.setSmaliPictureThumbnail(bigPictureThumbnail);
                }else{
                	dynamicCirculate.setBigPictureThumbnail(bigPictureThumbnail);
                }
        			dynamicCirculate.setSmallPictureCreateTime(new Date());
                return true;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return false;  
    }  
    
    /**
     *   back/新增or修改 8张
     * @param dId
     * @param pageNow
     * @param files
     * @param request
     * @param attr
     * @param dynamicCirculate
     * @return
     */
    @RequestMapping(value="/backstage/dynamicCirculate/soru/{pageNow}/{dId}",method=RequestMethod.POST )
    public ModelAndView backstageSaveOrUpdateDynamicCirculate(@PathVariable Integer dId,@PathVariable Integer pageNow,@RequestParam("file") MultipartFile[] files,HttpServletRequest request,RedirectAttributes attr,DynamicCirculate dynamicCirculate) {  
        //判断file数组不能为空并且长度大于0  
        if(files!=null&&files.length>0){  
            //循环获取file数组中得文件  
            for(int i = 0;i<files.length;i++){  
                MultipartFile file = files[i];  
                System.out.println(file.getOriginalFilename());
                if(!files[i].isEmpty()){
                //保存文件  
                saveFile(file,request,dynamicCirculate);  
                }else{
                	if(dId==0){
                		message="添加失败：文件为空";
            			attr.addFlashAttribute("message", message);
            	        return new ModelAndView("redirect:/backstage/dynamicCirculate/save");
                	}else{
                		dynamicCirculate.setSmallPictureCreateTime(new Date());
                		dynamicCirculateService.updateDynamicCirculateByDid(dynamicCirculate);
            			message="修改成功";
            			attr.addFlashAttribute("message", message);
            			return new ModelAndView("redirect:/backstage/dynamicCirculate/{pageNow}");
                	}
                }  
            }  
        }if(dId==0){
    		dynamicCirculateService.saveDynamicCirculate(dynamicCirculate);
    		message="添加成功";
			attr.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/backstage/dynamicCirculate/1");
		}else{
        dynamicCirculate.setSmallPictureCreateTime(new Date());
		dynamicCirculateService.updateDynamicCirculateByDid(dynamicCirculate);
		message="修改成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/backstage/dynamicCirculate/{pageNow}");
		}
    }  
    
	/**
	 *  back/删除 8张
	 * @param dId
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value="/backstage/dynamicCirculate/delete/{pageNow}/{dId}",method=RequestMethod.GET)
	public ModelAndView backstageDeleteDynamicCirculate(@PathVariable Integer dId,@PathVariable Integer pageNow,RedirectAttributes attr){
		dynamicCirculateService.deleteDynamicCirculateByDid(dId);
		message="删除成功";
		attr.addFlashAttribute("message", message);
		return new ModelAndView("redirect:/backstage/dynamicCirculate/{pageNow}");
	}
	
}

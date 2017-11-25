package com.xg.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalException {
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView routineException(Exception ex){
		System.out.println("出异常了"+ex);
		return new ModelAndView("common/404/404");
	}
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public ModelAndView maxUploadSizeExceededException(Exception ex){
		ModelAndView mav=new ModelAndView("common/error/error_fileupload");
		System.out.println("上传文件过大"+ex);
		mav.addObject("message","图片大小应不超过10M");
		return mav;
	}
}

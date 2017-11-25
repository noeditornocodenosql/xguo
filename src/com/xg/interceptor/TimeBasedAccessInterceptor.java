package com.xg.interceptor;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TimeBasedAccessInterceptor implements HandlerInterceptor {    
    private int openingTime;    
    private int closingTime;    
    private String mappingURL;//利用正则映射到需要拦截的路径    
    public void setOpeningTime(int openingTime) {    
        this.openingTime = openingTime;    
    }    
    public void setClosingTime(int closingTime) {    
        this.closingTime = closingTime;    
    }    
    public void setMappingURL(String mappingURL) {    
        this.mappingURL = mappingURL;    
    }    
    @Override    
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {    
        String url=request.getRequestURL().toString();    
        if(mappingURL==null || url.matches(mappingURL)){    
            Calendar c=Calendar.getInstance();    
            c.setTime(new Date());    
            int now=c.get(Calendar.HOUR_OF_DAY);    
            if(now<openingTime || now>closingTime){    
                request.setAttribute("message", "注册开放时间：9：00-12：00");    
                request.getRequestDispatcher("/common/error/error.jsp").forward(request, response);    
                return false;    
            }    
            return true;    
        }    
        return true;    
    }
	@Override
	public void afterCompletion(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Object paramObject,
			Exception paramException) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void postHandle(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, Object paramObject,
			ModelAndView paramModelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}    
}    

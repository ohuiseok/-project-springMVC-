package com.ous.daily.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Confirm implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("login");
          
        if ( obj == null ){
            response.sendRedirect(request.getContextPath());
            return false; 
        }
          
        return true;
	}
}
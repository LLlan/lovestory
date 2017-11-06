package com.yizhan.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yizhan.entity.system.Memory;
import com.yizhan.entity.system.ThreadTokenHolder;
import com.yizhan.util.Tools;

public class TokenInterceptor extends HandlerInterceptorAdapter{
	
	private Memory memory;
    private List<String> allowList; // 放行的URL列表
    private static final PathMatcher PATH_MATCHER = new AntPathMatcher();
    ThreadTokenHolder threadTokenHolder = new ThreadTokenHolder();
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		 // 判断请求的URI是否运行放行，如果不允许则校验请求的token信息
		         if (!checkAllowAccess(request.getRequestURI())) {
		            // 检查请求的token值是否为空
		            String token = getTokenFromRequest(request);
		            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
		             response.setCharacterEncoding("UTF-8");
		             response.setHeader("Cache-Control", "no-cache, must-revalidate");
		             if (Tools.isEmpty(token)) {
		                 response.getWriter().write("Token不能为空");
		                 response.getWriter().close();
		                return false;
		             }
		             if (!memory.checkLoginInfo(token)) {
		                 response.getWriter().write("Session已过期，请重新登录");
		                 response.getWriter().close();
		                 return false;
		             }
		             threadTokenHolder.setToken(token); // 保存当前token，用于Controller层获取登录用户信息
		         }
		return super.preHandle(request, response, handler);
	}
	
	
		/**
	      * 检查URI是否放行
	      * 
	      * @param URI
	      * @return 返回检查结果
	      */
	     private boolean checkAllowAccess(String URI) {
	         if (!URI.startsWith("/")) {
	             URI = "/" + URI;
	         }
	         for (String allow : allowList) {
	             if (PATH_MATCHER.match(allow, URI)) {
	                 return true;
	             }
	         }
	         return false;
	     }
	 
	
	
	
		/**
	      * 从请求信息中获取token值
	      * 
	      * @param request
	      * @return token值
	      */
	     private String getTokenFromRequest(HttpServletRequest request) {
	        // 默认从header里获取token值
	         String token = request.getHeader("token");
	         if (Tools.isEmpty(token)) {
	             // 从请求信息中获取token值
	             token = request.getParameter("token");
	         }
	         return token;
	    }
	     
	     public List<String> getAllowList() {
	    	 return allowList;
	    }
	    	  
	      public void setAllowList(List<String> allowList) {
	         this.allowList = allowList;
	     }
}

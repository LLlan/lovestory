package com.yizhan.entity.system;

import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yizhan.interceptor.TokenInterceptor;
import com.yizhan.util.DateUtil;
import com.yizhan.util.MD5;


import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

@Controller
public class Memory {
	
	  @Resource(name="ehcache")
      private static Cache ehcache; // 注意这里引入的Cache是net.sf.ehcache.Cache
	  
      public static ThreadTokenHolder threadTokenHolder = new ThreadTokenHolder();
		      
      
        public void setValue(String key, String value) {
          ehcache.put(new Element(key, value));
        }
      
	     public Object getValue(String key) {
	         Element element = ehcache.get(key);
	         return element != null ? element.getValue() : null;
	     }
		     
     	/**
           * 关闭缓存管理器
           */
         @PreDestroy
        protected void shutdown() {
            if (ehcache != null) {
                ehcache.getCacheManager().shutdown();
             }
         }
		     
         /**
          * 保存当前登录用户信息
          * 
          * @param loginUser
         */
         public static void saveLoginUser(String userName,String pwd,Proprietor proprietor) {
        	 String timeout = DateUtil.getTime();
             // 生成seed和token值
             String seed =  MD5.md5(userName);
             String token = MD5.md5(userName+pwd+timeout);
             System.out.println(token);
             // 保存token到登录用户中
             threadTokenHolder.setToken(token);
             
             threadTokenHolder.setProprietor(proprietor);
             // 清空之前的登录信息
             //clearLoginInfoBySeed(seed);
             System.out.println("-----------ehcache对象---"+ehcache);
             // 保存新的token和登录信息
             int ttiExpiry = NumberUtils.toInt(timeout) * 60; // 转换成秒
             ehcache.put(new Element(seed, token, false, ttiExpiry, 0));
             ehcache.put(new Element(token, threadTokenHolder, false, ttiExpiry, 0));
             ehcache.put(new Element("proprietor", threadTokenHolder, false, ttiExpiry, 0));
         }
		     
	         /**
	          * 获取当前线程中的用户信息
	          * 
	          * @return
	         */
	        @SuppressWarnings("deprecation")
			public static ThreadTokenHolder currentLoginUser(){
	             Element element = ehcache.get(threadTokenHolder.getToken());
	             ThreadTokenHolder threadTokenHolder = (ThreadTokenHolder)element.getObjectValue();
	            // Element element_proprietor = ehcache.get(threadTokenHolder.getProprietor());
	            // return element == null ? null : (ThreadTokenHolder) element_proprietor.getValue();
	             return threadTokenHolder;
	         }
	         
	         
	         public static Object getObject(){
	        	 	 Element element = ehcache.get(threadTokenHolder.getToken());
		             Element element_proprietor = ehcache.get(threadTokenHolder.getProprietor());
		             Proprietor p  = (Proprietor)element_proprietor.getValue();
		             return p;
	         }
		     
	         /**
	          * 根据token检查用户是否登录
	          * 
	          * @param token
	          * @return
	          */
	         public boolean checkLoginInfo(String token) {
	             Element element = ehcache.get(token);
	             return element != null && (ThreadTokenHolder) element.getValue() != null;
	         }
		     
	        /**
	          * 清空登录信息
	         */
	         public void clearLoginInfo() {
	        	 ThreadTokenHolder loginUser = currentLoginUser();
	             if (loginUser != null) {
	                // 根据登录的用户名生成seed，然后清除登录信息
	                 String seed = MD5.md5("");
	                 clearLoginInfoBySeed(seed);
	                
	            }
	         }
		     
	         /**
	          * 根据seed清空登录信息
	          * 
	          * @param seed
	          */
	         public void clearLoginInfoBySeed(String seed) {
	            // 根据seed找到对应的token
	             Element element = ehcache.get(seed);
	             if (element != null) {
	                 // 根据token清空之前的登录信息
	                 ehcache.remove(seed);
	                 ehcache.remove(element.getValue());
	             }
	        }
}

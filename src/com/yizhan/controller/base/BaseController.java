package com.yizhan.controller.base;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.yizhan.entity.Page;
import com.yizhan.util.Logger;
import com.yizhan.util.PageData;
import com.yizhan.util.UuidUtil;

public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/**
	 * 得到PageData
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}

	 /**
     * url地址前缀
     */
    private static String PATH = null;
    public static String getPath(HttpServletRequest request){
        if(PATH == null){
            PATH = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        }
        return PATH;
    }
    
	/**
	 * 得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		
		return UuidUtil.get32UUID();
		
	}
	
	/**
	 * 得到分页列表的信息 
	 */
	public Page getPage(){
		
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	 
    //base64算法,解密，加密
    public static String base64Encode(String str){
        BASE64Encoder baseEncode = new BASE64Encoder();
        return baseEncode.encode(str.getBytes());//加密
    }
    
    //解密
    public static String base64Decode(String str){
        BASE64Decoder baseDecoder = new BASE64Decoder();
        try {
            return new String(baseDecoder.decodeBuffer(str));//解密
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
	
}

package com.yizhan.util;

import com.weixin.dao.WeiXinDaoImpl;

public class GetWeiXinUrl {

	public static String getUrl(String url){
		WeiXinDaoImpl dao=new WeiXinDaoImpl();
		String pathUrl=null;
		try {
			pathUrl=dao.getCodeUrl(SysConfig.getInstance().getProperty("wx_appid"),url,"snsapi_userinfo", "state");
		} catch (Exception e) {
			
		}
		return pathUrl;
	}
}

package com.yizhan.test;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.fusioncharts.database.DBConnection;
import com.weixin.method.staticMethod;
import com.weixin.test.GetUrl;
import com.yizhan.util.FileUtil;
import com.yizhan.util.PathUtil;

public class dotest {

	/**
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-30
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String string= "D:\\Apache Software Foundation\\Tomcat 7.0\\webapps\\XiaoQufw\\uploadFiles\\uploadImgs\\appHead\\20170330\\a1d2c807467b4291ac97b004404e9a34.jpg";
		//FileUtil.delFile(string);
		/*HttpServletRequest request = null;
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		System.out.println(basePath);*/
		
		String url =dotest.GetUrl();
		System.out.println(url);
	}
	///E:/Workspaces/MyEclipse%2010/Instaty/WebRoot/WEB-INF/classes/
	
	public static String GetUrl(){
		//String a2=类名.class.getResource("").toString();

		String a3=DBConnection.class.getResource("/").toString();
		String a4=DBConnection.class.getClassLoader().getResource("").toString();

		String t=	(String.valueOf(Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("file:/", "").replaceAll("%20", " ")));
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
		/*if(path.indexOf(":") != 1){
			path = File.separator + path;
			System.out.println("------"+path);
		}*/
		return path;
	}

}

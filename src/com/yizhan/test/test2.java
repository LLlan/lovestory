package com.yizhan.test;

import java.awt.Desktop;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.weixin.method.staticMethod;
import com.yizhan.controller.app.payUtil.AlipayConfig;
import com.yizhan.controller.app.payUtil.AlipayCore;
import com.yizhan.controller.app.payUtil.UtilDate;
import com.yizhan.entity.system.Cache;
import com.yizhan.entity.system.Proprietor;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUtil;
import com.yizhan.util.MD5;
import com.yizhan.util.StringUtil;

public class test2 {

	/**
	 * 功能：
	 * 作者：lj
	 * 日期：2016-12-27
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		//String pathString = getClasspath();
		//System.out.println(pathString);
		//System.out.println(getMD5("18689538572"));
		//String jmMD5 = "96e79218965eb72c92a549dd5a330112";
		//System.out.println(convertMD5(convertMD5(jmMD5)));	 
		
		//System.out.println(StringUtil.get32UUID());
		String pathString = "E:\\111.txt";
	    Desktop.getDesktop().open(new File(pathString));  
	    
	    //Runtime mt =Runtime.getRuntime();
	    //找到相对应的绝对路径。启动记事本文件
        //File  myfile =new File("E:\\mstsc");
        // mt.exec(myfile.getAbsolutePath());
        //创建新的文件路径,启动ie浏览器
        // myfile = new File("c:\\program Files\\Internet Explorer","IEXPLORE.www.sohu.com");
        //mt.exec(myfile.getAbsolutePath()); 
	    String str = "C:\\Program Files (x86)\\Tencent\\QQ\\Bin\\QQ.exe";
	    String str2 = "E:\\mstsc.exe";
        Runtime.getRuntime().exec(str2);
		
	}
	
	//解密
	public static String convertMD5(String inStr){  
        char[] a = inStr.toCharArray();  
        for (int i = 0; i < a.length; i++){  
            a[i] = (char) (a[i] ^ 't');  
        }  
        String s = new String(a);  
        return s;  
  
    }  
	
	
	public static String getClasspath(){
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		}
		return path;
	}
	
	
	public static String getMD5(String password){
		return MD5.md5(password);
	}
	

}

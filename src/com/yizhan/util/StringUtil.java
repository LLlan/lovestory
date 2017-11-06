package com.yizhan.util;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import com.weixin.method.staticMethod;

/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	/**
	 * 得到32位的uuid
	 * @return
	 */
	public static String get32UUID(){
		
		return UuidUtil.get32UUID();
		
	}
	
	/**
	 * 获取9位随机码
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-3
	 */
	public static int get9RandomID(){
		int radomInt = new Random().nextInt(999999999);
		return radomInt;
	}
	
	/**
	 * 把页面上以get方式传到后台的中文乱码转化为utf-8格式
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-19
	 */
	public String decodeToUtf8(String str){
		String reString = "";
		if(Tools.notEmpty(str)){
			 try {
				reString= new String(str.getBytes("ISO-8859-1") , "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return reString;
	}
	
}

/* 
 * Copyright (c) 1994-2009 Routdata
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of Finalist IT Group, Inc.
 * You shall not disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into with Teamsun.
 * 
 */
package com.yizhan.util;

import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 数学运算工具类
 * <p>
 * Copyright: Copyright (c) 2008
 * </p>
 * <p>
 * Company:络道科技
 * </p>
 * 
 * @author
 * @version 1.0
 */
public class MathUtil {
    /**
     * 取最小整数 5.5 => 5
     * 
     * @author Administrator
     * 
     */
    public static int minInt(double d) {
        return (int) Math.floor(d);
    }

    /**
     * 取最大整数  5.2 => 6
     * 
     * @param d
     * @return
     */
    public static int maxInt(double d) {
        return (int) Math.ceil(d);
    }

    // public static double round2(double v, int scale) {
    // String temp = "#,##0.";
    // for (int i = 0; i < scale; i++) {
    // temp += "0";
    // }
    // String format = new java.text.DecimalFormat(temp).format(v);
    // return Double.valueOf(format).doubleValue();
    // }
    /**
     * 四舍五入方法
     */
    public static double round(double d, int scale) {
        long temp = 1;
        for (int i = scale; i > 0; i--) {
            temp *= 10;
        }
        d *= temp;
        long dl = Math.round(d);
        return (double) (dl) / temp;
    }
    /**
     * 判断是否为数字
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        if(str==null || str.trim().length()==0){
            return false;
        }
        //如果字符串中包含了.,则判断是否有多个点,
        if(str.indexOf(".")>-1){
            if(str.substring(str.indexOf(".")+1).indexOf(".")>-1){
                return false;
            }
            str = str.replaceAll("\\.","");
        }
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }
    
    /**
     * float值相加 ,对于精度使用BigDecimal处理
     * @param a
     * @param b
     * @return
     */
    public static float floatAdd(float a,float b){
        BigDecimal x= new BigDecimal(a);
        BigDecimal y = new BigDecimal(b);
        BigDecimal z = x.add(y);
        
        return z.floatValue();
    }
    
	/** 获取几位随机数 
	 * */
	public static String getRandom(int k) {
		String tmpRandom = "";
		int iRan = (int) (Math.random() * (Math.pow(10, k)));
		tmpRandom = new Integer(iRan).toString();
		String tmpSpace = "";
		if (tmpRandom.length() < k) {
			int spaceLen = k - tmpRandom.length();
			for (int i = 0; i < spaceLen; i++) {
				tmpSpace += "0";
			}
			tmpRandom = tmpSpace + tmpRandom;
		}
		return tmpRandom;
	}
	
    public static int mod(int a,int b){
    	return a%b;
    }
        
    
    public static void main(String[] args) {
//        double i = MathUtil.round(23455, 5);
//        System.out.println(i);
//        
//        System.out.println(MathUtil.isNumeric("0.1"));
        float r = MathUtil.floatAdd(4.22f,2f);
        //System.out.println(r== new Float(6.22).floatValue());
    }
}

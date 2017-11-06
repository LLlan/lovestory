package com.yizhan.test;

import java.io.IOException;
import java.security.MessageDigest;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class test {
	
	  //base64算法,解密，加密
    public static String base64Encode(String str){
        BASE64Encoder baseEncode = new BASE64Encoder();
        return baseEncode.encode(str.getBytes());//加密
    }
    

 
	public static void main(String[] args) {
		String test = "wa n\tg_p\\te\\tn　g";  
		test = test.replaceAll("\\t|\\\\t|\u0020|\\u3000", "");//去掉空格  
		System.out.println(test);  
	}

}

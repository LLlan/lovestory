package com.yizhan.util;

import java.util.UUID;

public class UuidUtil {

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
	
	
	//获取32位uuid的方法
	public static String get32uuid(){
		String uuid=UUID.randomUUID().toString().replace("-", "");
		return uuid;
	}
	
	
	
	/**
	 * 获取32位随机码
	 * 
	 * */
	public static void main(String[] args) {
		System.out.println(get32UUID());
		System.out.println(get32uuid());
	}
}


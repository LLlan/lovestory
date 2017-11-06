package com.yizhan.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.weixin.method.staticMethod;
import com.yizhan.entity.plugins.PopupWindowsPlugins;
import com.yizhan.entity.system.AppUser;
import com.yizhan.entity.system.Cache;
import com.yizhan.entity.system.CacheManager;
import com.yizhan.entity.system.Memory;
import com.yizhan.entity.system.Proprietor;
import com.yizhan.entity.system.ThreadTokenHolder;
import com.yizhan.util.Const;
import com.yizhan.util.MD5;
import com.yizhan.util.PageData;
import com.yizhan.util.StringUtil;

public class test3 {
	/**
	 * 功能：
	 * 作者：lj
	 * 日期：2017-1-3
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// System.out.println(System.getProperty("java.library.path"));
		yuyinbofang();	
		//System.out.println(MD5.md5("0000"));
		//System.out.println(StringUtil.get9RandomID());
		
		//=====================================================//
		//明密：123456  MD5加密：e10adc3949ba59abbe56e057f20f883e
		//明密：111111  MD5加密：96e79218965eb72c92a549dd5a330112
		//=====================================================//
		/*PopupWindowsPlugins tool = new PopupWindowsPlugins();
		tool.show(
			"【外卖订单新消息】",
			"你有外卖订单新消息，请注意查看！"
			);*/
		
	}
	
	public static void yuyinbofang(){
		// ？？ 这个Sapi.SpVoice是需要安装什么东西吗，感觉平白无故就来了
		//ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");
		ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");
		// Dispatch是做什么的？
		Dispatch sapo = sap.getObject();
		try {

		    // 音量 0-100
		    sap.setProperty("Volume", new Variant(100));
		    // 语音朗读速度 -10 到 +10
		    sap.setProperty("Rate", new Variant(-2));

		    Variant defalutVoice = sap.getProperty("Voice");

		    Dispatch dispdefaultVoice = defalutVoice.toDispatch();
		    Variant allVoices = Dispatch.call(sapo, "GetVoices");
		    Dispatch dispVoices = allVoices.toDispatch();

		    Dispatch setvoice = Dispatch.call(dispVoices, "Item", new Variant(1)).toDispatch();
		    ActiveXComponent voiceActivex = new ActiveXComponent(dispdefaultVoice);
		    ActiveXComponent setvoiceActivex = new ActiveXComponent(setvoice);

		    Variant item = Dispatch.call(setvoiceActivex, "GetDescription");
		    // 执行朗读
		    Dispatch.call(sapo, "Speak", new Variant("您有订单新消息，请注意查看"));
		    System.out.println("--------读了-------");
		    
		   
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    sapo.safeRelease();
		    sap.safeRelease();
		}
	}
	
	

}

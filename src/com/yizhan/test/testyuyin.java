package com.yizhan.test;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class testyuyin {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		yuyinbofang();
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

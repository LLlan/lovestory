package com.yizhan.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;



import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

import com.weixin.method.staticMethod;

/**
 * 通过短信接口发送短信
 */
public class SmsUtil {
	
	/**
	 * 功能：发送短信验证码
	 * 作者：lj
	 * 日期：2016-12-17
	 */
	public static Map sendMsM(String Tphone){
		String Request_Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		String result="";
		String phone = Tphone;
		Map map = new HashMap();
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Request_Url);
		client.getParams().setContentCharset("utf-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=utf-8");
		//生成6位随机验证码
		int mobile_code = (int)((Math.random()*9+1)*100000);
	    String content = new String("您的验证码是：" + mobile_code + "，请不要把验证码泄露给其他人。如非本人操作，可不用理会！");
	    String account = "", password = "";
	    String strSMS2 = Tools.readTxtFile(Const.SMS2);			//读取短信2配置
		if(null != strSMS2 && !"".equals(strSMS2)){
			String strS2[] = strSMS2.split(",yizhan,");
			if(strS2.length == 2){
				account = strS2[0];
				password = strS2[1];
			}
		}
	    NameValuePair[] data = {
	    		//提交短信
			    new NameValuePair("account", account), 
			    new NameValuePair("password", password), //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);
		try {
			client.executeMethod(method);
			String SubmitResult =method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();
			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			result= "验证码发送成功";
			map.put("result", result);
			map.put("yanzhengma", mobile_code+"");
			//打印
			System.out.println("-----------"+phone);
			System.out.println("-----------"+msg);
			System.out.println("-----------"+smsid);
			System.out.println("-----------"+content);

		} catch (HttpException e){
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		} catch (DocumentException e){
			e.printStackTrace();
		}	
		//返回结果
		return map;
	}
	
	
}


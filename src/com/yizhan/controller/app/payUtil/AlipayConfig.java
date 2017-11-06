package com.yizhan.controller.app.payUtil;

import com.yizhan.util.FileUtil;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：1.0
 *日期：2016-06-06
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	//合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String partner = "2088022714785785";

	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static String private_key = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANk1teNudWMJqokPnbbfdT5HBTAM4+2M3AcEweN9j2srkIboRQi+e85S0EK2usxTikTzmeV3nPCVJyjJmF0P4yrA3Mkaz5MtCJRB9kRVt3YizTToKF6TMglkDJgcO26Wvb7EMAgEi4JP0SG458KmxC416lGh6zS+uyl5b8pTefL9AgMBAAECgYBN0Q87zpvhgloFRoHzPTUsvZbfMw8JUNiW7x5jWN1jwLTDkD0DN/L05PhVnk9n2loD/93XtrWT/2uLEkYyuPlh88TTW8I5SSY/5GTeGzH/rOvcgh/YWVzBXDEoavfm0dSOv8PXgGH+fO3LHzewosRLwBbOE4RG9r1uhUXGP3ifYQJBAO2e7W6CidNYWEXBUgXJL5qxeQjWZnGLXYX4zIc1/SRRiYUz+0M7+r/QRNM2wZcgQU3KEE8AZW2GQN+oqHH17JUCQQDqAqExJCBq9BisT0MEqemwwA3BuYCeEXN0PmCK3eNYrP1MIKkQMOoQdrSySLyl/5hhM6aDtLaIn8fOfg1m1+rJAkAPM+ja9i0dQXy8UccOqbWK/ynQP+9j+lesd6OWTwT4KuNSi2XbAl5joU6V+N3f7mdfM7thYpQassk5xg+o4uQVAkEAx3/2bC6gdI4lesEYIaG52TXihIXhYOD/zNpg9AK3D6JrT7uIZoVNBzwsUNIyAlMlVbjy/NXTyCZv8VsFkegCAQJAA6VcK8qj6y+cKHuwJXs36vJrwgTJ2KhgzTBsHZfjcxAICB232ssUs7c0JoDhIFk19u/xFFOyaiIBveqUozawvQ==";
	
	//支付宝的公钥，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String alipay_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
	
	// 签名方式
	public static String sign_type = "RSA";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String log_path ="E://alipayLogs//"; 
		
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";

	// 接收通知的接口名
	public static String service = "http://192.168.0.102:8080/XiaoQufw/api/appCall/callbacks.do";
	//http://192.168.0.102:8080/XiaoQufw/api/appCall/callbacks.do
	
	//APPID
    public static String app_id="2016110802643529";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
}


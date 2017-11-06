package com.yizhan.controller.wxpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.controller.wxpay.utils.CommonUtil;
import com.yizhan.controller.wxpay.utils.GetWxOrderno;
import com.yizhan.controller.wxpay.utils.RequestHandler;
import com.yizhan.controller.wxpay.utils.Sha1Util;
import com.yizhan.controller.wxpay.utils.TenpayUtil;
import com.yizhan.entity.information.Member;
import com.yizhan.service.information.KeHuService;
import com.yizhan.service.system.membercost.MemberCostService;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.RoundUtil;

@Controller
@RequestMapping("/api/wxpay")
public class Wxpay extends BaseController{
	//double保留两位小数
	private DecimalFormat df = new DecimalFormat("#0.00");
	@Resource(name="keHuService")
	private KeHuService keHuService;
	@Resource(name="memberCostService")
	private MemberCostService memberCostService;
	
	@RequestMapping(value="/pay")
	public ModelAndView topay(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
        //商户订单号
      	String out_trade_no = getorder_number();
      	
      	//保存临时信息
    	PageData temp=new PageData();
      	temp.put("temp_id", this.get32UUID());
      	temp.put("order_number", out_trade_no);
      	temp.put("member_id", request.getParameter("id"));
      	keHuService.save_tb_temp_information(temp);
      	
      	//获取会员费用
      	PageData membercostData=memberCostService.getDataOfMemberCost(temp);
      	String WIDtotal_fee=membercostData.getString("cost");
      	
		//网页授权后获取传递的参数
		String code = request.getParameter("code");//获取code,跟据code可以获取openid
		//金额转化为分为单位
		float sessionmoney = Float.parseFloat(WIDtotal_fee);
		String finalmoney = String.format("%.2f", sessionmoney);
		finalmoney = finalmoney.replace(".", "");
		int total_fee = Integer.parseInt(finalmoney);
		System.out.println("++++++++++++++++++++++所支付的金额（以分为单位）="+total_fee);
		//商品描述根据情况修改
		String body = "爱情故事：购买服务";
		
		//商户相关资料
		String appid = "wx319d00741c369e14";//开发者ID
		String appsecret = "3ca72e5c5bcf12c414ea83e86b98a6d7";//开发者密码	
		String mch_id = "1404019202";//商户号
		String partnerkey = "beijingaiqinggushi14040192028888";//商户平台api秘钥
		
		String openid ="";
		String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
		
		JSONObject jsonObject = CommonUtil.httpsRequest(URL, "GET", null);
		if (null != jsonObject) {
			openid = jsonObject.getString("openid");
		}
		
		//随机数 
		String nonce_str = TenpayUtil.getCurrTime().substring(8, TenpayUtil.getCurrTime().length()) + TenpayUtil.buildRandom(4) + "";
		//交易类型
		String trade_type = "JSAPI";
		//订单生成的机器 IP(终端IP)
		String spbill_create_ip = request.getRemoteAddr();
		//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url ="http://www.bjaqgshlw.com/lovestory/api/wxpay/notify_url";
		//String notify_url ="http://lnlcjf.com/yzlfd/api/wxpay/notify_url";
		
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);  
		packageParams.put("mch_id", mch_id);  
		packageParams.put("nonce_str", nonce_str);  
		packageParams.put("body", body);  
		packageParams.put("out_trade_no", out_trade_no);  
		
		//这里写的金额为1 分到时修改
		packageParams.put("total_fee", total_fee+"");  
		packageParams.put("spbill_create_ip", spbill_create_ip);  
		packageParams.put("notify_url", notify_url);  
		packageParams.put("trade_type", trade_type);  
		packageParams.put("openid", openid);  

		RequestHandler reqHandler = new RequestHandler(request, response);
		reqHandler.init(appid, appsecret, partnerkey);
		//获取签名
		String sign = reqHandler.createSign(packageParams);
		String xml="<xml>"+
				"<appid>"+appid+"</appid>"+
				"<mch_id>"+mch_id+"</mch_id>"+
				"<nonce_str>"+nonce_str+"</nonce_str>"+
				"<sign>"+sign+"</sign>"+
				"<body><![CDATA["+body+"]]></body>"+
				"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
				"<total_fee>"+total_fee+"</total_fee>"+
				"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
				"<notify_url>"+notify_url+"</notify_url>"+
				"<trade_type>"+trade_type+"</trade_type>"+
				"<openid>"+openid+"</openid>"+
				"</xml>";
		System.out.println("---xml内容为++++++++++++++++++++++--"+xml);
		// 获取package的签名包
		/*String allParameters = "";
		try {
			allParameters =  reqHandler.genPackage(packageParams);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		String prepay_id="";
		try {
			prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
			if(prepay_id.equals("")){
				System.out.println("++++++++++++++++++++prepay_id为空+++++++++++++++++++++++");
			}
		} catch (Exception e1) {
			System.out.println("++++++++++++++++++++获取prepay_id时，捕捉异常+++++++++++++++++++++++");
			e1.printStackTrace();
		}
		SortedMap<String, String> finalpackage = new TreeMap<String, String>();
		String timestamp = Sha1Util.getTimeStamp();
		String packages = "prepay_id="+prepay_id;
		finalpackage.put("appId", appid);  
		finalpackage.put("timeStamp", timestamp);  
		finalpackage.put("nonceStr", nonce_str);  
		finalpackage.put("package", packages);  
		finalpackage.put("signType", "MD5");
		String finalsign = reqHandler.createSign(finalpackage);
		System.out.println("+++++++++++++各种信息++++++++++++++++++++++++++++++++appid="+appid+"&timeStamp="+timestamp+"&nonceStr="+nonce_str+"&package="+packages+"&sign="+finalsign);
		mv.addObject("appid", appid);
		mv.addObject("timeStamp", timestamp);
		mv.addObject("nonceStr", nonce_str);
		mv.addObject("packages", packages);//package是关键字，所以这里用packages
		mv.addObject("sign", finalsign);
		mv.setViewName("pay");
		return mv;
	}
	//异步接收微信支付结果通知的回调地址
	@RequestMapping(value="/notify_url")
	public void notify_url(HttpServletRequest request,HttpServletResponse response) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream)request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        //sb为微信返回的xml
        //转换为map
		Map map = GetWxOrderno.doXMLParse(sb.toString());
		System.out.println("=========notify_url+map======="+map);
		
		//验证是否成功
		if(map.get("return_code").equals("SUCCESS")){
			System.out.println("验证成功");
			//验证交易结果是否成功
			if(map.get("result_code").equals("SUCCESS")){
				System.out.println("交易成功");
				PageData pd=new PageData();
				
				String out_trade_no=(String) map.get("out_trade_no");//商户订单编号
				String transaction_id=(String) map.get("transaction_id");//微信支付订单号
				String total_fee=(String) map.get("total_fee");//订单金额（单位为分）
				
				//获取临时信息
				pd.put("order_number", out_trade_no);
				PageData temp=keHuService.get_tb_temp_information(pd);
				
				//保存订单信息
				PageData orderPageData=new PageData();
				orderPageData.put("order_id", this.get32UUID());
				orderPageData.put("member_id", temp.getString("member_id"));
				orderPageData.put("create_order_time", DateUtil.getTime());
				orderPageData.put("order_number", out_trade_no);
				orderPageData.put("money", df.format(Float.parseFloat(total_fee)/100));
				
				keHuService.saveOrder(orderPageData);
				
				//改变会员状态
				PageData pd1=new PageData();
				pd1.put("member_id", temp.getString("member_id"));
				pd1.put("member_type", "1");
				
				keHuService.updateMemberType(pd1);
				
				//推荐分销部分(判断该会员是否被推荐进来的)
				PageData tuijianData=new PageData();
				tuijianData.put("beituijian_user_id", temp.getString("member_id"));
				tuijianData=keHuService.getTuiJianInfoBybtjuid(tuijianData);
				
				if(tuijianData!=null){//不为空说明该用户是被别人推荐过来的,则该用户的推荐人,得到一定的佣金
					//改变推荐人的余额以及总收入
					PageData tuijianren=new PageData();
					tuijianren.put("member_id", tuijianData.getString("tuijian_user_id"));
					tuijianren=keHuService.getMemberDetailByID(tuijianren);
					
					double usable_money=Double.parseDouble(tuijianren.getString("usable_money"))+Double.parseDouble(tuijianData.getString("money"));
					double total_money=Double.parseDouble(tuijianren.getString("total_money"))+Double.parseDouble(tuijianData.getString("money"));
					
					tuijianren.put("usable_money", RoundUtil.fixd2(usable_money));
					tuijianren.put("total_money", RoundUtil.fixd2(total_money));
					
					keHuService.updateUsable_money(tuijianren);
					
					//改变推荐记录的状态0变为1
					tuijianData.put("state", "1");
					keHuService.updateTuiJianState(tuijianData);
				}
			}
		}else{
			System.out.println("验证失败return_msg:"+map.get("return_msg"));
		}
		response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
	}
	public static void main(String[] args) throws IOException {
		String appid = "wx07df4a5caaf79650";
		//String backUri = "http://192.168.1.88:8080/yzlfd/api/wxpay/abcde.do";
		String backUri = "http://www.0898yzzx.com/yzlfd/api/wxpay/topay?code&state";
		//String backUri = "http://ceshi.ijuying.com/";
		//授权后要跳转的链接所需的参数一般有会员号，金额，订单号之类，
		//最好自己带上一个加密字符串将金额加上一个自定义的key用MD5签名或者自己写的签名,
		//比如 Sign = %3D%2F%CS% 
		String orderNo=appid+Sha1Util.getTimeStamp();
		//backUri = backUri+"?userId=b88001&orderNo="+orderNo+"&describe=test&money=0.01";
		//backUri = backUri+"?orderNo="+orderNo+"&describe=test&money=0.01";
		//URLEncoder.encode 后可以在backUri 的url里面获取传递的所有参数
		backUri = URLEncoder.encode(backUri);
		//scope 参数视各自需求而定，这里用scope=snsapi_base 不弹出授权页面直接授权目的只获取统一支付接口的openid
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
				"appid=" + appid+
				"&redirect_uri=" +
				 backUri+
				"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		//String url = "https://open.weixin.qq.com/connect/qrconnect?appid="+appid+"&redirect_uri="+backUri+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		System.out.println(getorder_number());
	}
	/**
	 * 获取订单编号
	 * @return
	 */
	public static String getorder_number(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String serial_number=sdf.format(new Date())+(int)((Math.random()*9+1)*100000);
		return serial_number;
	}
}

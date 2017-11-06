package com.yizhan.controller.information;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hp.hpl.sparta.xpath.ThisNodeTest;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.information.KeHuService;
import com.yizhan.service.information.MemberManageService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.MD5;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.Tools;

/**
 * 功能：后台会员管理
 * @author zjh
 *
 */
@Controller
@RequestMapping(value="/memberManage")
public class MemberManageController extends BaseController{
	
	@Resource(name="memberManageService")
	private MemberManageService memberManageService;
	@Resource(name="keHuService")
	private KeHuService keHuService;
	/**
	 * 获取会员列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getMemberlistPage")
	public ModelAndView getMemberlistPage(Page page) throws Exception{
		logBefore(logger, "---获取会员列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=memberManageService.getMemberlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/memberManger/memberList_list");
		return mv;
	}
	
	/**
	 * 改变账号状态操作
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateMemberStatus")
	public void updateMemberStatus(PrintWriter writer) throws Exception{
		logBefore(logger, "---改变账号状态操作--");
		PageData pd=new PageData();
		pd=this.getPageData();
		memberManageService.updateMemberStatus(pd);
		writer.close();
	}
	/**
	 * 获取会员基本信息
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getInformationOfMemberById")
	@ResponseBody
	public Object getInformationOfMemberById() throws Exception{
		logBefore(logger, "---获取基本信息--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=memberManageService.getInformationOfMemberById(pd);
		if(Tools.isEmpty(pd.getString("birthday"))){
			pd.put("age", "");
		}else{
			pd.put("age", DateUtil.getAge(pd.getString("birthday")));
		}
		map.put("pd", pd);
		System.out.println("获取基本信息pd:"+pd);
 		return AppUtil.returnObject(pd, map);
	}
	
	
	
	
	/**
	 * 获取提现申请列表（后台）
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getwithdrawcashlistPage")
	public ModelAndView getwithdrawcashlistPage(Page page) throws Exception{
		logBefore(logger, "---获取提现申请列表（后台）--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=memberManageService.getwithdrawcashlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/memberManger/withdrawcash_list");
		return mv;
	}
	/**
	 * 改变提现申请状态（后台）
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateWithDrawCashState")
	public ModelAndView updateWithDrawCashState(
			@RequestParam(required=false) MultipartFile imgPatnFile,
			String withdraw_cash_id,
			String caozuoName,
			String type
			) throws Exception {
		logBefore(logger, "---改变提现状态--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		
		if(imgPatnFile!=null && !imgPatnFile.isEmpty()){
			//上传图片
			String imgPath=Const.FILEPATHIMG+"tixian/"+DateUtil.getDays()+"/";
			String path=PathUtil.getClasspath()+imgPath;
			String imgPathName=FileUpload.fileUp(imgPatnFile, path, this.get32UUID());
				
			pd.put("imgPath", imgPath+imgPathName);
		}
		
		pd.put("feedback_time", DateUtil.getTime());
		pd.put("caozuoName", caozuoName);
		pd.put("state", "1");
		pd.put("withdraw_cash_id", withdraw_cash_id);
		memberManageService.updateWithDrawCashState(pd);
		mv.setViewName("redirect:/memberManage/getwithdrawcashlistPage.do?state=2");
		return mv;
	}

	/**
	 * 会员缴费列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getmemberorderlistPage")
	public ModelAndView getmemberorderlistPage(Page page) throws Exception{
		logBefore(logger, "---会员缴费列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=memberManageService.getmemberorderlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/memberManger/memberorder_list");
		return mv;
	}
	
	
	
	/*
	 * 导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/exportExcel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			
			titles.add("用户名"); 		//1 phone
			titles.add("昵称");  		    //2 nicheng
			titles.add("会员类型");		//3 member_type  '会员类型（0-普通会员，1-缴费会员）'
			titles.add("身份");			//4 identity '身份（1-单身会员2-月老红娘）'
			
			//基本信息
			titles.add("姓名");			//5 xingming
			titles.add("性别");			//6 sex '性别(1-男2-女)'
			titles.add("生日");		    //7 birthday
			titles.add("身高(cm)");		//8 shengao
			titles.add("体重(kg)");		//9 tizhong
			titles.add("学历");			//10 xueli
			titles.add("婚否情况");		//11 isHun
			
			//联系方式
			titles.add("手机号");		    //12 link_phone
			titles.add("微信");		    //13 weixin
			titles.add("QQ");		    //14 qq
			titles.add("Email");		//15 email
			
			//择偶标准
			titles.add("择偶标准--年龄");	//16 zo_age
			titles.add("择偶标准--身高");	//17 zo_shengao
			titles.add("择偶标准--学历");	//18 zo_xueli
			titles.add("择偶标准--婚姻状况");	//19 zo_isHun
			
			//其他信息
			titles.add("民族");			//20 minzu
			titles.add("户口所在地");		//21 hukouszd
			titles.add("居住地");			//22 juzhudi
			titles.add("是否是独生子女");	//23 isOnly
			titles.add("职业");			//24 zhiye
			titles.add("年薪");			//25 nianxin
			titles.add("毕业院校");		//26 biyeyx
			titles.add("房车情况");		//27 isFngCar
			titles.add("父母健在情况");		//28 isParent
			
			titles.add("注册时间");	    //29 registerTime
			titles.add("最近登录时间");	    //30 last_login_time
			titles.add("账号状态");	    //31 status
			titles.add("自我介绍");	    //32 ziwojieshao
			titles.add("兴趣爱好");	    //33 xingqu
			
			
			dataMap.put("titles", titles);
			
			List<PageData> userList = memberManageService.listAllMember(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<userList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", userList.get(i).getString("phone"));		
				vpd.put("var2", userList.get(i).getString("nicheng"));		
				vpd.put("var3", userList.get(i).getString("member_type").equals("0")?"普通会员":"缴费会员");			
				vpd.put("var4", userList.get(i).getString("identity").equals("1")?"单身会员":"月老红娘");	
				vpd.put("var5", userList.get(i).getString("xingming"));		
				vpd.put("var6", userList.get(i).getString("sex").equals("1")?"男":"女");		
				vpd.put("var7", userList.get(i).getString("birthday"));	
				vpd.put("var8", userList.get(i).getString("shengao"));			
				vpd.put("var9", userList.get(i).getString("tizhong"));		
				vpd.put("var10", userList.get(i).getString("xueli"));		
				vpd.put("var11", userList.get(i).getString("isHun"));			
				vpd.put("var12", userList.get(i).getString("link_phone"));	
				vpd.put("var13", userList.get(i).getString("weixin"));		
				vpd.put("var14", userList.get(i).getString("qq"));		
				vpd.put("var15", userList.get(i).getString("email"));	
				vpd.put("var16", userList.get(i).getString("zo_age"));			
				vpd.put("var17", userList.get(i).getString("zo_shengao"));		
				vpd.put("var18", userList.get(i).getString("zo_xueli"));		
				vpd.put("var19", userList.get(i).getString("zo_isHun"));			
				vpd.put("var20", userList.get(i).getString("minzu"));	
				vpd.put("var21", userList.get(i).getString("hukouszd"));		
				vpd.put("var22", userList.get(i).getString("juzhudi"));		
				vpd.put("var23", userList.get(i).getString("isOnly"));	
				vpd.put("var24", userList.get(i).getString("zhiye"));			
				vpd.put("var25", userList.get(i).getString("nianxin"));		
				vpd.put("var26", userList.get(i).getString("biyeyx"));		
				vpd.put("var27", userList.get(i).getString("isFngCar"));			
				vpd.put("var28", userList.get(i).getString("isParent"));	
				vpd.put("var29", userList.get(i).getString("registerTime"));		
				vpd.put("var30", userList.get(i).getString("last_login_time"));		
				vpd.put("var31", userList.get(i).getString("status").equals("1")?"正常":"禁用");	
				vpd.put("var32", userList.get(i).getString("ziwojieshao"));			
				vpd.put("var33", userList.get(i).getString("xingqu"));			
				varList.add(vpd);
			}
			
			dataMap.put("varList", varList);
			
			ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
			
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
//后台注入会员
	@RequestMapping(value="/toMemberAdd")
	public ModelAndView toMemberAdd(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("information/memberManger/member_add");
		return mv;
	}
	
	@RequestMapping(value="/saveMember")
	@ResponseBody
	public Object saveMember(HttpServletRequest request) throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String str1="";//格式错误的
		String str2="";//已经存在的
		
		//获取会员用户名
		String[] str=pd.getString("phone").trim().replaceAll("，", ",").split(",");
		for (int i = 0; i < str.length; i++) {
			//1.判断是否合法
			if(isChinaPhoneLegal(str[i])){
				//2.判断是否存在
				PageData pData=new PageData();
				pData.put("phone", str[i]);
				pData.put("identity", pd.getString("identity"));
				PageData pData2=keHuService.getDataOfMemberByPhone(pData);
				
				if(pData2==null){
					//保存会员信息
					PageData temp=new PageData();
					temp.put("member_id", this.get32UUID());//主键ID
					temp.put("phone", str[i]);//手机号
					temp.put("link_phone", str[i]);//手机号
					temp.put("identity", pd.getString("identity"));//身份
					temp.put("password", MD5.md5("123456"));//密码
					temp.put("registerTime", DateUtil.getTime());//注册时间	
					temp.put("last_login_time", DateUtil.getTime());//最近登陆时间	
					temp.put("ip", request.getRemoteHost());//ip地址	
					temp.put("status", "1");//1 使用中 0 已停用
					temp.put("member_type", "1");
					temp.put("bz", "手机用户");
					keHuService.insertMember(temp);
				}else{
					if(Tools.isEmpty(str1)){
						str2=str[i];
					}else{
						str2=str2+","+str[i];
					}
				}
			}else{
				if(Tools.isEmpty(str1)){
					str1=str[i];
				}else{
					str1=str1+","+str[i];
				}
			}
			
		}
		map.put("str1", str1);
		map.put("str2", str2);
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出已付款会员信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/exportExcelOfYfkhy")
	public ModelAndView exportExcelOfYfkhy(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			
			titles.add("用户名"); 		//1 
			titles.add("会员姓名");  		//2 
			titles.add("身份");			//3 
			titles.add("订单创建时间");		//4 
			titles.add("订单编号");		//5 
			titles.add("费用");		    //6 
			
			dataMap.put("titles", titles);
			
			List<PageData> userList = memberManageService.listAllMemberOfYfkhy(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<userList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", userList.get(i).getString("phone"));		
				vpd.put("var2", userList.get(i).getString("xingming"));		
				vpd.put("var3", userList.get(i).getString("identity").equals("1")?"单身会员":"月老红娘");	
				vpd.put("var4", userList.get(i).getString("create_order_time"));		
				vpd.put("var5", userList.get(i).getString("order_number"));		
				vpd.put("var6", userList.get(i).getString("money"));	
				varList.add(vpd);
			}
			
			dataMap.put("varList", varList);
			
			ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
			
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/*
	 * 导出提现申请列表信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/exportExcelOfHytx")
	public ModelAndView exportExcelOfHytx(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			
			titles.add("用户名"); 		//1 
			titles.add("身份");  			//2 
			titles.add("提现金额");		//3 
			titles.add("申请时间");		//4 
			titles.add("提现方式");		//5 
			titles.add("提现账号");		//6 
			titles.add("真实姓名");		//7 
			if(pd.getString("state").equals("1")){
				titles.add("操作人名称");		//8 
			}
			
			
			dataMap.put("titles", titles);
			
			List<PageData> userList = memberManageService.listAllMemberOfHytx(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<userList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", userList.get(i).getString("phone"));		
				vpd.put("var2", userList.get(i).getString("identity").equals("1")?"单身会员":"月老红娘");	
				vpd.put("var3", userList.get(i).getString("amount"));		
				vpd.put("var4", userList.get(i).getString("shenqing_time"));		
				vpd.put("var5", userList.get(i).getString("tixian_method").equals("1")?"支付宝":"银行卡");		
				vpd.put("var6", userList.get(i).getString("account"));	
				vpd.put("var7", userList.get(i).getString("realName"));	
				
				if(pd.getString("state").equals("1")){
					vpd.put("var8", userList.get(i).getString("caozuoName"));	
				}
				varList.add(vpd);
			}
			
			dataMap.put("varList", varList);
			
			ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
			
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/** 
     * 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数 
     * 此方法中前三位格式有： 
     * 13+任意数 
     * 15+除4的任意数 
     * 18+除1和4的任意数 
     * 17+除9的任意数 
     * 147 
     */  
    public static boolean isChinaPhoneLegal(String str) throws PatternSyntaxException {  
        //String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";  
        String regExp = "^(1[0-9][0-9])\\d{8}$";  
        Pattern p = Pattern.compile(regExp);  
        Matcher m = p.matcher(str);  
        return m.matches();  
    }  
  
    /** 
     * 香港手机号码8位数，5|6|8|9开头+7位任意数 
     */  
    public static boolean isHKPhoneLegal(String str)throws PatternSyntaxException {  
        String regExp = "^(5|6|8|9)\\d{7}$";  
        Pattern p = Pattern.compile(regExp);  
        Matcher m = p.matcher(str);  
        return m.matches();  
    }  
}

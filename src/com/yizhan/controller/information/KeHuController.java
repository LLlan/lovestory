package com.yizhan.controller.information;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.information.Member;
import com.yizhan.service.information.HeadNewsService;
import com.yizhan.service.information.KeHuService;
import com.yizhan.service.system.contactus.ContactUsService;
import com.yizhan.service.system.pictures.PicturesService;
import com.yizhan.service.system.yongjin.YongJinService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileUpload;
import com.yizhan.util.FileUtil;
import com.yizhan.util.MD5;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.QRCodeUtil;
import com.yizhan.util.RoundUtil;
import com.yizhan.util.SmsUtil;
import com.yizhan.util.Tools;

/**
 * 爱情故事会员
 *
 */
@Controller
@RequestMapping(value="/api/member")
public class KeHuController extends BaseController{
	public static final String IMGPATH = "head/";	//图片上传路径
	public static final String zpq = "zpq/";	//图片上传路径
	
	@Resource(name="keHuService")
	private KeHuService keHuService;
	@Resource(name="picturesService")
	private PicturesService picturesService;
	@Resource(name="headNewsService")
	private HeadNewsService headNewsService;
	@Resource(name="contactUsService")
	private ContactUsService contactUsService;
	@Resource(name="yongJinService")
	private YongJinService yongJinService;
	
	
	/**
	 * 中转站页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/transfer")
	public ModelAndView transfer() throws Exception {
		logBefore(logger, "---中转站--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/zhaoyiwang/zywkehuduan/transfer");
		return mv;
	}
	
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView login_toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login2");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * main页面
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main() throws Exception {
		logBefore(logger, "---main页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/login/main");
		return mv;
	}
	//TODO 去推荐列表页
	/**
	 * 去推荐列表页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toTuiJian")
	public ModelAndView toTuiJian() throws Exception {
		logBefore(logger, "---去推荐列表页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> tuijianlList=keHuService.getTuiJianList(pd);
		mv.addObject("tuijianlList", tuijianlList);
		mv.setViewName("information/center/tuijianNum");
		return mv;
	}
	//TODO 我的佣金
	/**
	 * 去我的佣金主页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toMainYongJin")
	public ModelAndView toMainYongJin() throws Exception {
		logBefore(logger, "---去我的佣金主页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=keHuService.getMemberDetailByID(pd);
		mv.addObject("pd", pd);
		mv.setViewName("information/center/myYongjin");
		return mv;
	}
	
	/**
	 * 去赚取佣金记录页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toYongJing")
	public ModelAndView toYongJing() throws Exception {
		logBefore(logger, "---去赚取佣金记录页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> tuijianlList=keHuService.getTuiJianList(pd);
		mv.addObject("tuijianlList", tuijianlList);
		mv.setViewName("information/center/makeMoney");
		return mv;
	}
	
	/**
	 * 提现记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toTiXianInfo")
	public ModelAndView toTiXianInfo() throws Exception {
		logBefore(logger, "---提现记录--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> cashList=keHuService.getWithDrawCashList(pd);
		mv.addObject("cashList", cashList);
		mv.setViewName("information/center/tixianRecord");
		return mv;
	}
	/**
	 * 去提现页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toTiXian")
	public ModelAndView toTiXian() throws Exception {
		logBefore(logger, "---去提现页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=keHuService.getMemberDetailByID(pd);
		mv.addObject("pd", pd);
		mv.setViewName("information/center/tixian");
		return mv;
	}
	/**
	 * 提现
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveWithDrawCash")
	public ModelAndView saveWithDrawCash() throws Exception {
		logBefore(logger, "---提现--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//计算余额
		PageData mempd=keHuService.getMemberDetailByID(pd);
		double balance_amount=Double.parseDouble(mempd.getString("usable_money"))-Double.parseDouble(pd.getString("amount"));
		
		//保存提现记录
		PageData cashData=new PageData();
		cashData.put("withdraw_cash_id", this.get32UUID());
		cashData.put("amount", pd.getString("amount"));
		cashData.put("shenqing_time", DateUtil.getTime());
		cashData.put("balance_amount", RoundUtil.fixd2(balance_amount));
		cashData.put("state", "2");
		cashData.put("tixian_method", pd.getString("type"));
		cashData.put("realName", pd.getString("realName"));
		cashData.put("account", pd.getString("account"));
		cashData.put("member_id", pd.getString("member_id"));
		
		keHuService.saveWithDrawCash(cashData);
		
		//更新会员的可用余额
		PageData memberData=new PageData();
		memberData.put("member_id", pd.getString("member_id"));
		memberData.put("usable_money", RoundUtil.fixd2(balance_amount));
		keHuService.updateUsable_money(memberData);
		
		mv.setViewName("redirect:/api/member/toMainYongJin?member_id="+pd.getString("member_id"));
		return mv;
	}
	//TODO 搜索功能
	/**
	 * 去条件搜索页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toSearch")
	public ModelAndView toSearch() throws Exception {
		logBefore(logger, "---去条件搜索页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/first/search");
		return mv;
	}
	/**
	 * 搜索
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	public ModelAndView search() throws Exception {
		logBefore(logger, "---搜索--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData tempData=new PageData();
		
		//条件-性别
		tempData.put("sex", pd.getString("sex"));
		//条件-年龄
		if(Tools.notEmpty(pd.getString("age"))){
			String ageString[]=pd.getString("age").split("-");
			tempData.put("age1", ageString[0]);
			tempData.put("age2", ageString[1]);
		}
		//条件-居住地
		tempData.put("juzhudi", pd.getString("juzhudi"));
		//条件-身高
		if(Tools.notEmpty(pd.getString("shengao"))){
			String shengaoString[]=pd.getString("shengao").split("-");
			tempData.put("shengao1", shengaoString[0]);
			tempData.put("shengao2", shengaoString[1]);
		}
		//条件-收入
		tempData.put("nianxin", pd.getString("nianxin"));
		//条件-学历
		tempData.put("xueli", pd.getString("xueli"));
		
		List<PageData> memberList=keHuService.getMemberList(tempData);
		mv.addObject("memberList", memberList);
		mv.setViewName("information/first/searchResult");
		return mv;
	}
	
	//TODO 首页
	/**
	 * 去首页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() throws Exception {
		logBefore(logger, "---去首页--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取轮播图
		List<PageData> lunboList=picturesService.listAll(pd);
		mv.addObject("lunboList", lunboList);
		
		//获取头条新闻
		List<PageData> headnewsList=headNewsService.headNewsList(pd);
		mv.addObject("headnewsList", headnewsList);
		
		if(Tools.notEmpty(pd.getString("type"))){
			if(pd.getString("type").equals("2")){
				pd.put("sex", "2");
				mv.setViewName("information/index1");
			}else if(pd.getString("type").equals("4")){
				pd.put("xy", "xy");
				mv.setViewName("information/index2");
			}else{
				pd.put("sex", "1");
				mv.setViewName("information/index");
			}
		}else{
			pd.put("sex", "1");
			mv.setViewName("information/index");
		}
		
		List<PageData> memberList=new ArrayList<PageData>();
		pd.put("pageNum", 0);
		pd.put("pageSize", Const.pageSize);
		List<PageData> memberList1=keHuService.getMemberList(pd);
		if(memberList1.size()>0){
			for(PageData p:memberList1){
				p.put("age", DateUtil.getAge(p.getString("birthday")));
				memberList.add(p);
			}
		}
		mv.addObject("memberList", memberList);
		mv.addObject("pd", pd);
		//mv.setViewName("information/index");
		return mv;
	}
	
	/**
	 * 获取会员列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getMemberList")
	@ResponseBody
	public Object getMemberList() throws Exception{
		logBefore(logger, "---获取会员列表--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		if(pd.getString("type").equals("1")){
			pd.put("sex", "1");
		}else if(pd.getString("type").equals("2")){
			pd.put("sex", "2");
		}else if(pd.getString("type").equals("3")){
			pd.put("qn", "qn");
		}else{
			pd.put("xy", "xy");
		}
		pd.put("pageNum", (Integer.parseInt(pd.getString("pageNum"))-1)*Const.pageSize);
		pd.put("pageSize", Const.pageSize);
		List<PageData> memberList=new ArrayList<PageData>();
		List<PageData> memberList1=keHuService.getMemberList(pd);
		if(memberList1.size()>0){
			for(PageData p:memberList1){
				p.put("age", DateUtil.getAge(p.getString("birthday")));
				memberList.add(p);
			}
		}
		map.put("memberList", memberList);
		
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 进入详情页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/memberDetail")
	public ModelAndView memberDetail() throws Exception {
		logBefore(logger, "---进入详情页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> imgPathList=new ArrayList<PageData>();
		//获取会员信息
		pd=keHuService.memberDetail(pd);
		if(Tools.notEmpty(pd.getString("imgPaths"))){
			String imgPaths[]=pd.getString("imgPaths").split(",");
			for (int i = 0; i < imgPaths.length; i++) {
				PageData tempData=new PageData();
				tempData.put("imgPath", imgPaths[i]);
				imgPathList.add(tempData);
			}
		}
		
		//获取被查看会员的生日,计算年龄
		pd.put("age", DateUtil.getAge(pd.getString("birthday")));
		/*if(!pd.getString("age").equals(DateUtil.getAge(pd.getString("birthday")))){
			pd.put("age", DateUtil.getAge(pd.getString("birthday")));
			keHuService.updateMemberAgeById(pd);
		}*/
		
		//判断用户是否登录,获取用户的状态--是否缴费
		if(isSession()){
			PageData sessionuserData=new PageData();
			sessionuserData.put("member_id", getSessionUser().getMember_id());
			sessionuserData=keHuService.getMemberDetailByID(sessionuserData);
			mv.addObject("member_type", sessionuserData.getString("member_type"));
		}
		pd.put("imgPathList", imgPathList);
		mv.addObject("pd", pd);
		mv.setViewName("information/first/personXiangqing");
		return mv;
	}
	
	/**
	 * 单身男女
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/singlemw")
	public ModelAndView singlemw() throws Exception {
		logBefore(logger, "---单身男女--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取默认男会员
		pd.put("sex", "1");
		List<PageData> memberList=keHuService.getMemberList(pd);
		mv.addObject("memberList", memberList);
		mv.setViewName("information/single/single");
		return mv;
	}
	
	/**
	 * 联系我们
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-19
	 */
	@RequestMapping(value = "/contact")
	public ModelAndView contact() throws Exception {
		logBefore(logger, "---联系我们--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=contactUsService.getDataOfContactUs(pd);
		mv.addObject("pd", pd);
		mv.setViewName("information/contact/contact");
		return mv;
	}
	//TODO 我的个人中心
	/**
	 * 功能：我的个人中心
	 * 作者：lj
	 * 日期：2017-7-19
	 */
	@RequestMapping(value = "/my_center")
	public ModelAndView singleMy() throws Exception {
		logBefore(logger, "---我的个人中心--");
		ModelAndView mv = new ModelAndView();
		if(isSession()){
			PageData pd = new PageData();
			pd = this.getPageData();
			
			List<PageData> imgPathList=new ArrayList<PageData>();
			//获取会员信息
			pd.put("member_id", getSessionUser().getMember_id());
			pd=keHuService.memberDetail(pd);
			if(Tools.notEmpty(pd.getString("imgPaths"))){
				String imgPaths[]=pd.getString("imgPaths").split(",");
				for (int i = 0; i < imgPaths.length; i++) {
					PageData tempData=new PageData();
					tempData.put("imgPath", imgPaths[i]);
					imgPathList.add(tempData);
				}
			}
			pd.put("imgPathList", imgPathList);
			mv.addObject("pd", pd);
			
			mv.setViewName("information/center/my_center");
		}else{
			mv.setViewName("redirect:/api/member/toLogin");
		}
		
		return mv;
	}
	
	/*
	 * 我的二维码
	 */
	@RequestMapping(value = "/myerweima")
	public ModelAndView myerweima() throws Exception {
		logBefore(logger, "---我的二维码--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = keHuService.getMemberDetailByID(pd);
		mv.addObject("erweima", pd.getString("erweima"));
		mv.setViewName("information/center/twoweima");
		return mv;
	}
	/*
	 * 个人资料页面
	 */
	@RequestMapping(value = "/gerenziliao")
	public ModelAndView gerenziliao() throws Exception {
		logBefore(logger, "---个人资料--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(isSession()){
			//个人信息
			pd.put("member_id", getSessionUser().getMember_id());
			pd = keHuService.getMemberDetailByID(pd);
			mv.addObject("pd", pd);
			
			//照片墙
			List<PageData> zpqlList=keHuService.getZpqImgPaths(pd);
			mv.addObject("zpqlList", zpqlList);
			
			if(pd.getString("identity").equals("1")){
				mv.setViewName("information/center/single_info");
			}else {
				mv.setViewName("information/center/red_info");
			}
		}else{
			mv.setViewName("redirect:/api/member/toLogin.do");
		}
		return mv;
	}
	/**
	 * 保存头像
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveHeadImg")
	@ResponseBody
	public Object saveHeadImg(MultipartFile headImgFile) throws Exception{
		logBefore(logger, "---保存头像--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//获取会员信息
		pd.put("member_id", getSessionUser().getMember_id());
		pd=keHuService.getMemberDetailByID(pd);
		
		//判断该会员是否已经上传头像,删除原来的头像
		if(Tools.notEmpty(pd.getString("headImg"))){
			FileUtil.delFile(PathUtil.getClasspath()+pd.getString("headImg"));
		}
		//判断该会员是否已经有二维码,删除原来的二维码
		if(Tools.notEmpty(pd.getString("erweima"))){
			FileUtil.delFile(PathUtil.getClasspath()+pd.getString("erweima"));
		}
		
		//上传新的头像
		String filePath =Const.FILEPATHIMG + IMGPATH + DateUtil.getDays()+"/";		//文件上传路径
		String fileName = FileUpload.fileUp(headImgFile, PathUtil.getClasspath()+filePath, this.get32UUID());		
		
		//生成二维码
		String logoPath = PathUtil.getClasspath() + filePath + fileName;//生成二维码时,所用图片的路径
		String ewmfilePath = "uploadFiles/uploadImgs/kehu/eweima/" + DateUtil.getDays() + "/";//生成二维码的保存路径
		String imgName = get32UUID() + ".png";//二维码图片的名字
		//二维码链接内容 
		String encoderContent = BaseController.getPath(getRequest()) + "api/member/toRegister.do?tuijian_member_id=" + getSessionUser().getMember_id();
		//生成二维码操作
	    QRCodeUtil.encode(encoderContent, logoPath, PathUtil.getClasspath() + ewmfilePath, imgName, true);
	    
		//保存
		PageData pdData=new PageData();
		pdData.put("member_id", getSessionUser().getMember_id());
		pdData.put("headImg", filePath + fileName);	
		pdData.put("erweima", ewmfilePath + imgName);
		keHuService.updateMemberInfo(pdData);
		
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 完善会员信息
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/wsmemberInfo")
	@ResponseBody
	public Object wsmemberInfo() throws Exception{
		logBefore(logger, "---完善会员信息--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("age", DateUtil.getAge(pd.getString("birthday")));
		pd.put("member_id", getSessionUser().getMember_id());
		keHuService.updateMemberInfo(pd);
		
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 完善其他信息
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/wsMemberOtherInfo")
	@ResponseBody
	public Object wsMemberOtherInfo() throws Exception{
		logBefore(logger, "---完善其他信息--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("member_id", getSessionUser().getMember_id());
		keHuService.updateMemberOtherInfo(pd);
		
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 完善择偶标准
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/wsMemberZobz")
	@ResponseBody
	public Object wsMemberZobz() throws Exception{
		logBefore(logger, "---完善择偶标准--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("member_id", getSessionUser().getMember_id());
		keHuService.updateMemberZobz(pd);
		
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 完善联系方式
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/wsMemberLxfs")
	@ResponseBody
	public Object wsMemberLxfs() throws Exception{
		logBefore(logger, "---完善联系方式--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("member_id", getSessionUser().getMember_id());
		keHuService.updateMemberLxfs(pd);
		
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 保存个人信息(月老红娘使用)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveInfo")
	  public ModelAndView saveInfo(
			  @RequestParam(required=false) MultipartFile file, 
			  String nicheng, 
			  String birthday, 
			  String age, 
			  String juzhudi, 
			  String headImg, 
			  String erweimaImg
			  )throws Exception{
	    logBefore(this.logger, "--保存个人资料--");
	    ModelAndView mv = new ModelAndView();
	    PageData pd = new PageData();
	    pd = getPageData();
	    System.out.println("==========file=======" + file.getSize());
	    String ffile = DateUtil.getDays(); String fileName = "";

	    String logoPath = "";

	    if ((file != null) && (!(file.isEmpty()))) {
	      String filePath = PathUtil.getClasspath() + "uploadFiles/uploadImgs/" + "head/" + ffile + "/";
	      fileName = FileUpload.fileUp(file, filePath, get32UUID());
	      pd.put("headImg", "uploadFiles/uploadImgs/head/" + ffile + "/" + fileName);

	      logoPath = filePath + fileName;

	      String ewmfilePath = "uploadFiles/uploadImgs/kehu/eweima/" + DateUtil.getDays() + "/";

	      String imgName = get32UUID() + ".png";

	      String encoderContent = BaseController.getPath(getRequest()) + "api/member/toRegister.do?tuijian_member_id=" + getSessionUser().getMember_id();

	      QRCodeUtil.encode(encoderContent, logoPath, PathUtil.getClasspath() + ewmfilePath, imgName, true);
	      pd.put("erweima", ewmfilePath + imgName);
	    } else {
	      pd.put("headImg", headImg);

	      logoPath = PathUtil.getClasspath() + headImg;
	      pd.put("erweima", erweimaImg);
	    }

	    pd.put("member_id", getSessionUser().getMember_id());
	    pd.put("nicheng", nicheng);
	    pd.put("birthday", birthday);
	    pd.put("age", age);
	    pd.put("juzhudi", juzhudi);
	    this.keHuService.updateInfo(pd);
	    mv.setViewName("redirect:/api/member/my_center.do");
	    return mv;
	  }
	/**
	 * 判断昵称是否可用
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	@RequestMapping(value = "/getMemberByNoCheng")
	@ResponseBody
	public Object getMemberByNoCheng() throws Exception {
		logBefore(logger, "---判断昵称是否可用--");
		Map<String, Object> map=new  HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("member_id", getSessionUser().getMember_id());
		PageData pd1 = keHuService.getMemberByNoCheng(pd);
		
		String respCode="00";
		String respMsg="改昵称已存在";
		if(pd1==null){
			respCode="01";
			respMsg="改昵称可用";
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 保存照片墙图片
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertZpq")
	public ModelAndView insertZpq(
			@RequestParam(required=false)MultipartFile[] file) throws Exception {
		logBefore(logger, "---保存照片墙--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ffile = DateUtil.getDays()+"/", fileName = "";
		System.out.println("======sadfasdfasdf============"+file.length);
		if(file!=null && file[0].getSize()>0){
			for(int i=0;i<file.length;i++){
				if(file[i]!=null && !file[i].isEmpty()){
					String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + zpq + ffile;		//文件上传路径
					fileName = FileUpload.fileUp(file[i], filePath, this.get32UUID());	
					//添加到数据库
					pd.put("imgPath", Const.FILEPATHIMG + zpq  + ffile + fileName);
					pd.put("zpq_img_id", this.get32UUID());
					pd.put("member_id", getSessionUser().getMember_id());
					
					keHuService.insertZpq(pd);
				}
			}
		}
		mv.setViewName("redirect:/api/member/gerenziliao.do");
		return mv;
	}
	/**
	 * 删除照片墙中的指定图片
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteZpq")
	@ResponseBody
	public Object deleteZpq() throws Exception{
		logBefore(logger, "---删除照片墙中的指定图片--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		keHuService.deleteZpq(pd);
		map.put("respCode", "01");
		map.put("respMsg", "成功删除");
		return AppUtil.returnObject(pd, map);
	}
	//TODO 注册 登录
	/**
	 * 去注册
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toRegister")
	public ModelAndView toRegister() throws Exception {
		logBefore(logger, "---去注册--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("information/login/register");
		return mv;
	}
	/**
	 * 注册
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/register")
	@ResponseBody
	public Object register(HttpServletRequest request) throws Exception{
		logBefore(logger, "--注册--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String respCode = "00";
		String respMsg="";
		String member_id =this.get32UUID();
		PageData member=keHuService.getDataOfMemberByPhone(pd);
		
		if(member!=null){//该手机号已经注册
			respMsg="该手机号已经注册";
		}else{
			respCode="01";
			respMsg="注册成功";
			//保存会员信息
			PageData temp=new PageData();
			temp.put("member_id", member_id);//主键ID
			temp.put("phone", pd.getString("phone"));//手机号
			temp.put("link_phone", pd.getString("phone"));//手机号
			temp.put("identity", pd.getString("identity"));//身份
			temp.put("password", MD5.md5(pd.getString("password")));//密码
			temp.put("registerTime", DateUtil.getTime());//注册时间	
			temp.put("last_login_time", DateUtil.getTime());//最近登陆时间	
			temp.put("ip", request.getRemoteHost());//ip地址	
			temp.put("status", "1");//1 使用中 0 已停用
			temp.put("member_type", "0");
			temp.put("bz", "手机用户");
			keHuService.insertMember(temp);
			
			//判断是否要执行分销tuijian_member_id不为0时，执行分销，
			if(!pd.getString("tuijian_member_id").equals("0")){
				//获取当前推荐人时获得的佣金数
				PageData yongjin=yongJinService.getDataOfYongJin(pd);
				
				//保存推荐记录
				PageData fenxiaoPageData=new PageData();
				fenxiaoPageData.put("tuijian_id", this.get32UUID());
				fenxiaoPageData.put("tuijian_user_id", pd.getString("tuijian_member_id"));
				fenxiaoPageData.put("beituijian_user_id", member_id);
				fenxiaoPageData.put("state", "0");
				fenxiaoPageData.put("money", yongjin.get("yongjin"));
				keHuService.saveTuiJian(fenxiaoPageData);
			}
		}
			
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 去登录页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toLogin")
	public ModelAndView toLogin() throws Exception {
		logBefore(logger, "---去登录页面--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/login/login");
		return mv;
	}
	
	/**
	 * 登录
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(HttpSession session) throws Exception{
		logBefore(logger, "--登录--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String respCode = "00";
		String respMsg="";
		pd.put("password", MD5.md5(pd.getString("password")));
		PageData ismember=keHuService.getDataOfMemberByPhone(pd);
		PageData memberData=keHuService.getMemberByPhoneAndPassword(pd);
		if(ismember==null){
			respMsg="用户不存在，请去注册！";
			respCode="00";
		}
		else if(memberData==null){
			respMsg="用户名或密码错误";
			respCode="00";
		}else{
			respCode="01";
			respMsg="登录成功";
			Member member = new Member();
			member.setMember_id(memberData.getString("member_id"));
			member.setPhone(memberData.getString("phone"));
			member.setIdentity(memberData.getString("identity"));
			session.setAttribute(Const.SESSION_MEMBER_USER, member);
			pd.put("last_login_time", DateUtil.getTime());
			pd.put("member_id", memberData.getString("member_id"));
			keHuService.updateLastLoginTime(pd);

		}
		
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	//TODO 忘记密码
	/**
	 *  去忘记密码页面
	 * @return
	 */
	@RequestMapping(value="/towjmmPage")
	public ModelAndView towjmmPage(){
		logBefore(logger, "--去忘记密码--");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("information/login/forget");
		return mv;
	}
	
	/**
	 * 获取验证码后验证用户
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	@RequestMapping(value="/checkMember")
	@ResponseBody
	public Object checkMember(HttpSession session) throws Exception{
		logBefore(logger, "--忘记密码-会员验证--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String respCode = "00";
		String respMsg="";
		PageData ismember=keHuService.getDataOfMemberByPhone(pd);
		if(ismember==null){
			respMsg="用户不存在，请注册！";
			respCode="00";
		}else{
			respCode="01";
		}
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 *  去忘记密码下一个页面
	 * @return
	 */
	@RequestMapping(value="/towjmmNextPage")
	public ModelAndView towjmmNextPage(){
		logBefore(logger, "--去忘记密码下一个页面--");
		ModelAndView mv=new ModelAndView();
		PageData pd = new PageData();
		pd =this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("information/login/forget1");
		return mv;
	}
	
	/**
	 * 修改密码
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	@RequestMapping(value="/updatepwd")
	public ModelAndView updatepwd(HttpSession session) throws Exception{
		logBefore(logger, "--修改密码--");
		ModelAndView mv=new ModelAndView();
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("password", MD5.md5(pd.getString("password")));
		keHuService.updatepwd(pd);
		mv.setViewName("redirect:/api/member/toLogin.do");
		return mv;
	}
	
	//TODO 判断信息是否完善
	
	@RequestMapping(value="/isCompleteInfo")
	@ResponseBody
	public Object isCompleteInfo() throws Exception{
		logBefore(logger, "-- 判断信息是否完善--");
		
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		
		String respCode="00";
		String respMsg="信息未完善";
		
		pd.put("member_id", getSessionUser().getMember_id());
		pd=keHuService.getMemberDetailByID(pd);
		
		if(pd.getString("identity").equals("2")){
			if (Tools.notEmpty(pd.getString("headImg")) && Tools.notEmpty(pd.getString("nicheng")) && Tools.notEmpty(pd.getString("birthday")) 
					&& Tools.notEmpty(pd.getString("age")) && Tools.notEmpty(pd.getString("juzhudi"))) {
					respCode="01";
					respMsg="信息已完善";
			}
		}else {
			if (Tools.notEmpty(pd.getString("headImg")) && Tools.notEmpty(pd.getString("xingming"))) {
					respCode="01";
					respMsg="信息已完善";
			}else {
				if(Tools.notEmpty(pd.getString("headImg"))){
					respCode="02";
					respMsg="基本信息尚未完善,点击确定去完善基本信息";
				}else{
					respCode="03";
					respMsg="您还未上传头像,点击确定去上传头像";
				}
			}
		}
		
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 注销
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout() throws Exception {
		logBefore(logger, "---注销--");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		removeSession();
		mv.setViewName("redirect:/api/member/toLogin.do");
		return mv;
	}
	
	/**
	 * 获取短信验证码
	 * @return
	 */
	@RequestMapping(value="/getSms")
	@ResponseBody
	public Object getSms(){
		logBefore(logger, "--获取短信验证码--");
		PageData pd = new PageData();
		pd= this.getPageData();
		Map<String,String> map = new HashMap<String,String>();
		String phone = pd.getString("phone");
		map = SmsUtil.sendMsM(phone);
		map.put("phone", phone);
		if(map.size()>0){
			map.put("reqCode", "01");
		}else{
			map.put("reqCode", "00");
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 移除session
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void removeSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.removeAttribute(Const.SESSION_MEMBER_USER);
	}
	
	/**
	 * 判断session是否存在
	 * 存在：返回TRUE
	 * 反之：返回FALSE
	 * @return
	 */
	public boolean isSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		Member member=(Member) session.getAttribute(Const.SESSION_MEMBER_USER);
		if(member==null){
			return false;
		}
		return true;
	}
	/**
	 * 获取session对象
	 * @return
	 */
	public Member getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		Member member=(Member) session.getAttribute(Const.SESSION_MEMBER_USER);
		return member;
	}
}

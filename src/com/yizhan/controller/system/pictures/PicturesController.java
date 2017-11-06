package com.yizhan.controller.system.pictures;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.system.pictures.PicturesService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.DelAllFile;
import com.yizhan.util.FileUpload;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.Tools;


@Controller
@RequestMapping(value="/pictures")
public class PicturesController extends BaseController {
	public static final String IMGPATH = "banner/";	//图片上传路径
	@Resource(name="picturesService")
	private PicturesService picturesService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="LINK",required=false) String LINK,
			@RequestParam(value="STATUS",required=false) String STATUS,
			@RequestParam(value="BZ",required=false) String BZ
			) throws Exception{
		logBefore(logger, "新增Pictures");
		Map<String,String> map = new HashMap<String,String>();
		ModelAndView mv=new ModelAndView();
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + IMGPATH + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
		}else{
			System.out.println("上传失败");
		}
		
		PageData pd = new PageData();
		
		pd.put("PICTURES_ID", this.get32UUID());			//主键
		pd.put("TITLE", TITLE);								//标题
		pd.put("NAME", fileName);							//文件名
		pd.put("PATH", Const.FILEPATHIMG + IMGPATH + ffile + "/" + fileName);				//路径
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("MASTER_ID", "1");							//附属与
		pd.put("STATUS", STATUS);							    //状态
		pd.put("BZ", BZ);						//备注
		pd.put("LINK", LINK);						//备注
		//加水印
		//Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);
		picturesService.save(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Pictures");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); //删除图片
			picturesService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	
	/**
	 * 轮播图列表
	 */
	@RequestMapping(value="/picturesList")
	public ModelAndView picturesList(Page page){
		logBefore(logger, "轮播图列表Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = picturesService.picturesList(page);	//列出Pictures列表
			mv.setViewName("system/pictures/pictures_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Pictures页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/pictures/pictures_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Pictures页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = picturesService.findById(pd);	//根据ID读取
			mv.setViewName("system/pictures/pictures_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="PICTURES_ID",required=false) String PICTURES_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="LINK",required=false) String LINK,
			@RequestParam(value="MASTER_ID",required=false) String MASTER_ID,
			@RequestParam(value="STATUS",required=false) String STATUS,
			@RequestParam(value="BZ",required=false) String BZ
			) throws Exception{
		logBefore(logger, "修改Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("PICTURES_ID", PICTURES_ID);		//图片ID
		pd.put("TITLE", TITLE);					//标题
		pd.put("MASTER_ID", MASTER_ID);			//属于ID
		pd.put("STATUS", STATUS);			    //状态
		pd.put("BZ", BZ);						//备注
		pd.put("LINK", LINK);						//备注
		
		if(null == tpz){tpz = "";}
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + IMGPATH + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("PATH", Const.FILEPATHIMG + IMGPATH + ffile + "/" + fileName);				//路径
			pd.put("NAME", fileName);
		}else{
			pd.put("PATH", tpz);
		}
		//Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		picturesService.edit(pd);				//执行修改数据库
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Pictures");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			List<PageData> pathList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				pathList = picturesService.getAllById(ArrayDATA_IDS);
				//删除图片
				for(int i=0;i<pathList.size();i++){
					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pathList.get(i).getString("PATH"));
				}
				picturesService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Pictures到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("标题");	//1
			titles.add("文件名");	//2
			titles.add("路径");	//3
			titles.add("创建时间");	//4
			titles.add("属于");	//5
			titles.add("备注");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = picturesService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("TITLE"));	//1
				vpd.put("var2", varOList.get(i).getString("NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("PATH"));	//3
				vpd.put("var4", varOList.get(i).getString("CREATETIME"));	//4
				vpd.put("var5", varOList.get(i).getString("MASTER_ID"));	//5
				vpd.put("var6", varOList.get(i).getString("BZ"));	//6
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	//删除图片
	@RequestMapping(value="/deltp")
	public void deltp(PrintWriter out) {
		logBefore(logger, "删除图片");
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
			if(PATH != null){
				picturesService.delTp(pd);																//删除数据中图片数据
			}	
			out.write("success");
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

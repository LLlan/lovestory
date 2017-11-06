package com.yizhan.controller.system.build;

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
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.f;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
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

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.system.Role;
import com.yizhan.entity.system.User;
import com.yizhan.service.system.menu.MenuService;
import com.yizhan.service.system.role.RoleService;
import com.yizhan.service.system.user.UserService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.FileDownload;
import com.yizhan.util.FileUpload;
import com.yizhan.util.GetPinyin;
import com.yizhan.util.ObjectExcelRead;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.Tools;

/**
 * 
 * 页面建设中
 * author： lj
 * date：2016-11-22
 *
 */

@Controller
@RequestMapping(value="/build")
public class buildController extends BaseController{
	
	
	@RequestMapping(value="/building")
	public ModelAndView building(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//页面跳转
		mv.setViewName("build");
		return mv;
	}
	
	
}

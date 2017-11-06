package com.yizhan.controller.system.contactus;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.system.contactus.ContactUsService;
import com.yizhan.util.PageData;

@Controller
@RequestMapping(value="/contactUs")
public class ContactUsController extends BaseController{
	
	@Resource(name="contactUsService")
	private ContactUsService contactUsService;

	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/contactuslistPage")
	public ModelAndView contactuslistPage(Page page) throws Exception{
		logBefore(logger, "---获取联系我们列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=contactUsService.contactuslistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/contactus/contactus_list");
		return mv;
	}
	/**
	 * 进入联系我们添加页
	 * @return
	 */
	@RequestMapping(value="/toAddContactUs")
	public ModelAndView toAddContactUs(){
		logBefore(logger, "---进入联系我们添加页--");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insertContactUs");
		mv.setViewName("system/contactus/contactus_edit");
		return mv;
	}
	/**
	 * 添加联系我们
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertContactUs")
	public ModelAndView insertContactUs() throws Exception{
		logBefore(logger, "---添加联系我们--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("contactus_id", this.get32UUID());
		contactUsService.insertContactUs(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入联系我们编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditContactUs")
	public ModelAndView toEditContactUs() throws Exception{
		logBefore(logger, "---进入联系我们编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=contactUsService.getContactUsById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateContactUs");
		mv.setViewName("system/contactus/contactus_edit");
		return mv;
	}
	/**
	 * 修改联系我们
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateContactUs")
	public ModelAndView updateContactUs() throws Exception{
		logBefore(logger, "---修改联系我们--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		contactUsService.updateContactUs(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象(联系我们)的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteContactUsById")
	public void deleteContactUsById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象(联系我们)的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		contactUsService.deleteContactUsById(map);
		writer.close();
	}
}

package com.yizhan.controller.information;

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
import com.yizhan.service.information.HeadNewsService;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;

@Controller
@RequestMapping(value="/headNews")
public class HeadNewsController extends BaseController{
	
	@Resource(name="headNewsService")
	private HeadNewsService headNewsService;

	/**
	 * 获取头条新闻列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/headnewslistPage")
	public ModelAndView headnewslistPage(Page page) throws Exception{
		logBefore(logger, "---获取头条新闻列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=headNewsService.headnewslistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("information/headNews/headNews_list");
		return mv;
	}
	/**
	 * 进入头条新闻添加页
	 * @return
	 */
	@RequestMapping(value="/toAddHeadNews")
	public ModelAndView toAddHeadNews(){
		logBefore(logger, "---进入头条新闻添加页--");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insertHeadNews");
		mv.setViewName("information/headNews/headNews_edit");
		return mv;
	}
	/**
	 * 添加头条新闻
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertHeadNews")
	public ModelAndView insertHeadNews() throws Exception{
		logBefore(logger, "---添加头条新闻--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("headNews_id", this.get32UUID());
		pd.put("addTime", DateUtil.getTime());
		headNewsService.insertHeadNews(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入头条新闻编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditHeadNews")
	public ModelAndView toEditHeadNews() throws Exception{
		logBefore(logger, "---进入头条新闻编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=headNewsService.getHeadNewsById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateHeadNews");
		mv.setViewName("information/headNews/headNews_edit");
		return mv;
	}
	/**
	 * 修改头条新闻
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateHeadNews")
	public ModelAndView updateHeadNews() throws Exception{
		logBefore(logger, "---修改头条新闻--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("addTime", DateUtil.getTime());
		headNewsService.updateHeadNews(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象(头条新闻)的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteHeadNewsById")
	public void deleteHeadNewsById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象(头条新闻)的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		headNewsService.deleteHeadNewsById(map);
		writer.close();
	}
}

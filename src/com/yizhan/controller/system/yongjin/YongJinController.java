package com.yizhan.controller.system.yongjin;

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
import com.yizhan.service.system.yongjin.YongJinService;
import com.yizhan.util.PageData;

@Controller
@RequestMapping(value="/yongJin")
public class YongJinController extends BaseController{
	
	@Resource(name="yongJinService")
	private YongJinService yongJinService;

	/**
	 * 获取佣金列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/yongjinlistPage")
	public ModelAndView yongjinlistPage(Page page) throws Exception{
		logBefore(logger, "---获取佣金列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=yongJinService.yongjinlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/yongjin/yongjin_list");
		return mv;
	}
	/**
	 * 进入佣金添加页
	 * @return
	 */
	@RequestMapping(value="/toAddYongJin")
	public ModelAndView toAddYongJin(){
		logBefore(logger, "---进入佣金添加页--");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insertYongJin");
		mv.setViewName("system/yongjin/yongjin_edit");
		return mv;
	}
	/**
	 * 添加佣金
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertYongJin")
	public ModelAndView insertYongJin() throws Exception{
		logBefore(logger, "---添加佣金--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("YongJin_id", this.get32UUID());
		yongJinService.insertYongJin(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入佣金编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditYongJin")
	public ModelAndView toEditYongJin() throws Exception{
		logBefore(logger, "---进入佣金编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=yongJinService.getYongJinById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateYongJin");
		mv.setViewName("system/yongjin/yongjin_edit");
		return mv;
	}
	/**
	 * 修改佣金
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateYongJin")
	public ModelAndView updateYongJin() throws Exception{
		logBefore(logger, "---修改佣金--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		yongJinService.updateYongJin(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象(佣金)的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteYongJinById")
	public void deleteYongJinById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象(佣金)的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		yongJinService.deleteYongJinById(map);
		writer.close();
	}
}

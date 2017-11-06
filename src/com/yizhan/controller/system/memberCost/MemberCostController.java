package com.yizhan.controller.system.memberCost;

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
import com.yizhan.service.system.membercost.MemberCostService;
import com.yizhan.util.PageData;

@Controller
@RequestMapping(value="/memberCost")
public class MemberCostController extends BaseController{
	
	@Resource(name="memberCostService")
	private MemberCostService memberCostService;

	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/membercostlistPage")
	public ModelAndView membercostlistPage(Page page) throws Exception{
		logBefore(logger, "---获取列表--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> list=memberCostService.membercostlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		mv.setViewName("system/membercost/membercost_list");
		return mv;
	}
	/**
	 * 进入添加页
	 * @return
	 */
	@RequestMapping(value="/toAddMemberCost")
	public ModelAndView toAddMemberCost(){
		logBefore(logger, "---进入添加页--");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insertMemberCost");
		mv.setViewName("system/membercost/membercost_edit");
		return mv;
	}
	/**
	 * 添加
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertMemberCost")
	public ModelAndView insertMemberCost() throws Exception{
		logBefore(logger, "---添加--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("member_cost_id", this.get32UUID());
		memberCostService.insertMemberCost(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEditMemberCost")
	public ModelAndView toEditMemberCost() throws Exception{
		logBefore(logger, "---进入编辑页--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd=memberCostService.getMemberCostById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateMemberCost");
		mv.setViewName("system/membercost/membercost_edit");
		return mv;
	}
	/**
	 * 修改
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateMemberCost")
	public ModelAndView updateMemberCost() throws Exception{
		logBefore(logger, "---修改--");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		memberCostService.updateMemberCost(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 根据ID删除指定对象()的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteMemberCostById")
	public void deleteMemberCostById(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象()的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		memberCostService.deleteMemberCostById(map);
		writer.close();
	}
}

package com.yizhan.service.system.membercost;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("memberCostService")
public class MemberCostService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> membercostlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("memberCostMapper.membercostlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfMemberCost(PageData pd) throws Exception{
		return (PageData) dao.findForObject("memberCostMapper.getDataOfMemberCost", pd);
	}
	/**
	 * 添加联系我们
	 * @param pd
	 * @throws Exception
	 */
	public void insertMemberCost(PageData pd) throws Exception{
		dao.save("memberCostMapper.insertMemberCost", pd);
	}
	/**
	 * 更新联系我们
	 * @param pd
	 * @throws Exception 
	 */
	public void updateMemberCost(PageData pd) throws Exception{
		dao.update("memberCostMapper.updateMemberCost", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMemberCostById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("memberCostMapper.getMemberCostById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteMemberCostById(Map<String, Object> map) throws Exception{
		dao.delete("memberCostMapper.deleteMemberCostById", map);
	}
	
}

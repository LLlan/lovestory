package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("memberManageService")
public class MemberManageService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取会员列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMemberlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.getMemberlistPage", page);
	}
	/**
	 * 获取所有会员列表信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllMember(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.listAllMember", pd);
	}
	/**
	 * 更改账号状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateMemberStatus(PageData pd) throws Exception{
		dao.update("memberManageMapper.updateMemberStatus", pd);
	}
	/**
	 * 根据ID获取指定会员的信息
	 * @param pd
	 * @throws Exception
	 */
	public PageData getInformationOfMemberById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("memberManageMapper.getInformationOfMemberById", pd);
	}
	
	
	/**
	 * 获取提现申请列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getwithdrawcashlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.getwithdrawcashlistPage", page);
	}
	/**
	 * 获取所有会员提现申请列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllMemberOfHytx(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.listAllMemberOfHytx", pd);
	}
	/**
	 * 改变提现申请状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateWithDrawCashState(PageData pd) throws Exception{
		dao.update("memberManageMapper.updateWithDrawCashState", pd);
	}
	/**
	 * 会员缴费列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getmemberorderlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.getmemberorderlistPage", page);
	}
	/**
	 * 获取所有会员缴费列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllMemberOfYfkhy(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("memberManageMapper.listAllMemberOfYfkhy", pd);
	}
}

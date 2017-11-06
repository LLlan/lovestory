package com.yizhan.service.information;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.util.PageData;

@Service("keHuService")
public class KeHuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	public PageData getDataOfMemberByPhone(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getDataOfMemberByPhone", pd);
	}
	
	public PageData getDataOfMemberByPhone2(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getDataOfMemberByPhone2", pd);
	}
	
	/**
	 * 根据用户名和密码获取用户信息用于登录验证
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public PageData getMemberByPhoneAndPassword(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getMemberByPhoneAndPassword", pd);
	}

	
	/**
	 * 保存会员信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void insertMember(PageData pd) throws Exception{
		dao.save("kehuMapper.insertMember", pd);
	}
	
	/**
	 * 更新登录时间
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void updateLastLoginTime(PageData pd) throws Exception{
		dao.update("kehuMapper.updateLastLoginTime", pd);
	}
	
	/*
	 * 修改密码
	 */
	public void updatepwd(PageData pd) throws Exception{
		dao.update("kehuMapper.updatepwd", pd);
	}
	/**
	 * 判断昵称是否可用
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public PageData getMemberByNoCheng(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getMemberByNoCheng", pd);
	}
	/**
	 * 根据id查会员的信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public PageData getMemberDetailByID(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getMemberDetailByID", pd);
	}
	/**
	 * 完善会员信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void updateMemberInfo(PageData pd) throws Exception{
		dao.update("kehuMapper.updateMemberInfo", pd);
	}
	/**
	 * 完善其他信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void updateMemberOtherInfo(PageData pd) throws Exception{
		dao.update("kehuMapper.updateMemberOtherInfo", pd);
	}
	/**
	 * 完善择偶标准
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void updateMemberZobz(PageData pd) throws Exception{
		dao.update("kehuMapper.updateMemberZobz", pd);
	}
	/**
	 * 完善联系方式
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-20
	 */
	public void updateMemberLxfs(PageData pd) throws Exception{
		dao.update("kehuMapper.updateMemberLxfs", pd);
	}
	/**
	 * 完善个人信息(月老红娘使用)
	 * @param pd
	 * @throws Exception
	 */
	public void updateInfo(PageData pd)throws Exception{
		dao.update("kehuMapper.updateInfo", pd);
	}
	/**
	 * 获取会员列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getMemberList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("kehuMapper.getMemberList", pd);
	}
	/**
	 * 根据ID获取会员详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData memberDetail(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.memberDetail", pd);
	}
	/**
	 * 更新会员的年龄
	 * @param pd
	 * @throws Exception
	 */
	public void updateMemberAgeById(PageData pd) throws Exception{
		dao.update("kehuMapper.updateMemberAgeById", pd);
	}
	/**
	 * 根据会员的主键ID号获取照片墙的信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getZpqImgPaths(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("kehuMapper.getZpqImgPaths", pd);
	}
	/**
	 * 保存照片墙
	 * 功能：
	 * 作者：lj
	 * 日期：2017-7-21
	 */
	public void insertZpq(PageData pd) throws Exception{
		dao.update("kehuMapper.insertZpq", pd);
	}
	/**
	 * 根据ID删除指定的照片墙图片信息
	 * @param pd
	 * @throws Exception
	 */
	public void deleteZpq(PageData pd) throws Exception{
		dao.delete("kehuMapper.deleteZpq", pd);
	}
	
	/**
	 * 保存推荐记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveTuiJian(PageData pd) throws Exception{
		dao.save("kehuMapper.saveTuiJian", pd);
	}
	/**
	 * 根据会员的主键ID获取推荐人数列表或获取佣金的列表
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getTuiJianList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("kehuMapper.getTuiJianList", pd);
	}
	/**
	 * 创建提现申请记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveWithDrawCash(PageData pd) throws Exception{
		dao.save("kehuMapper.saveWithDrawCash", pd);
	}
	/**
	 * 更新会员的余额
	 * @param pd
	 * @throws Exception
	 */
	public void updateUsable_money(PageData pd) throws Exception{
		dao.update("kehuMapper.updateUsable_money", pd);
	}
	/**
	 * 根据用户的主键ID获取对应的提现申请记录
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getWithDrawCashList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("kehuMapper.getWithDrawCashList", pd);
	}
	
	/**
	 * 保存临时信息
	 * @param pd
	 * @throws Exception
	 */
	public void save_tb_temp_information(PageData pd) throws Exception{
		dao.save("kehuMapper.save_tb_temp_information", pd);
	}
	/**
	 * 根据订单的订单编号，获取临时信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData get_tb_temp_information(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.get_tb_temp_information", pd);
	}
	/**
	 * 保存订单
	 * @param pd
	 * @throws Exception
	 */
	public void saveOrder(PageData pd) throws Exception{
		dao.save("kehuMapper.saveOrder", pd);
	}
	/**
	 * 改变会员状态会员类型（0-普通会员，1-缴费会员）
	 * @param pd
	 * @throws Exception
	 */
	public void updateMemberType(PageData pd) throws Exception{
		dao.save("kehuMapper.updateMemberType", pd);
	}
	/**
	 * 根据被推荐的主键ID获取推荐记录表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getTuiJianInfoBybtjuid(PageData pd) throws Exception{
		return (PageData) dao.findForObject("kehuMapper.getTuiJianInfoBybtjuid", pd);
	}
	/**
	 * 改变推荐记录的状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateTuiJianState(PageData pd) throws Exception{
		dao.update("kehuMapper.updateTuiJianState", pd);
	}
	 
}

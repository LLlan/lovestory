package com.yizhan.service.system.appuser;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.entity.system.AppUser;
import com.yizhan.entity.system.CacheProprietor;
import com.yizhan.util.PageData;


@Service("appuserService")
public class AppuserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	

	/**
	 * 根据用户名和密码获取用户缓存信息
	 * 作者：lj
	 * 日期：2016-12-19
	 */
	public PageData getCacheInfoByPhoneAndPwd(PageData pd) throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getCacheInfoByPhoneAndPwd", pd);
	}
	
	/**
	 * 获取用户缓存信息
	 * 作者：lj
	 * 日期：2016-12-19
	 */
	public CacheProprietor getCacheInfo(PageData pd) throws Exception{
		return (CacheProprietor)dao.findForObject("AppuserMapper.getCacheInfo", pd);
	}
	
	
	/**
	 * 
	 * 功能：保存用户缓存信息
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void putCacheInfo(PageData pd)throws Exception{
		dao.save("AppuserMapper.putCacheInfo", pd);
	}
	
	
	/**
	 *  删除缓存信息  app注销用户
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-15
	 */
	public void deleteCacheInfo(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteCacheInfo", pd);
	}
	
	
	
	/**
	 *app用户列表
	 * 作者：lj
	 * 日期：2016-12-22
	 */
	public List<PageData> appUserlistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.appUserlistPage", page);
	}
	
	/**
	 * 通过id获取数据
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public PageData findByPhone(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByPhone", pd);
	}
	
	
	/**
	 * 保存用户
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveU(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveU", pd);
	}
	
	/**
	 * 登录判断
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getUserByNameAndPwd", pd);              
	}
	
	/**
	 *  查该用户是否完善资料
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public List<PageData> getCompleteDataByPhone(PageData pd)throws Exception{	
		return (List<PageData>)dao.findForList("AppuserMapper.getCompleteDataByPhone", pd);              
	}
	
	/**
	 * 查appUser信息
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public AppUser getAppUserInfo(PageData pd)throws Exception{	
		return (AppUser)dao.findForObject("AppuserMapper.getAppUserInfo", pd);              
	}
	
	
	
	/**
	 * 根据电话号码获取业主个人信息
	 * 作者：lj
	 * 日期：2016-12-19
	 */
	public PageData getProprietorByPhone(PageData pd) throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getProprietorByPhone", pd);
	}
	
	
	/**
	 * 
	 * 功能：修改密码
	 * 作者：lj
	 * 日期：2016-12-17
	 * @throws Exception 
	 */
	public void updatePwd(PageData pd) throws Exception{
		dao.update("AppuserMapper.updatePwd", pd);
	}
	
	/**
	 * 更新最近一次登录时间
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("AppuserMapper.updateLastLogin", pd);
	}
	
	/**
	 * 
	 * 功能：保存设备报修的图片
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveRepairsImage(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveRepairsImage", pd);
	}
	
	
	/**
	 * 
	 * 功能：保存设备报修的图片
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void deleteRepairsImage(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteRepairsImage", pd);
	}
	

	/**
	 * 保存用户投诉
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveComplaint(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveComplaint", pd);
	}
	
	/**
	 *  保存用户投诉的图片
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveComplaintImage(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveComplaintImage", pd);
	}
	
	
	/**
	 * 保存用户头像图片
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveAppHeadImage(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveAppHeadImage", pd);
	}
	
	
	/**
	 * 删除用户头像
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-30
	 */
	public void deleteHeadImage(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteHeadImage", pd);
	}
	
	/**
	 * 保存用户昵称
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void saveAppNickName(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveAppNickName", pd);
	}
	
	
	/**
	 * 修改用户昵称
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public void updateAppNickName(PageData pd)throws Exception{
		dao.save("AppuserMapper.updateAppNickName", pd);
	}
	
	
	/**
	 * 根据电话号码查该用户的头像
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-4
	 */
	public PageData getImageHeadByPhone(PageData pd){
		PageData pd2 = null;
		try {
			 pd2 =(PageData)dao.findForObject("AppuserMapper.getImageHeadByPhone", pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd2;
	}
	
	/**
	 * 根据电话号码查该用户的昵称
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-6
	 */
	public PageData getNickNameByPhone(PageData pd){
		PageData pd2 = null;
		try {
			pd2 =(PageData)dao.findForObject("AppuserMapper.getNickNameByPhone", pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd2;
	}
	
	
	/**
	 *更新投诉图片id
	 * 
	 */
	public void updateComplaintImageId(PageData pd) throws Exception{
		dao.update("AppuserMapper.updateComplaintImageId", pd);
	}
	
	
	/**
	 * 保存用户反馈信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveFeedBack(PageData pd) throws Exception{
		dao.save("feedbackMapper.savefeedback", pd);
	}
	
	
	//======================================================================================
	
	/*
	* 通过id获取数据
	*/
	public PageData findByUiId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUiId", pd);
	}
	/*
	* 通过loginname获取数据
	*/
	public PageData findByUId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUId", pd);
	}
	
	/*
	* 通过邮箱获取数据
	*/
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUE", pd);
	}
	
	/*
	* 通过编号获取数据
	*/
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUN", pd);
	}
	

	/*
	* 修改用户
	*/
	public void editU(PageData pd)throws Exception{
		dao.update("AppuserMapper.editU", pd);
	}
	/*
	* 删除用户
	*/
	public void deleteU(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteU", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("AppuserMapper.deleteAllU", USER_IDS);
	}
	/*
	*用户列表(全部)
	*/
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.listAllUser", pd);
	}
	
	/*
	*用户列表(用户组)
	*/
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.userlistPage", page);
	}
	
	/*
	* 保存用户IP
	*/
	public void saveIP(PageData pd)throws Exception{
		dao.update("AppuserMapper.saveIP", pd);
	}
	
	
	
	//======================================================================================
	
	
}


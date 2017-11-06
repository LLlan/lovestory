package com.yizhan.service.system.contactus;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("contactUsService")
public class ContactUsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取联系我们列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> contactuslistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("contactUsMapper.contactuslistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfContactUs(PageData pd) throws Exception{
		return (PageData) dao.findForObject("contactUsMapper.getDataOfContactUs", pd);
	}
	/**
	 * 添加联系我们
	 * @param pd
	 * @throws Exception
	 */
	public void insertContactUs(PageData pd) throws Exception{
		dao.save("contactUsMapper.insertContactUs", pd);
	}
	/**
	 * 更新联系我们
	 * @param pd
	 * @throws Exception 
	 */
	public void updateContactUs(PageData pd) throws Exception{
		dao.update("contactUsMapper.updateContactUs", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getContactUsById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("contactUsMapper.getContactUsById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteContactUsById(Map<String, Object> map) throws Exception{
		dao.delete("contactUsMapper.deleteContactUsById", map);
	}
	
}

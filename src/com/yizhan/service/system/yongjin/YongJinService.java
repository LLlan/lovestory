package com.yizhan.service.system.yongjin;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("yongJinService")
public class YongJinService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取佣金列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> yongjinlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("yongJinMapper.yongjinlistPage", page);
	}
	/**
	 * 获取对象信息(肯定只有一条记录)
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData getDataOfYongJin(PageData pd) throws Exception{
		return (PageData) dao.findForObject("yongJinMapper.getDataOfYongJin", pd);
	}
	/**
	 * 添加佣金
	 * @param pd
	 * @throws Exception
	 */
	public void insertYongJin(PageData pd) throws Exception{
		dao.save("yongJinMapper.insertYongJin", pd);
	}
	/**
	 * 更新佣金
	 * @param pd
	 * @throws Exception 
	 */
	public void updateYongJin(PageData pd) throws Exception{
		dao.update("yongJinMapper.updateYongJin", pd);
	}
	/**
	 * 根据ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getYongJinById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("yongJinMapper.getYongJinById", pd);
	}
	/**
	 * 根据ID删除指定对象的信息
	 * @param map
	 * @throws Exception
	 */
	public void deleteYongJinById(Map<String, Object> map) throws Exception{
		dao.delete("yongJinMapper.deleteYongJinById", map);
	}
	
}

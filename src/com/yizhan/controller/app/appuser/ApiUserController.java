package com.yizhan.controller.app.appuser;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yizhan.controller.base.BaseController;
import com.yizhan.service.system.appuser.AppuserService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.PageData;
/**
  * -接口类 
  *    
  * 相关参数协议：
  * 00	请求失败    
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/api/vi")
public class ApiUserController extends BaseController {	
    
	@Resource(name="appuserService")
	private AppuserService appuserService;
	
	/**
	 * 测试
	 */
	@RequestMapping(value="/test")
	@ResponseBody
	public Object test(){
		logBefore(logger, "test");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		
		try{
			result = "01";
			map.put("result", result);
			map.put("msg", "测试成功");
		}catch (Exception e){
			logger.error(e.toString(), e);
			result = "00";
			map.put("result", result);
			map.put("msg", e.getMessage());
		}
		
		return AppUtil.returnObject(pd, map);
	}
}
	
 
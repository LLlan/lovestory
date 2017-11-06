package com.yizhan.listener;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.yizhan.controller.base.BaseController;
import com.yizhan.util.Const;
/**
 * 
* 类名称：监听器 设定定时执行任务WebAppContextListener.java
* 类描述： 
* 作者单位： 
* 联系方式：
* @version 1.0
 */
public class WebAppContextListener extends BaseController implements ServletContextListener {
	private Timer timer = null;
	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		//Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//System.out.println("========获取Spring WebApplicationContext");
		
		//创建一个新计时器，可以指定其相关的线程作为守护程序运行。如果计时器将用于安排重复的“维护活动”，则调用守护线程，在应用程序运行期间必须调用守护线程，但是该操作不应延长程序的生命周期。   timer = new Timer(true);
		//创建一个新计时器，可以指定其相关的线程作为守护程序运行。   
		//设置任务计划，启动和间隔时间   
		
		/*Calendar calendar = Calendar.getInstance();
		// get 和 set 的字段数字，指示一天中的小时。  
		calendar.set(Calendar.HOUR_OF_DAY, 3);
		//get 和 set 的字段数字，指示一小时中的分钟。 
		calendar.set(Calendar.MINUTE, 0);
		// get 和 set 的字段数字，指示一分钟中的秒。    
		calendar.set(Calendar.SECOND, 0);
		Date time = calendar.getTime();
		System.out.println("------------执行时间----------"+time);*/
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
		Date startDate = null;
		
		try{
			 startDate = dateFormatter.parse("2017/02/28 17:14:00");
		}catch (ParseException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		timer = new Timer(true);
		// 安排在指定的时间执行指定的任务。执行任务前的延迟时间，单位是毫秒。
		//timer.schedule(new contractTask(), startDate, 5000); 
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0){
		//终止此计时器，丢弃所有当前已安排的任务。  
		timer.cancel(); 
	}

	
	//内部类
	  public class contractTask extends TimerTask{ 
	   	public void run(){ 
	   			logBefore(logger,"--------开始执行定时任务了！！------");

	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
	   			System.out.println("------------执行了----------------");
	   	}   
	 }

}

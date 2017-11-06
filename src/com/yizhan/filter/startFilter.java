package com.yizhan.filter;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.yizhan.controller.base.BaseController;

/**
 * 登录验证过滤器
 */
public class startFilter extends BaseController implements Filter{

	
	/**
	 * 初始化
	 */
	@Override
	public void init(FilterConfig fc) throws ServletException {
		//FileUtil.createDir("d:/FH/topic/");
		//writeFile();
		
		
		
		//timer();
	}
	
	
	//计时器
	public void timer() throws ParseException {
		//Calendar calendar = Calendar.getInstance();
		//calendar.set(Calendar.HOUR_OF_DAY, 9); // 控制时
		//calendar.set(Calendar.MINUTE, 0); 		// 控制分
		//calendar.set(Calendar.SECOND, 0); 		// 控制秒

		//Date time = calendar.getTime(); 		// 得出执行任务的时间
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
		Date startDate = dateFormatter.parse("2017/02/27 15:45:00");

		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				
				//PersonService personService = (PersonService)ApplicationContext.getBean("personService");
				
				/*System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");
				System.out.println("-------设定要指定任务--------");*/
			}
		}, startDate, 5000);// 这里设定将延时每天固定执行,这里是1天24小时 *60*60*24
	}


	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	
	  
	
}

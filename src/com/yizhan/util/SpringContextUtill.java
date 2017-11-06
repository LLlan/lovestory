package com.yizhan.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 以静态变量保存Spring ApplicationContext, 可在任何代码任何地方任何时候取出ApplicaitonContext.
 * 
 * @author calvin
 */
public class SpringContextUtill{

    private static ApplicationContext applicationContext = null;
    /**
     * 取得存储在静态变量中的ApplicationContext.
     */
    public static ApplicationContext getApplicationContext() {
    	if(!(applicationContext!=null&&!"".equals(applicationContext))){
    		applicationContext=new ClassPathXmlApplicationContext("beans.xml");
    	}
    	
        return applicationContext;
    }

}

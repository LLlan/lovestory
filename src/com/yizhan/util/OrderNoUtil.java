package com.yizhan.util;

import java.util.UUID;

public class OrderNoUtil {
	//Volatile修饰的成员变量在每次被线程访问时，都强迫从共享内存中重读该成员变量的值。
	//而且，当成员变量发生变化时，强迫线程将变化值回写到共享内存。这样在任何时刻，两个不同的线程总是看到某个成员变量的同一个值。
	private volatile static OrderNoUtil uniqueInstance = null;
	private OrderNoUtil(){}
	//同步锁住这个方法，等待一个进程执行完之后在进行第二个(重复调用不耗资源)
    public static OrderNoUtil getInstance(){
    	if(uniqueInstance == null){
    		synchronized (OrderNoUtil.class) {
				if(uniqueInstance == null){
					uniqueInstance = new OrderNoUtil();
				}
			}
    	}
    	return uniqueInstance;
    }
    
	public String getOrderNo(){
		int machineId = 1;//最大支持1-9个集群机器部署
		int hashCodeV = UUID.randomUUID().toString().hashCode();
		if(hashCodeV < 0) {//有可能是负数
		  hashCodeV = - hashCodeV;
		}
		// 0 代表前面补充0     
		// 4 代表长度为4     
		// d 代表参数为正数型
		return machineId+String.format("%015d", hashCodeV);
	}
}

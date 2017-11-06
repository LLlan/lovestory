package com.yizhan.entity.system;

public class Cache { 
    private String key;//缓存ID 
    private Object value;//缓存数据 
    private long timeOut;//更新时间 
    private boolean expired; //是否终止 
    private Proprietor proprietor;//业主实体类
    private AlipayParameter alipayParameter;
    
    
    
    public AlipayParameter getAlipayParameter() {
		return alipayParameter;
	}

	public void setAlipayParameter(AlipayParameter alipayParameter) {
		this.alipayParameter = alipayParameter;
	}

	public Proprietor getProprietor() {
		return proprietor;
	}

	public void setProprietor(Proprietor proprietor) {
		this.proprietor = proprietor;
	}

	public Cache() { 
            super(); 
    } 

    public Cache(String key, Object value, long timeOut, boolean expired) { 
            this.key = key; 
            this.value = value; 
            this.timeOut = timeOut; 
            this.expired = expired; 
    } 

    public String getKey() { 
            return key; 
    } 

    public long getTimeOut() { 
            return timeOut; 
    } 

    public Object getValue() { 
            return value; 
    } 

    public void setKey(String string) { 
            key = string; 
    } 

    public void setTimeOut(long l) { 
            timeOut = l; 
    } 

    public void setValue(Object object) { 
            value = object; 
    } 

    public boolean isExpired() { 
            return expired; 
    } 

    public void setExpired(boolean b) { 
            expired = b; 
    } 
} 

//测试类， 
class Test { 
public static void main(String[] args) { 
    System.out.println(CacheManager.getSimpleFlag("alksd")); 
//    CacheManager.putCache("abc", new Cache()); 
//    CacheManager.putCache("def", new Cache()); 
//    CacheManager.putCache("ccc", new Cache()); 
//    CacheManager.clearOnly(""); 
//    Cache c = new Cache(); 
//    for (int i = 0; i < 10; i++) { 
//        CacheManager.putCache("" + i, c); 
//    } 
//    CacheManager.putCache("aaaaaaaa", c); 
//    CacheManager.putCache("abchcy;alskd", c); 
//    CacheManager.putCache("cccccccc", c); 
//    CacheManager.putCache("abcoqiwhcy", c); 
//    System.out.println("删除前的大小："+CacheManager.getCacheSize()); 
//    CacheManager.getCacheAllkey(); 
//    CacheManager.clearAll("aaaa"); 
//    System.out.println("删除后的大小："+CacheManager.getCacheSize()); 
//    CacheManager.getCacheAllkey(); 

	} 
}
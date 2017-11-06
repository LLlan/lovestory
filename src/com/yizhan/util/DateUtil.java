package com.yizhan.util;

import java.awt.print.PrinterException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.weixin.method.staticMethod;

public class DateUtil {
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private final static SimpleDateFormat sdfTimes = new SimpleDateFormat("yyyyMMddHHmmss");
	
	private final static SimpleDateFormat hourAndminute = new SimpleDateFormat("HH:mm");

	/**
	 * 获取指定分钟后的时间HH:mm
	 * @return
	 * @throws ParseException 
	 */
	public static String gethourAndminute(String date,int num) throws ParseException{
		long curren = sdfTime.parse(date).getTime();
        curren += num * 60 * 1000;
        Date da = new Date(curren);
		return hourAndminute.format(da);
	}
	/**
	 * 获取YYYY格式
	 * 
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * 
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * 
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * 
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}
	
	

	/**
	 * 获取YYYYMMDDHHmmss格式
	 * 
	 * @return
	 */
	public static String getTimes(){
		return sdfTimes.format(new Date());
	}

	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author luguosui
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}
	/**
	 * 根据生日获取年龄
	 * @param birthday
	 * @return
	 * @throws Exception 
	 */
	public static String getAge(String birthday){
		int age = 0;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	        Date birthDay = sdf.parse(birthday);
	        
			Calendar cal = Calendar.getInstance();  
			  
	        int yearNow = cal.get(Calendar.YEAR);  
	        int monthNow = cal.get(Calendar.MONTH);  
	        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
	        
	        cal.setTime(birthDay);  
	  
	        int yearBirth = cal.get(Calendar.YEAR);  
	        int monthBirth = cal.get(Calendar.MONTH);  
	        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);  
	  
	        age = yearNow - yearBirth;  
	  
	        if (monthNow <= monthBirth) {  
	            if (monthNow == monthBirth) {  
	                if (dayOfMonthNow < dayOfMonthBirth) age--;  
	            }else{  
	                age--;  
	            }  
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return age+"";
	}
	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验日期是否合法
	 * 
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	  /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        
        return dateStr;
    }
    
    public static void main(String[] args) {
    	System.out.println(getDays());
    	System.out.println(getAfterDayWeek("3"));
    }
    
    /*
	 *获取日期
	 * */
	public static Date getCurrentDate(){
		return new Date();
	}
	/*
	 *获取时间戳
	 * */
	public static String getTimeMin(){
		return String.valueOf(new Date().getTime());
	}
	/**
	 * 改变Date日期中年
	 * */
   public static Date getYearOfDates(Date p_date ,int i) {
          java.util.Calendar c = java.util.Calendar.getInstance();
          c.setTime(p_date);
          c.add(Calendar.YEAR,-i);
          return c.getTime();
  }
	/**
	 * 改变Date日期中月
	 * */
   public static Date getMonthOfDate(Date p_date ,int i) {
          java.util.Calendar c = java.util.Calendar.getInstance();
          c.setTime(p_date);
          c.add(Calendar.MONTH,-i);
          return c.getTime();
  }
   /**
	 * 改变Date日期中日
	 * */
  public static Date getLastOneDate(Date p_date ,int i) {
      java.util.Calendar c = java.util.Calendar.getInstance();
      c.setTime(p_date);
      c.add(Calendar.DATE,i);
      return c.getTime();
  }
  /**
	 * 改变Date日期中时
	 * */
public static Date getShiOneDate(Date p_date ,int i) {
    java.util.Calendar c = java.util.Calendar.getInstance();
    c.setTime(p_date);
    c.add(Calendar.MINUTE,i);
    return c.getTime();
}
  public static String getStringMonth(Date date){
 	 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMM");
      String dateString = formatter.format(date);
      return dateString;
  }
  public static String getStringDay(Date date){
 	 SimpleDateFormat formatter = new SimpleDateFormat("ddHHmmss");
      String dateString = formatter.format(date);
      return dateString;
  }
  public static String getLongStringDay(Date date){
 	 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
      String dateString = formatter.format(date);
      return dateString;
  }
  public static String getStringMonthDate(Date date){
 	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      String dateString = formatter.format(date);
      return dateString;
  }
  public static String getStringMonthDateZi(Date date){
	 	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
	      String dateString = formatter.format(date);
	      return dateString;
	  }
    public static Date getNow(){
      Date currentTime = new Date();
      return currentTime;
  }
  public static String getFullStringDate(Date p_date)
  {
          SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM");
          String dateString = formatter.format(p_date);
          return dateString;
  }
 
  public static String dateToStr(java.util.Date dateDate){
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String dateString = formatter.format(dateDate);
      return dateString;
  }
  public static String getStringDate(){
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String dateString = formatter.format(getNow());
      return dateString;
  }
  public static String getStringDateForYM(){
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      String dateString = formatter.format(getNow());
      return dateString;
  }
  public static String getStringHour(java.util.Date dateDate){
      SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
      String dateString = formatter.format(dateDate);
      return dateString;
  }
  public static String[] getListDate(){
 	 String[] dateList=new String[6];
 	 
 	 for(int i=0;i<6;i++){
 	 Date date=getNow();
 	 date=getMonthOfDate(date,i+1);
 	 String dateString=getFullStringDate(date);
 	 dateList[i]=dateString;
 	 }
 	 return dateList;
  }
  public static Date stringToDate(String stringDate){
 	 SimpleDateFormat simple=new SimpleDateFormat("yyyy年MM月");
 	 ParsePosition pos=new ParsePosition(0);
 	 Date strTodate=simple.parse(stringDate, pos);
 	 return strTodate;
  }
  public static Date stringToDateByHM(String stringDate){
	 	 SimpleDateFormat simple=new SimpleDateFormat("HH:mm");
	 	 ParsePosition pos=new ParsePosition(0);
	 	 Date strTodate=simple.parse(stringDate, pos);
	 	 return strTodate;
	  }
  public static Date stringToDateByAll(String stringDate){
 	 SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 	 ParsePosition pos=new ParsePosition(0);
 	 Date strTodate=simple.parse(stringDate, pos);
 	 return strTodate;
  }
  public static Date stringToDateB(String stringDate){
	 	 SimpleDateFormat simple=new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss");
	 	 ParsePosition pos=new ParsePosition(0);
	 	 Date strTodate=simple.parse(stringDate, pos);
	 	 return strTodate;
	  }
  public static String stringToMinString(String string){
 	 Date d=stringToDate(string);
			String st=dateToStr(d);
			return st;
  }
  public static String stringToMaxString(String string){
 	 Date d=stringToDate(string);
			d=getMonthOfDate(d,-1);
			String st=dateToStr(d);
			return st;
  }
  public static long getLongTime(){
 	 Date date=new Date();
 	
 	 return date.getTime();
  }
  
  public static String getRandom(int num){
	  String s="0123456789";
	  StringBuffer sb=new StringBuffer();
	  for(int i=0;i<num;i++){
		  int id=(int)(Math.random()*(s.length()-1));
		  String code=s.substring(id,id+1);
		  sb.append(code);
	  }
	  return sb.toString();
  }
  
  public static boolean IsBaoXiuQi(Date date,int year){
	  Date dates=DateUtil.getLastOneDate(date, -year);
	  if(dates.getTime()>new Date().getTime()){
		  return true;
	  }else{
		  return false;
	  }
  }

}

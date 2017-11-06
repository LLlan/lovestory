
package com.yizhan.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

/**
 * 说明:
 * Copyright: Copyright (c) 2010
 * @author zhangwr 2011-3-27 下午04:26:27
 * @version 1.0
 */
public class DateTimeUtil {

	/**
	 * @param yyyy-MM-dd
	 * @return
	 */
	public static final String patternA = "yyyy-MM-dd";
	/**
	 * @param yyyyMMdd
	 * @return
	 */
	public static final String patternB = "yyyyMMdd";
	/**
	 * @param yyyy-MM-dd HH-mm-ss
	 * @return
	 */
	public static final String patternC = "yyyy-MM-dd HH-mm-ss";
	/**
	 * @param yyyy:MM:dd HH:mm:ss
	 * @return
	 */
	public static final String patternD = "yyyy-MM-dd HH:mm:ss";
	/**
	 * @param yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static final String patternE = "yyyy-MM-dd HH:mm";
	
	/**
	 * @param yyyyMMddHHmmss
	 * @return
	 */
	public static final String patternF = "yyyyMMddHHmmss";
	
	/**
	 * 中国的年月日格式
	 * yyyy年MM月dd日
	 */
	public static final String patternG = "yyyy年MM月dd日";
	
	/**
	 * @param yyyy-MM
	 * @return
	 */
	public static final String patternH = "yyyy-MM";
	
	/**
	 * 按中国的方式取星期 1
	 */
    public static int WEEK_RULE_CHINA = 1;
    /**
     * 按外国的方式取星期 2
     */
    public static int WEEK_RULE_FOREIGN = 2;
    
    private static Calendar calendar = Calendar.getInstance();
	
	private static DateTimeUtil instance;

	public static DateTimeUtil getInstance() {
		if (instance == null) {
			instance = new DateTimeUtil();
		}
		return instance;
	}
	/**
	 * 格式化日期为yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public String formateDate(Date date){
		return dateToString(date,patternA);
	}
	
	/**
	 * 格式化日期为yyyy-MM
	 * @param date
	 * @return
	 */
	public static String formateYearAndMonth(Date date){
		return dateToString(date,patternH);
	}
	
	/**
	 * @param 取当天日期
	 * @return
	 */
    public Date getDate() {
        return Calendar.getInstance().getTime();
    }
    
    /**
     * 取当天日期
     * @param format
     * @return
     */
    public static String getCurrentDate(String format) {
        if (format == null) {
            format = patternA;
        }
        java.util.Date utilDate = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
        return sdf.format(utilDate);
    }
    
	/**
	 * @param 取指定年月日的日期,格式为yyyy-MM-dd,HH-mm-ss 00-00-00
	 * @return
	 */
    public Date getDate(int year, int month, int day) {
        Calendar cal = Calendar.getInstance();
        cal.set(year, month-1, day,0,0,0);
        return cal.getTime();
        
    }
	/**
	 * @param 取指定年,月,日,小时,分,秒的时间
	 * @return
	 */
    public Date getDate(int year,int month,int date,int hour,int mintue,int second)
	{
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR,year);
		cal.set(Calendar.MONTH,month-1);
		cal.set(Calendar.DATE,date);
		cal.set(Calendar.HOUR_OF_DAY,hour);
		cal.set(Calendar.MINUTE,mintue);
		cal.set(Calendar.SECOND,second);
		return cal.getTime();
	}


	/**
	 * @param days=n n为-,则取n天前,n为+,则取n天后的日期
	 * @param date
	 * @param days
	 * @return
	 */
	public Date getSomeDaysBeforeAfter(Date date, int days){
		GregorianCalendar gc =new GregorianCalendar();
		gc.setTime(date);
		gc.add(5, days);
		gc.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DATE));
		return gc.getTime();
	}
	/**
	 * @param 取指定日期年份
	 * @return
	 */
	public int getDateYear(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.YEAR);
	}
	/**
	 * @param 取指定日期月份
	 * @return
	 */
	public int getDateMonth(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.MONTH)+1;
	}
	/**
	 * @param 取指定日期日份
	 * @return
	 */
	public int getDateDay(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.DATE);
	}	
	/**
	 * @param 取指定日期小时
	 * @return
	 */
	public int getDateHour(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.HOUR_OF_DAY);
	}
	/**
	 * @param 取指定日期分钟
	 * @return
	 */
	public int getDateMinute(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.MINUTE);
	}
	/**
	 * @param 取指定日期的第二天的开始时间,小时,分,秒为00:00:00
	 * @return
	 */
    public Date getNextDayStartTime(Date date) {
    	Calendar c = Calendar.getInstance();
    	c.setTime(date);
    	return getNextDayStart(c.get(Calendar.YEAR),
    			c.get(Calendar.MONTH)+1, c.get(Calendar.DATE));
    }


	/**
	 * @param 取指定年,月,日的下一日的开始时间,小时,分,秒为00:00:00
	 * @param 主要是用来取跨月份的日期
	 * @return
	 */
    public Date getNextDayStart(int year, int month, int date) {
    	month = month - 1;
    	boolean lastDayOfMonth = false;
    	boolean lastDayOfYear = false;
    	
    	Calendar time = Calendar.getInstance();
    	time.set(year, month, date, 0, 0, 0);
    	Calendar nextMonthFirstDay = Calendar.getInstance();
    	nextMonthFirstDay.set(year, month + 1, 1, 0, 0, 0);
    	
    	if (time.get(Calendar.DAY_OF_YEAR) + 1 == nextMonthFirstDay.get(Calendar.DAY_OF_YEAR))
    		lastDayOfMonth = true;
    	
    	if (time.get(Calendar.DAY_OF_YEAR) == time.getMaximum(Calendar.DATE))
    		lastDayOfYear = true;
    	
    	time.roll(Calendar.DATE, 1);
    	
    	if (lastDayOfMonth)
    		time.roll(Calendar.MONTH, 1);
    	
    	if (lastDayOfYear)
    		time.roll(Calendar.YEAR, 1);
    	
    	
    	return time.getTime();
    }

	/**
	 * @param 取指定日期的下一日的时间
	 * @return
	 */
    public Date nextDate(Date date)
    {
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(date);
    	cal.add(Calendar.DATE,1);
    	return cal.getTime();
    }

	/**
	 * @param 指定日期的下一日的开始时间,小时,分,秒为00:00:00
	 * @return
	 */
    public Date getStartDateNext(Date date)
    {
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(date);
    	cal.add(Calendar.DATE,1);
    	cal.set(Calendar.HOUR_OF_DAY,0);
    	cal.set(Calendar.MINUTE,0);
    	cal.set(Calendar.SECOND,0);
    	return cal.getTime();
    }

	/**
	 * @param 指定日期的开始时间,小时,分,秒为00:00:00
	 * @return
	 */
    public Date getStartDateDay(Date date)
    {
    	if(date == null)
    		return null;
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date);
    	cal.set(Calendar.HOUR_OF_DAY,0);
    	cal.set(Calendar.MINUTE,0);
    	cal.set(Calendar.SECOND,0);
    	return cal.getTime();
    }

	/**
	 * @param 指定日期的结束时间,小时,分,秒为23:59:59
	 * @return
	 */
    public Date getEndDateDay(Date date)
    {
    	if(date == null)
    		return null;
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date);
    	cal.set(Calendar.HOUR_OF_DAY,23);
    	cal.set(Calendar.MINUTE,59);
    	cal.set(Calendar.SECOND,59);
    	return cal.getTime();
    }
    
	/**
	 * @param 将指定日期,以指定pattern格式,输出String值
	 * @return
	 */
    public static String dateToString(Date date ,String pattern) {
		if (date == null) {
			return "";
		} else {
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			return format.format(date);
		}
    }


	/**
	 * @param 将指定年,月,日的日期转为字符型,格式为yyyy-MM-dd
	 * @return
	 */
//    public static String dateToString(int year, int month, int day, String pattern) {
//    	return dateToString(getDate(year, month, day), pattern);
//    }


	/**
	 * @param 将指定字符型日期转为日期型,,格式为指定的pattern
	 * @return
	 */
    public static Date stringToDate(String string, String pattern){
        SimpleDateFormat format = (SimpleDateFormat)DateFormat.getDateInstance();
        format.applyPattern(pattern);
        try {
            return format.parse(string);
        } catch (ParseException e) {
            return null;
        }
    }

	/**
	 * @param 将指定字符型日期转为日期型,指定格式为yyyy-MM-dd
	 * @return
	 */
    public static Date stringToDate(String string){
        return stringToDate(string, patternA);
    }

	/**
	 * 获得两个日期之间间隔的天数
	 * @param startDate 起始年月日
	 * @param endDate 结束年月日
	 * @return int
	 */
	public int getDays(Date startDate, Date endDate) {
		int elapsed = 0;
		Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        Date d1 = cal.getTime();
        
        cal.setTime(endDate);
        Date d2 = cal.getTime();
        
        long daterange = d2.getTime() - d1.getTime();
        long time = 1000*3600*24; //一天的毫秒数
        elapsed = (int) (daterange/time);
		return elapsed;
   }
	/**
	 * @param date
	 * @param startTime 格式为0800，表示上午8点00分
	 * @param endTime格式为2200
	 * @return
	 */
	public boolean isWorkHour(Date date,String startTime,String endTime){//是否是工作时间
		if(StringUtils.isEmpty(startTime))
			startTime = "0800";
		if(StringUtils.isEmpty(endTime))
			endTime = "2200";
		int start = Integer.parseInt(startTime);
		int end = Integer.parseInt(endTime);
		int hour = getDateHour(date);
		int m = getDateMinute(date);
		String hstr = hour<=9?"0"+hour:hour+"";
		String mstr = m<=9?"0"+m:m+"";
		int dateInt = Integer.parseInt(hstr+mstr);
		if(dateInt>=start&&dateInt<=end){
			return true;
		}
		return false;
	}
	//取日期的当前月第一天
	public Date getMonthFirstDay(Date date){
		return getDate(getDateYear(date), getDateMonth(date), 1);
	}
	
	  /**
     * 获取几天前的日期,返回相符的格式
     * @param days int
     * @param format String
     * @return String
     */
    public static String getOldDateStr(int days, String format) {
        if (format == null) {
            format = patternD;
        }
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int today = cal.get(Calendar.DAY_OF_MONTH);
        // 该对象变成n天前的日期对象
        cal.set(Calendar.DAY_OF_MONTH, today + days);
        return dateToString(cal.getTime(), format);
    }

    /**
     * 获取星期的列表
     * @param year int
     * @param month int
     * @return ArrayList
     */
    public static ArrayList getWeekListByMonth(int year, int month) {
        Calendar cal = Calendar.getInstance();

        ArrayList list = new ArrayList();
        month--; // 减一后是指定的月
        cal.set(year, month, 1, 0, 0); // 指定某月1号

        // 取出当天所在的星期
        int weekInt = cal.get(Calendar.DAY_OF_WEEK);
        if (weekInt == 1) {
            weekInt = 7;
        }
        weekInt--;
        // 根据当天退后N天,一直退到星期一的那一天,从这一天开始计算星期
        cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - (weekInt - 1));
        String dateString = "";
        for (int i = 0; i < 5; i++) {
            dateString = getDay_Of_Week(cal); // 取星期的第一天
            dateString += "~" + getLastDay_Of_Week(cal); // 取星期的最后一天
            list.add(dateString);
            // 下一天
            cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) + 1);
        }
        return list;
    }


    /**
     * 返回星期的第一天 只被getWeekListByMonth使用
     * @param cal Calendar
     * @return String
     */
    private static String getDay_Of_Week(Calendar cal) {
        int fYear = cal.get(Calendar.YEAR);
        int fMonth = 1 + cal.get(Calendar.MONTH);
        int fDay = cal.get(Calendar.DAY_OF_MONTH);

        String zeroM = "";
        if (fMonth < 10) {
            zeroM = "0";
        }
        String zeroD = "";
        if (fDay < 10) {
            zeroD = "0";
        }

        return fYear + "-" + zeroM + fMonth + "-" + zeroD + fDay;
    }

    /**
     * 返回星期的最后一天 只被getWeekListByMonth使用
     * @param cal Calendar
     * @return String
     */
    private static String getLastDay_Of_Week(Calendar cal) {
        // 星期一退后6天就是星期的最后一天
        cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) + 6);
        return getDay_Of_Week(cal);
    }

    /**
     * 返回星期的第一天
     * @return String
     */

    public static String getFirstDayOfWeek() {
        Calendar fristCal = Calendar.getInstance();
        // 取今天是星期几
        int weekInt = fristCal.get(Calendar.DAY_OF_WEEK);
        if (weekInt == 1) {
            weekInt = 7;
        }
        weekInt--;

        // 根据星期几来确定向后退几天
        fristCal.set(Calendar.DAY_OF_MONTH, fristCal.get(Calendar.DAY_OF_MONTH)
                - (weekInt - 1));

        // 取出年月日,
        int fYear = fristCal.get(Calendar.YEAR);
        int fMonth = (1 + fristCal.get(Calendar.MONTH));
        int fDay = fristCal.get(Calendar.DAY_OF_MONTH);

        String zeroM = "";
        if (fMonth < 10) {
            zeroM = "0";
        }
        String zeroD = "";
        if (fDay < 10) {
            zeroD = "0";
        }
        return fYear + "-" + zeroM + fMonth + "-" + zeroD + fDay;

    }

    /**
     * 返回星期的最后一天
     * @return String
     */

    public static String getLastDayOfWeek() {
        Calendar lastCal = Calendar.getInstance();
        // 取今天是星期几
        int weekInt = lastCal.get(Calendar.DAY_OF_WEEK);
        if (weekInt == 1) {
            weekInt = 7;
        }
        weekInt--;
        // 根据今天是星期几来确定向前进几天
        lastCal.set(Calendar.DAY_OF_MONTH, lastCal.get(Calendar.DAY_OF_MONTH)
                + (7 - weekInt));

        int fYear = lastCal.get(Calendar.YEAR);
        int fMonth = (1 + lastCal.get(Calendar.MONTH));
        int fDay = lastCal.get(Calendar.DAY_OF_MONTH);

        String zeroM = "";
        if (fMonth < 10) {
            zeroM = "0";
        }
        String zeroD = "";
        if (fDay < 10) {
            zeroD = "0";
        }

        return fYear + "-" + zeroM + fMonth + "-" + zeroD + fDay;
    }

    /**
     * 按中国的方式取当天是星期几
     * @return int
     */
    public static int getWeekByChina() {
        int x = calendar.get(Calendar.DAY_OF_WEEK);
        if (x == 1) {
            x = 7;
        }
        return x - 1;
    }

    /**
     * 按国外的方式取当天是星期几
     * @return int
     */

    public static int getWeekByForeign() {
        int x = calendar.get(Calendar.DAY_OF_WEEK);
        return x;
    }

    /**
     * 将星期转换成汉字
     * @param weekInt int
     * @return String
     */
    public static String getWeekInt2Hz(int weekInt, int rule) {
        if (rule != WEEK_RULE_CHINA && rule != WEEK_RULE_FOREIGN) {
            rule = WEEK_RULE_CHINA;
        }
        String hzWeek = null;
        switch (weekInt) {
        case 1:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期一" : "星期日");
            break;
        case 2:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期二" : "星期一");
            break;
        case 3:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期三" : "星期二");
            break;
        case 4:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期四" : "星期三");
            break;
        case 5:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期五" : "星期四");
            break;
        case 6:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期六" : "星期五");
            break;
        case 7:
            hzWeek = (rule == WEEK_RULE_CHINA ? "星期日" : "星期六");
            break;
        default:
            hzWeek = "";
        }
        ;
        return hzWeek;
    }
    
    /**
     * 检测参数年的值是否是闰年
     * @param year int
     * @return boolean
     */
    public static boolean isLeapYear(int year) {
        if ((year % 4 == 0 && year % 400 != 0) || year % 400 == 0) {
            return true;
        } else {
            return false;
        }
    }
    

    /**
     * 取当前天
     * @return int
     */
    public static int getDay() {
      return calendar.get(Calendar.DAY_OF_MONTH);
    }

    /**
     * 取当前月
     * @return int
     */
    public static int getMonth() {
      return (1 + calendar.get(Calendar.MONTH));
    }

    /**
     * 取当前年
     * @return int
     */
    public static int getYear() {
      return calendar.get(Calendar.YEAR);
    }

    /**
     * 此年,此月一共有多少天
     * @param year int
     * @param month int
     * @return int
     */
    public static int days(int year, int month) {
        int returndays = 30;
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8
                || month == 10 || month == 12) {
            returndays = 31;
        } else {
            if (month == 2) {
                if (isLeapYear(year)) {
                    returndays = 29;
                } else {
                    returndays = 28;
                }
            }
        }
        return returndays;
    }

    /**
       * 增加月份
       * @param addMonth
       * @param date 要转化的时间，如果没有，则默认为当前时间．用"yyyy-MMd-dd
       * 调用方法
       * add_months(1)
       * add_months(1,"2006-12-31")
       * "格式的字符串来表示日期
       * @return
       */
    public static String add_months(int addMonth, String... date) {
        String resultDate;
        SimpleDateFormat from_sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        ;
        if (date != null && date.length > 0 && date[0] != null) {
            try {
                java.util.Date tempDate = from_sdf.parse(date[0]);
                cal.setTime(tempDate);
            } catch (ParseException e) {
            }
        }

        cal.add(Calendar.MONTH, addMonth);
        resultDate = from_sdf.format(cal.getTime());
        return resultDate;
    }

    /**
     * 增加日期天数
     * @param day
     * @return
     */
    public static String add_days(int day, String... date) {
        String resultDate;
        SimpleDateFormat from_sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        ;
        if (date != null && date.length > 0 && date[0] != null) {
            try {
                java.util.Date tempDate = from_sdf.parse(date[0]);
                cal.setTime(tempDate);
            } catch (ParseException e) {
            }
        }

        cal.add(Calendar.DAY_OF_YEAR, day);
        resultDate = from_sdf.format(cal.getTime());
        return resultDate;
    }

    /**
     * 比较两个日期大小
     * 日期格式“YYYY-MM-DD hh:mm:ss”
     * @return long 秒级差
     */

    public static long minusDate(String date1, String date2) {

        if (null == date1 || null == date2 || date1.length() == 0
                || date2.length() == 0)
            return 99999999;
        if (date1.length() == 10)
            date1 += " 00:00:00";
        if (date2.length() == 10)
            date2 += " 00:00:00";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long l1 = 0;
        long l2 = 0;
        try {
            l1 = sdf.parse(date1).getTime();
            l2 = sdf.parse(date2).getTime();

        } catch (ParseException ex) {
            ex.printStackTrace();
            System.out.println("Parse DATE String ERROR!" + ex.getMessage());
        }

        return (l2 - l1) / 1000;
    }

    /**
     * 两个日期之间的天数
     * @param fDate
     * @param oDate
     * @return
     */
    public static int daysOfTwo(String fDate, String oDate){
        Date f = DateTimeUtil.stringToDate(fDate, DateTimeUtil.patternA);
        Date o = DateTimeUtil.stringToDate(oDate, DateTimeUtil.patternA);
        return daysOfTwo(f, o);
    }
    /**
     * 两个日期之间的天数
     * @param fDate
     * @param oDate
     * @return
     */
    public static int daysOfTwo(Date fDate, Date oDate) {
        Calendar aCalendar = Calendar.getInstance();
        
        aCalendar.setTime(fDate);
        int day1 = aCalendar.get(Calendar.DAY_OF_YEAR);
        
        aCalendar.setTime(oDate);
        int day2 = aCalendar.get(Calendar.DAY_OF_YEAR);
        
        return day2 - day1;
    }
    
    /**
     * 得到这个月的第几天日期
     * @param day 这个月的第几天,如第一天,则为1
     * @return
     */
    public static String getDayOfMonth(int day, String... date) {
        String resultDate;
        SimpleDateFormat from_sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        ;
        if (date != null && date.length > 0 && date[0] != null) {
            try {
                java.util.Date tempDate = from_sdf.parse(date[0]);
                cal.setTime(tempDate);
            } catch (ParseException e) {
            }
        }

        cal.set(Calendar.DAY_OF_MONTH, day);
        resultDate = from_sdf.format(cal.getTime());
        return resultDate;
    }

    /**
     * 将日期转换为中文大写 如 2011-12-12转为 二〇一一年一十二月一十二日
     * @param String date
     * @return
     */
    public static String getDateForChina(String date) {
        if (date == null || date.length() == 0)
            return "";
        String str = "";
        String[] dateStr = new String[] { "〇", "一", "二", "三", "四", "五", "六",
                "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七",
                "十八", "十九", "二十", "二十一", "二十二", "二十三", "二十四", "二十五", "二十六",
                "二十七", "二十八", "二十九", "三十", "三十一" };
        String year = date.substring(0, 4);
        // 转换年份
        year = dateStr[Integer.valueOf(year.substring(0, 1))]
                + dateStr[Integer.valueOf(year.substring(1, 2))]
                + dateStr[Integer.valueOf(year.substring(2, 3))]
                + dateStr[Integer.valueOf(year.substring(3))];
        str = year + "年";
        if (date.length() <= 5)
            return str;

        // 转换月份
        String month = date.substring(5, 7);
        str += dateStr[Integer.valueOf(month)] + "月";
        if (date.length() <= 8)
            return str;

        // 转换天
        String day = date.substring(8);
        str += dateStr[Integer.valueOf(day)] + "日";

        return str;
    }
    
    /**
     * 根据当前日期 返回一个日期的目录，前后都不加分隔符
     * 例如： 2014/201401/20140115
     * @return
     */
    public static String makeDateDir(){
        String yearMonthDate = DateTimeUtil.getCurrentDate(DateTimeUtil.patternB);
        String year = yearMonthDate.substring(0,4);
        String yearMonth = yearMonthDate.substring(0, 6);
        
        return year+"/"+yearMonth+"/"+yearMonthDate;
    }
    
    /**
     * 根据当前日期 返回一个日期的目录，前后都不加分隔符
     * 例如： 2014/201401/20140115
     * @param pre    是否增加前缀分隔符，true返回：/2014/201401/20140115
     * @param suffix 是否增加后缀分隔符，true返回： 2014/201401/20140115/
     * @return
     */
    public static String makeDateDir(boolean pre, boolean suffix){
        String dateDir = DateTimeUtil.makeDateDir();
        if(pre){
            dateDir = "/"+dateDir;
        }
        if(suffix){
            dateDir = dateDir+"/";
        }
        return dateDir;
    }
    
	public void main(String[] args) {
		//System.out.println(DateUtil.dateToString(DateUtil.getDate(), pattern6));
		//System.out.println(DateUtil.getInstance().dateToString(getMonthFirstDay(new Date()), patternC));
	}
		
}
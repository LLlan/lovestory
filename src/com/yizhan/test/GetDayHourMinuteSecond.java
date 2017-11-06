package com.yizhan.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDayHourMinuteSecond {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//System.out.println(getDistanceTimes("2017-05-18 09:25:25"));
		//String str="sdfsdsfffffffffffffffffffffffffffffffgdasdfasdfffffffffffffffffffffffffffffasrwerqwetasdfgasdfasdfasdf";
		//System.out.println(str.length());
		long curren = System.currentTimeMillis();
        curren += 30 * 60 * 1000;
        Date da = new Date(curren);
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "HH:mm");
        System.out.println(dateFormat.format(da));
		
		
	}
	public static String getDistanceTimes(String str1) {  
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        Date one;  
        Date two;  
        long day = 0;  
        long hour = 0;  
        long min = 0;  
        long sec = 0;  
        try {  
            one = df.parse(str1);  
            two = new Date();  
            long time1 = one.getTime();  
            long time2 = two.getTime();  
            long diff = time2 - time1;   
            day = diff / (24 * 60 * 60 * 1000);  
            hour = (diff / (60 * 60 * 1000) - day * 24);  
            min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);  
            sec = (diff/1000-day*24*60*60-hour*60*60-min*60);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        return day+"天 "+hour+"时 "+min+"分 "+sec+"秒 ";  
    }
}

// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HtmlUtil.java

package com.yizhan.util;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class HtmlUtil{

    public HtmlUtil(){
    }
	/**
	 * This method takes a string which may contain HTML tags (ie, &lt;b&gt;,
	 * &lt;table&gt;, etc) and converts the '&lt'' and '&gt;' characters to
	 * their HTML escape sequences.
	 *
	 * @param in the text to be converted.
	 * @return the input string with the characters '&lt;' and '&gt;' replaced
	 *  with their HTML escape sequences.
	 */
	// Constants used by escapeHTMLTags
    public static final String escapeHTMLTags(String in)
    {
        if(in == null)
            return null;
        int i = 0;
        int last = 0;
        char input[] = in.toCharArray();
        int len = input.length;
        StringBuffer out = new StringBuffer((int)(len * 1.3D));
        for(; i < len; i++)
        {
            char ch = input[i];
            if(ch <= '>')
                if(ch == '<')
                {
                    if(i > last)
                        out.append(input, last, i - last);
                    last = i + 1;
                    out.append(LT_ENCODE);
                } else
                if(ch == '>')
                {
                    if(i > last)
                        out.append(input, last, i - last);
                    last = i + 1;
                    out.append(GT_ENCODE);
                }
        }

        if(last == 0)
            return in;
        if(i > last)
            out.append(input, last, i - last);
        return out.toString();
    }

	/**--把文本格式转换成Html格式显示--*/
	public static String getHtml(String src) {
		if (src != null) {
			// src = src.replace((char) 0x20, (char) 127);
			src = src.replace(String.valueOf((char) 0x20), "&nbsp;");
			// src = src.replace(String.valueOf((char) 0x20), "");
			StringBuffer buffer = new StringBuffer(src.length() + 100);
			StringTokenizer ken = new StringTokenizer(src, "\r\n");
			while (ken.hasMoreElements()) {
				buffer.append((String) ken.nextElement());
				buffer.append("<BR>");
			}
			return buffer.toString();
		} else {
			return "&nbsp;";
		}
	}
	
	/**--把Html文本格式转换成文本格式显示--*/
	public static String htmlToString(String src) {
		if (src != null) {
			// src = src.replace((char) 0x20, (char) 127);
			src = src.replace("&nbsp;", " ");
			// src = src.replace(String.valueOf((char) 0x20), "");
			StringBuffer buffer = new StringBuffer(src.length() + 100);
			StringTokenizer ken = new StringTokenizer(src, "<br>");
			while (ken.hasMoreElements()) {
				buffer.append((String) ken.nextElement());
				buffer.append("\r\n");
			}
			return buffer.toString();
		} else {
			return " ";
		}
	}

    /**  过滤html标签*/
    public  static String html2Text(String inputString) {
        String htmlStr = inputString; //含html标签的字符串
        String textStr ="";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;

        try {
          //定义script的正则表达式{??<script>]*?>[\s\S]*?<\/script> }
         String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; 
         //定义style的正则表达式{??<style>]*?>[\s\S]*?<\/style> }
         String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; 
        
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式

            p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签

            p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签

         textStr = htmlStr;

        }catch(Exception e) {
                    System.err.println("Html2Text: " + e.getMessage());
        }

        return textStr;//返回文本字符??
      }   

    public static String makeHTMLKeyValueOptions(List list)
    {
        StringBuffer sb = new StringBuffer("");
        for(int i = 0; i < list.size(); i++)
        {
            Map map = (Map)list.get(i);
            String keys[] = new String[map.size()];
            map.keySet().toArray(keys);
            String key = map.get(keys[0]).toString();
            String value = map.get(keys[1]).toString();
            sb.append("<option value='").append(key).append("'>").append(value).append("</option>");
        }

        return sb.toString();
    }

    public static String makeHTMLKeyKeyValueOptions(List list)
    {
        StringBuffer sb = new StringBuffer("");
        for(int i = 0; i < list.size(); i++)
        {
            Map map = (Map)list.get(i);
            String keys[] = new String[map.size()];
            map.keySet().toArray(keys);
            String key = map.get(keys[0]).toString();
            String value = map.get(keys[1]).toString();
            sb.append("<option value='").append(key).append("'>").append(key).append(":").append(value).append("</option>");
        }

        return sb.toString();
    }
    
    /**
     * 取得年份的下拉菜单html代码，只有option
     * @param startYear??始年?? endYear结束年份
     * 如果不输入结束年份，默认为当前年
     * @return String
     */
    public static String getYearHtml(int startYear, int... endYear){
  	  if(endYear==null||endYear.length==0||endYear[0]==0)endYear[0]=DateTimeUtil.getYear();
        StringBuffer sb = new StringBuffer();
        for(int i = startYear;i<endYear[0];i++){
            sb.append("<OPTION value=");
            sb.append(i);
            if(i==endYear[0]){
                sb.append(" selected");
            }
            sb.append(">");
            sb.append(i);
            sb.append("</OPTION>");
        }
        return sb.toString();
    }
    /**
     * 取得月份的下拉菜单html代码,只有option
     * @return String
     */
    public static String getMonthHtml(){
        int month = DateTimeUtil.getMonth();
        StringBuffer sb = new StringBuffer();
        for(int i = 1;i<=12;i++){
            String m = null;
            if(i<10){
                m="0"+i;
            }else{
                m=String.valueOf(i);
            }
            if((month-1)==0){
                month=12;
            }
            sb.append("<OPTION value=");
            sb.append(m);
            if(i==(month-1)){
                sb.append(" selected");
            }
            sb.append(">");
            sb.append(m);
            sb.append("</OPTION>");
        }
        return sb.toString();
    }
   /**
    * 小于符合
    */
    private static final char LT_ENCODE[] = "&lt;".toCharArray();
   /**
    * 大于符合
    */ 
    private static final char GT_ENCODE[] = "&gt;".toCharArray();

}

/**
 *  Dao.java	1.00 2008-9-4
 *
 *   络道科技，版权所有.
 */
package com.yizhan.util;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
/**
 * 文件操作工具类
 * <p>
 * Copyright: Copyright (c) 2008
 * </p>
 * <p>
 * Company:络道科技
 * </p>
 * 
 * @author
 * @version 1.0
 */
public class IOUtil {

    /**
     * 读最后一次查询数据库的时间
     * 
     * @param propReadFile
     *            File
     * @return Date
     */
    public static Date readEndTime(File propReadFile) {
        // 如果不存在直接返回为null
        if (!propReadFile.exists()) {
            // log.info(" 读取保存最后访问数据库时间的文件不存在!用当前时间代替.");
            return null;
        }

        Date endtime = null;
        Properties prop = new Properties();
        FileInputStream fProp = null;
        Calendar cal = Calendar.getInstance();

        try {
            fProp = new FileInputStream(propReadFile);
            prop.load(fProp);
        } catch (Exception ex) {
            // log.error(ex);
        }
        String year = prop.getProperty("year");
        String month = prop.getProperty("month");
        String day = prop.getProperty("day");
        String hour = prop.getProperty("hour");
        String min = prop.getProperty("min");

        cal.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer
                .parseInt(day), Integer.parseInt(hour), Integer.parseInt(min),
                0);
        endtime = cal.getTime();

        return endtime;
    }

    /**
     * 写此次读数据库的最后时间
     * 
     * @param writeFile
     *            File
     * @param endDate
     *            Date
     */
    public static void writeEndTime(Date endDate, File propWriteFile) {
        Properties prop = new Properties();
        OutputStream fProp = null;
        try {
            Calendar cal = Calendar.getInstance();
            cal.setTime(endDate);
            fProp = new FileOutputStream(propWriteFile);
            prop.setProperty("year", String.valueOf(cal.get(Calendar.YEAR)));
            prop.setProperty("month", String.valueOf(cal.get(Calendar.MONTH) + 1));
            prop.setProperty("day", String.valueOf(cal.get(Calendar.DATE)));
            prop.setProperty("hour", String.valueOf(cal.get(Calendar.HOUR_OF_DAY)));
            prop.setProperty("min", String.valueOf(cal.get(Calendar.MINUTE)));
            prop.store(fProp, "last_Read_DB_Data_Time");
            fProp.close();
        } catch (Exception ex) {
            // log.error(ex);
            // log.error(" 写此次读数据库的最后时间,失败");
        }
    }

    /**
     * 生成文件,把报文的字符串写到文件中
     * 
     * @param message
     *            String
     * @param newFileName
     *            String
     * @param newFilePath
     *            String
     */
    public static void makeNewFile(String message, String newFileName,
            String newFilePath) {
        try {
            File outFile = new File(newFilePath);
            // 判断目录是否存在
            if (!outFile.exists()) {
                outFile.mkdirs();
            }
            outFile = new File(newFilePath + newFileName);
            FileOutputStream fos = new FileOutputStream(outFile);
            PrintWriter pw = new PrintWriter(fos);
            pw.write(message);
            pw.flush();
            pw.close();
            fos.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static boolean createDir(String absolutePath) {
        File file = new File(absolutePath);
        if (!file.exists()) {
            return file.mkdirs();
        } else {
            return true;
        }
    }

    public static boolean createFile(String absolutePathFile) {
        File file = new File(absolutePathFile);
        return createFile(file);
    }

    public static boolean createFile(File file) {
        if (!file.exists()) {
            try {
                return file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        } else {
            return true;
        }
    }

    public static boolean deleteFile(String absolutePathFile) {
        File file = new File(absolutePathFile);
        return deleteFile(file);
    }

    public static boolean deleteFile(File file) {
        if (file.exists()) {
            if (!file.delete()) {
                file.deleteOnExit();
                return true;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }

    /**
     * 将list对象中的信息全部写入文件中,
     * 
     * @param list
     *            列表对象 里面保存的是String
     * @param absolutePathFile
     *            绝对文件路径
     * @param isAppend
     *            是否追加
     */
    public static void writeFile(ArrayList list, String absolutePathFile,
            boolean isAppend) {
        if (list == null || list.size() == 0) {
            return;
        }
        if (absolutePathFile == null) {
            return;
        }

        File file = new File(absolutePathFile);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException ex3) {
                ex3.printStackTrace();
            }
        }

        try {
            FileOutputStream fos = null;
            if (isAppend) {
                fos = new FileOutputStream(file, true);
            } else {
                fos = new FileOutputStream(file);
            }
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            PrintWriter pw = new PrintWriter(bos);
            for (int i = 0; i < list.size(); i++) {
                pw.println((String) list.get(i));
            }
            pw.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 将list对象中的信息全部写入文件中,
     * 
     * @param msg
     *            字符串信息
     * @param absolutePathFile
     *            绝对文件路径
     * @param isAppend
     *            是否追加
     */
    public static void writeFile(String msg, String absolutePathFile,
            boolean isAppend) {
        if (absolutePathFile == null) {
            return;
        }
        File file = new File(absolutePathFile);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException ex3) {
                ex3.printStackTrace();
            }
        }

        try {
            FileOutputStream fos = null;
            if (isAppend) {
                fos = new FileOutputStream(file, true);
            } else {
                fos = new FileOutputStream(file);
            }
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            PrintWriter pw = new PrintWriter(bos);
            pw.println(msg);
            pw.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 读取文件,返回以字符串形式表示的文件
     * 
     * @param file
     * @return
     */
    public static String readFile(File file) {
        StringBuffer sb = new StringBuffer();
        if (!file.exists()) {
            return "";
        }
        try {
            FileInputStream fis = new FileInputStream(file);
            BufferedReader br = new BufferedReader(new InputStreamReader(fis));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    
    public static void main(String[] args) {
    	File file = new File("c:\\utf.ldif");
    	//System.out.println(StringUtil.convert(IOUtil.readFile(file),null));
    }

}

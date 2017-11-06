package com.yizhan.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;

import com.yizhan.controller.app.payUtil.AlipayConfig;

public class FileUtil {

	/**
	 * 创建TXT文本并写入
	 * 功能：
	 * 作者：lj
	 * 日期：2017-3-4
	 */
	 public static boolean createFileAndWrite(String phone,String txt)throws Exception{  
		//先创建一个文件夹，没有就创建，有就不创建
	     FileUtil.createDir(AlipayConfig.log_path);
		 try{  
			    OutputStreamWriter pw = null;//定义一个流
				pw = new OutputStreamWriter(new FileOutputStream(AlipayConfig.log_path+phone+"-"+DateUtil.getTimes()+".txt"),"utf-8");//确认流的输出文件和编码格式，此过程创建了“test.txt”实例
				pw.write(txt);//将要写入文件的内容，可以多次write
				pw.close();//关闭流
		 }catch(Exception e){  
			 e.printStackTrace();  
		 }  
		 return true;  
	 }  
	 
	 /** 
	  * 读TXT文件内容 
	  * @param fileName 
	  * @return 
	  */  
	 public static String readTxtFile(File fileName)throws Exception{  
		  String result=null;  
		  FileReader fileReader=null;  
		  BufferedReader bufferedReader=null;  
		  try{  
		   fileReader=new FileReader(fileName);  
		   bufferedReader=new BufferedReader(fileReader);  
		   try{  
		    String read=null;  
		    while((read=bufferedReader.readLine())!=null){  
		     result=result+read+"\r\n";  
		    }  
		   }catch(Exception e){  
		    e.printStackTrace();  
		   }  
		  }catch(Exception e){  
		   e.printStackTrace();  
		  }finally{  
		   if(bufferedReader!=null){  
		    bufferedReader.close();  
		   }  
		   if(fileReader!=null){  
		    fileReader.close();  
		   }  
		  }  
		  System.out.println("读取出来的文件内容是："+"\r\n"+result);  
		  return result;  
	 } 
	 
	 /**
	  * 写文本到TXT文件中
	  * 功能：
	  * 作者：lj
	  * 日期：2017-3-6
	  */
	 public static boolean writeTxtFile(String content,File  fileName)throws Exception{  
		  RandomAccessFile mm=null;  
		  boolean flag=false;  
		  FileOutputStream o=null;  
		  try {  
		   o = new FileOutputStream(fileName);  
		      o.write(content.getBytes("GBK"));  
		      o.close();  
		//   mm=new RandomAccessFile(fileName,"rw");  
		//   mm.writeBytes(content);  
		   flag=true;  
		  } catch (Exception e) {  
		   // TODO: handle exception  
		   e.printStackTrace();  
		  }finally{  
		   if(mm!=null){  
		    mm.close();  
		   }  
		  }  
		  return flag;  
		 }  
	 
	 
	 /**
	  * 把其他文件（如word,TXT）的文本内容读取出来并写入新的TXT文本中
	  * 功能：
	  * 作者：lj
	  * 日期：2017-3-6
	  */
	 public static void contentToTxt(String filePath, String content){  
	        String str = new String(); //原有txt内容  
	        String s1 = new String();  //内容更新  
	        try {  
	            File f = new File(filePath);  
	            if (f.exists()) {  
	                System.out.print("文件存在");  
	            } else {  
	                System.out.print("文件不存在");  
	                f.createNewFile();// 不存在则创建  
	            }  
	            BufferedReader input = new BufferedReader(new FileReader(f));  
	  
	            while ((str = input.readLine()) != null) {  
	                s1 += str + "\n";  
	            }  
	            System.out.println(s1);  
	            input.close();  
	            s1 += content;  
	  
	            BufferedWriter output = new BufferedWriter(new FileWriter(f));  
	            output.write(s1);  
	            output.close();  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	  
	        }  
	    }  
	  
	
	
	 /** 
	  * 创建文件 如txt文本
	  * @param fileName 
	  * @return 
	  */  
	 public static boolean createFile(File fileName)throws Exception{  
		 boolean flag=false;  
		  try{  
			   if(!fileName.exists()){  
				   fileName.createNewFile();  
				   flag=true;  
			   }  
		  }catch(Exception e){  
			  e.printStackTrace();  
		  }  
	  	 return true;  
	 }   
	
	   

	/**
	 * 创建目录，创建文件夹
	 * 
	 * @param destDirName
	 *            目标目录名
	 * @return 目录创建成功返回true，否则返回false
	 */
	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if (dir.exists()) {
			return false;
		}
		if (!destDirName.endsWith(File.separator)) {
			destDirName = destDirName + File.separator;
		}
		// 创建单个目录
		if (dir.mkdirs()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除文件
	 * 
	 * @param filePathAndName
	 *            String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static void delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePath);
			myDelFile.delete();

		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();

		}

	}

	/**
	 * 读取到字节数组0
	 * 
	 * @param filePath //路径
	 * @throws IOException
	 */
	public static byte[] getContent(String filePath) throws IOException {
		File file = new File(filePath);
		long fileSize = file.length();
		if (fileSize > Integer.MAX_VALUE) {
			System.out.println("file too big...");
			return null;
		}
		FileInputStream fi = new FileInputStream(file);
		byte[] buffer = new byte[(int) fileSize];
		int offset = 0;
		int numRead = 0;
		while (offset < buffer.length
				&& (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
			offset += numRead;
		}
		// 确保所有数据均被读取
		if (offset != buffer.length) {
			throw new IOException("Could not completely read file "
					+ file.getName());
		}
		fi.close();
		return buffer;
	}

	/**
	 * 读取到字节数组1
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(f));
			int buf_size = 1024;
			byte[] buffer = new byte[buf_size];
			int len = 0;
			while (-1 != (len = in.read(buffer, 0, buf_size))) {
				bos.write(buffer, 0, len);
			}
			return bos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bos.close();
		}
	}

	/**
	 * 读取到字节数组2
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray2(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}

		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(f);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				channel.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Mapped File way MappedByteBuffer 可以在处理大文件时，提升性能
	 * 
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray3(String filePath) throws IOException {

		FileChannel fc = null;
		RandomAccessFile rf = null;
		try {
			rf = new RandomAccessFile(filePath, "r");
			fc = rf.getChannel();
			MappedByteBuffer byteBuffer = fc.map(MapMode.READ_ONLY, 0,
					fc.size()).load();
			//System.out.println(byteBuffer.isLoaded());
			byte[] result = new byte[(int) fc.size()];
			if (byteBuffer.remaining() > 0) {
				// System.out.println("remain");
				byteBuffer.get(result, 0, byteBuffer.remaining());
			}
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				rf.close();
				fc.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	
	/**
	 * 将某一路径下的文件全部重命名
	 * @param absolutePath 需要重命名的路径
	 * @param baseName 基础文件
	 * @param suffix 后缀名
	 */
	
	public static void FileToNewName(String absolutePath, String baseName,String suffix) {
		File file = new File(absolutePath);
		// 判断路径是否存在且是否为目录
		if (file.exists() && file.isDirectory()) {
			File[] fileList = file.listFiles();
			// 遍历目录，获取目录下文件列表
			for (int i = 0; i < fileList.length; i++) {
				File file2 = fileList[i];
				// 将其重命名成本路径下的 文件
				file2.renameTo(new File(file2.getParent()+ File.separator + baseName+ i + "." + suffix));
			}
		}
	}
	public static String renameDirectory(String fromDir, String toDir) {

	    File from = new File(fromDir);

	    if (!from.exists() || !from.isDirectory()) {
	      System.out.println("Directory does not exist: " + fromDir);
	      return "";
	    }

	    File to = new File(toDir);

	    //Rename
	    if (from.renameTo(to)){
	    	System.out.println("Success!");
	    	return toDir;
	    }else{
	    	System.out.println("Error");
	    	return "";
	    }
	}

	/*public static void main(String[] args) {
	    FileUtil fileutil = new FileUtil();
	    fileutil.renameDirectory("/temp", "/temp2");
	}*/
	public static void main(String[] args) {
		FileToNewName("E:\\file_Test","photo","gif");
	}
}
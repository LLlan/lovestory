package com.yizhan.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件
 * 创建人：FH 创建时间：2014年12月23日
 * @version
 */
public class FileUpload {

	/**上传文件到指定路径
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp1(MultipartFile file, String filePath, String fileName){
		String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;
	}
	
	/**
	 * 写文件到当前目录的upload目录中
	 * 
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
	
	
	
		/**
		 * 上传图片并压缩
		 * 功能：
		 * 作者：lj
		 * 日期：2017-7-20
		 */
		public static String fileUp(MultipartFile file, String filePath, String fileName) throws IOException {
			InputStream in=file.getInputStream();
			filePath = filePath+"/";
			
			//获取上传图片的后缀名
			String subfix =file.getOriginalFilename().toString().substring(file.getOriginalFilename().lastIndexOf("."));	
			File file1 = new File(filePath, fileName+subfix);
			if (!file1.exists()) {
				if (!file1.getParentFile().exists()) {
					file1.getParentFile().mkdirs();
				}
				file1.createNewFile();
			}
			
			File file2 = new File(filePath, fileName+subfix);
			FileUtils.copyInputStreamToFile(in, file2);
			//新图片的名字
			String newFileName=UuidUtil.get32UUID();
			
			Thumbnails.of(filePath+fileName+subfix)  
		    .scale(1f)  
		    .outputQuality(0.25f)  
		    .toFile(filePath+newFileName+subfix);
			System.out.println("==============压缩后删除原来的图片是：============"+filePath+fileName+subfix);
			if(Tools.notEmpty(filePath+fileName+subfix)){
				FileUtil.delFile(filePath+fileName+subfix);
			}
			
			return newFileName+subfix;
		}
		public static void mkdirs(String destPath) {  
	        File file =new File(destPath);      
	        //当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)  
	        if (!file.exists() && !file.isDirectory()) {  
	            file.mkdirs();  
	        }  
	    }  
		
}

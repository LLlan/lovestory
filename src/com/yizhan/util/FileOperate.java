package com.yizhan.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;

public class FileOperate {
	private final static Logger log = Logger.getLogger(FileOperate.class);
	/**
	 * 系统路径分隔符
	 */
	public static final char FILE_SPT = File.separatorChar;

	// protected Logger logger = LoggerFactory.getLogger(getClass());
	private static final int BUFFER_SIZE = 16 * 1024;

	private static final long VIRTUAL_MEMORY_SIZE = 512 * 1024 * 1024;

	private static final String CHARTSET = "UTF-8";

	public static String toLocalDir(String dir) {
		String osName = System.getProperty("os.name").toLowerCase();
		return toLocalDir(osName, dir);
	}

	public static String toLocalDir(String osName, String dir) {
		String osName1 = osName.toLowerCase();
		if (osName1.indexOf("windows") != -1) {
			return dir.replace('/', '\\'); 
		}

		return dir.replace('\\', '/');
	}

	public static String addPath(String headPath, String behindPath) {
		if (null == headPath || headPath.length() <= 0) {
			throw new IllegalArgumentException(
					"headPath must input and length > 0");
		}

		String headPath1 = FileOperate.toLocalDir(headPath);
		String behindPath1 = FileOperate.toLocalDir(behindPath);
		StringBuffer path = new StringBuffer(headPath1);
		if (path.lastIndexOf(File.separator) == path.length() - 1) {
			path.deleteCharAt(path.length() - 1);
		}

		if (behindPath1.indexOf(File.separator) != 0) {
			path.append(File.separator);
		}
		path.append(behindPath1);
		return path.toString();
	}

	public static boolean createDir(String dir) {
		boolean result = false;
		File f = new File(toLocalDir(dir));
		if (f.exists()) {
			return true;
		}
		result = f.mkdir();
		if (!result) {
			result = f.mkdirs();
		}
		return result;
	}

	public static boolean deleteDir(String dir) {
		File f = new File(toLocalDir(dir));
		if (f.exists()) {
			delete(f);
		}
		return true;
	}

	public static boolean createFile(String filePath) {
		File f = new File(toLocalDir(filePath));
		if (f.exists()) {
			return true;
		}
		try {
			return f.createNewFile();
		} catch (IOException e) {
			log.error("createFile error", e);

			return false;
		}

	}

	public static boolean deleteFile(String file) {
		File f = new File(toLocalDir(file));
		if (f.exists()) {
			return f.delete();
		}
		return false;
	}

	private static void delete(File file) {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory()) {
					delete(files[i]);
				} else {
					files[i].delete();
				}
			}
			file.delete();
		} else {
			file.delete();
		}
	}

	public static void copyFile(String filePath, File srcFile) throws Exception {
		File dstFile = new File(filePath);
		dstFile.getParentFile().mkdirs();
		if (!dstFile.exists())
			dstFile.createNewFile();
		FileOperate.copy(srcFile, dstFile);
	}

	/**
	 * 拷贝文件
	 * 
	 * @param src
	 * @param dst
	 * @throws Exception
	 */
	public static void copy(File src, File dst) throws Exception {
		InputStream srcIo = null;
		try {
			long srctime = src.lastModified();
			if (dst.exists()) {
				long srcfilesize = src.length();
				long dstfilesize = dst.length();
				long dsttime = dst.lastModified();
				if (srcfilesize == dstfilesize && srctime == dsttime) {
					return;
				}
			}
			srcIo = new FileInputStream(src);
			copyStream(srcIo, dst, src.length());
			dst.setLastModified(srctime);
		} catch (FileNotFoundException e) {
			StringBuilder msg = new StringBuilder(src.getAbsolutePath());
			msg.append("文件不存在!");
			log.error(msg.toString(), e);
			throw e;
		} catch (IOException e) {
			StringBuilder msg = new StringBuilder(src.getAbsolutePath());
			msg.append("复制到");
			msg.append(dst.getAbsolutePath());
			msg.append("文件失败!");
			log.error(msg.toString(), e);
			throw e;
		} finally {
			if (srcIo != null)
				srcIo.close();
		}
	}

	/**
	 * 保存
	 * 
	 * @param src
	 * @param dst
	 * @throws Exception
	 */
	public static void copyStream(InputStream src, File dst) throws Exception {
		copyStream(src, dst, -1);
	}

	private static void copyStream(InputStream src, File dst,
			final long byteCount) throws Exception {
		try {
			if (!dst.exists()) {
				dst.createNewFile();
			}
			if (src instanceof FileInputStream && byteCount > -1) {
				FileChannel srcChannel = ((FileInputStream) src).getChannel();
				FileChannel dstChannel = new FileOutputStream(dst).getChannel();
				if (VIRTUAL_MEMORY_SIZE > byteCount) {
					srcChannel.transferTo(0, srcChannel.size(), dstChannel);
				} else {
					long postion = 0;
					while (byteCount > postion) {
						long needCopyByte = byteCount - postion;
						if (needCopyByte > VIRTUAL_MEMORY_SIZE) {
							needCopyByte = VIRTUAL_MEMORY_SIZE;
						}
						postion += srcChannel.transferTo(postion, needCopyByte,
								dstChannel);
					}
				}
				srcChannel.close();
				dstChannel.close();
			} else {
				BufferedInputStream in = new BufferedInputStream(src,
						BUFFER_SIZE);
				OutputStream out = new BufferedOutputStream(
						new FileOutputStream(dst), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				int len = 0;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				in.close();
				out.close();
			}
		} catch (Exception e) {
			log.error("文件复制失败", e);
			throw e;
		}
	}

	public static void createPhotoPath(String path) {
		File photoFile = new File(path);
		// 如果不存在路径
		if (!photoFile.exists()) {
			// 建立路径
			photoFile.mkdirs();
		}
	}

	/**
	 * 删除文件
	 * 
	 * @param dir
	 * @param pic
	 */
	public static void deleteFile(String dir, String pic) {
		if (pic != null && !pic.trim().equals("")) {
			String pic1 = FileOperate.toLocalDir(pic);
			String dir1 = FileOperate.toLocalDir(dir);
			if (dir1.lastIndexOf(File.separatorChar) == dir1.length() - 1) {
				pic1 = dir1
						+ pic1
								.substring(pic1.lastIndexOf(File.separatorChar) + 1);
			} else {
				pic1 = dir1
						+ File.separatorChar
						+ pic1
								.substring(pic1.lastIndexOf(File.separatorChar) + 1);
			}

			File f = new File(pic1);
			if (f.exists()) {
				f.delete();
			}
		}
	}

	/**
	 * @Description: 从路径中得到文件名
	 * @param fileFullPath
	 *            文件的全路径
	 * @param spt
	 *            路径分隔符
	 * @return String 文件名
	 */
	public static String getFileName(String fileFullPath, String spt) {
		String fileName = "";
		if (null != fileFullPath) {
			String fileFullPathTemp = fileFullPath.trim();
			if (!"".equals(fileFullPathTemp)) {
				int sptLocation = fileFullPathTemp.lastIndexOf(spt);
				if (sptLocation > -1
						&& sptLocation != fileFullPathTemp.length() - 1) {
					fileName = fileFullPathTemp.substring(sptLocation + 1);
				}
			}
		}
		return fileName;
	}

	/**
	 * 
	 * 目录复制
	 * 
	 * @param srcPath
	 *            源目录
	 * @param dstPath
	 *            目标目录
	 * @throws Exception
	 * 
	 */
	public static void copyDirectory(String srcPath, String dstPath)
			throws Exception {
		copyDirectory(new File(srcPath), new File(dstPath));
	}

	/**
	 * 目录复制
	 * 
	 * @param srcPath
	 *            源目录
	 * @param dstPath
	 *            目标目录
	 * @throws IOException
	 */
	public static void copyDirectory(File srcPath, File dstPath)
			throws Exception {

		if (srcPath.isDirectory()) {

			if (!dstPath.exists()) {
				dstPath.mkdirs();
			}

			String files[] = srcPath.list();

			for (int i = 0; i < files.length; i++) {
				copyDirectory(new File(srcPath, files[i]), new File(dstPath,
						files[i]));

			}

		}

		else {
			if (!srcPath.exists()) {			
				log.error("File or directory " + srcPath + "does not exist.");
			} else {
				copy(srcPath, dstPath);
			}
		}
	}

	public static Set<String> listFile(String path) {
		Set<String> result = new HashSet<String>();
		if (null == path || path.length() <= 0) {
		//	throw new IllegalArgumentException("path must input and length > 0");
			log.error("path must input and length > 0");
		}
		String path1 = FileOperate.toLocalDir(path);
		File dir = new File(path1);
		if (null != dir && dir.exists() && dir.isDirectory()) {
			File[] files = dir.listFiles();
			if (null != files) {
				int fileslen = files.length;
				for (int i = 0; i < fileslen; i++) {
					File file = files[i];
					if (file.isFile()) {
						result.add(file.getName());
					}
				}
			}
		}
		return result;
	}

	/**
	 * 
	 * 获取文件或文件夹总大小，单位byte
	 * 
	 * @param f
	 * @return
	 * 
	 */
	public static long getFileSize(File f) {
		long size = 0;
		if (f.exists()) {
			if (f.isDirectory()) {
				File flist[] = f.listFiles();
				for (int i = 0; i < flist.length; i++) {
					size += getFileSize(flist[i]);
				}
			} else
				size += f.length();
		}
		return size;
	}

	/**
	 * @Description: 移动文件或者文件夹
	 * @param srcFilePath
	 *            来源文件或者文件夹
	 * @param destFilePath
	 *            目标文件或者文件夹
	 * @return void
	 * @throws Exception
	 */
	public static void move(String srcFilePath, String destFilePath)
			throws Exception {
		File srcFile = new File(srcFilePath);
		if (!srcFile.exists()) {
			return;
		}
		File destFile = new File(destFilePath);
		if (destFile.exists()) {
			destFile.delete();
		}
		String srcParent = srcFile.getParent();
		String destParent = destFile.getParent();
		boolean renameflag = false;
		if (null != srcParent && srcParent.equals(destParent)) {
			renameflag = srcFile.renameTo(destFile);
		}
		if (!renameflag) {
			// 将临时文件目录重命名为数据目录
			copyDirectory(srcFilePath, destFilePath);
			deleteDir(srcFilePath);
		}
	}

	/**
	 * 镜像
	 * 
	 * @param srcPath
	 *            来源文件
	 * @param dstPath
	 *            目标文件
	 * @throws Exception
	 * 
	 */
	public static void mirror(File srcPath, File dstPath) throws Exception {
		mirrordelFile(srcPath, dstPath);
		copyDirectory(srcPath, dstPath);
	}

	// 镜像 根据目标 删除 来源的文件
	private static void mirrordelFile(File src, File dest) {
		if (!dest.exists()) {
			return;
		}
		if (!src.exists()) {
			if (dest.isDirectory()) {
				delete(dest);
			} else {
				dest.delete();
			}
			return;
		}

		if (dest.isDirectory()) {
			if (src.isFile()) {
				dest.delete();
			} else {
				File[] chilefiles = dest.listFiles();
				if (null != chilefiles && chilefiles.length > 0) {
					for (int i = 0; i < chilefiles.length; i++) {
						File dest2 = chilefiles[i];
						String filename = dest2.getName();
						String srcPath = src.getPath();
						File src2 = new File(srcPath + File.separator
								+ filename);
						mirrordelFile(src2, dest2);
					}
				}
			}
		} else {
			if (src.isDirectory()) {
				dest.delete();
			}
		}
	}

	/**
	 * 使用UTF-8字符集 把字符串写入文件中
	 * 
	 * @param text
	 * @throws IOException
	 * 
	 */
	public static void writeFile(File file, String text) throws IOException {
		writeFile(file, text, CHARTSET);
	}

	/**
	 * 根据字符集 把字符串写入文件中
	 * 
	 * @param text
	 * @param chartset
	 * @throws IOException
	 * 
	 */
	public static void writeFile(File file, String text, String chartset)
			throws IOException {
		if (!file.exists()) {
			file.createNewFile();
		}
		OutputStream os = new BufferedOutputStream(new FileOutputStream(file));
		byte[] b = text.getBytes(chartset);
		os.write(b);
		os.close();
	}

	/**
	 * 
	 * 扫描目录中的符合文件命名的文件
	 * 
	 * @param dir
	 *            扫描目录
	 * @param beforePtn
	 *            文件名开头
	 * @param afterPtn
	 *            文件名结尾
	 * @return
	 * 
	 */
	public static List<String> scanFileByFileNamePattern(String dir,
			String beforePtn, String afterPtn) {
		List<String> confFiles = new ArrayList<String>();
		Set<String> fileList = listFile(dir);
		Iterator<String> it = fileList.iterator();
		while (it.hasNext()) {
			String fname = it.next();
			if (fname.startsWith(beforePtn) && fname.endsWith(afterPtn))
				confFiles.add(fname);
		}
		if (confFiles.size() == 0)
			return null;
		return confFiles;
	}
	
	/**
	 * Description: 向FTP服务器上传文件
	 * @param url FTP服务器hostname
	 * @param port FTP服务器端口
	 * @param username FTP登录账号
	 * @param password FTP登录密码
	 * @param path FTP服务器保存目录
	 * @param filename 上传到FTP服务器上的文件名
	 * @param input 输入流
	 * @return 成功返回true，否则返回false
	 */
	public static boolean uploadFile(String url, int port, String username,
			String password, String path, String filename, InputStream input,int connectTimeout) {
		boolean success = false;
		FTPClient ftp = new FTPClient();
		try {
			int reply;
			// 连接FTP服务器
			ftp.setConnectTimeout(connectTimeout*1000);
			ftp.connect(url, port);
			// 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
			ftp.login(username, password);// 登录
			// 看返回的值是不是230，如果是，表示登陆成功
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				log.error("ftp login fail!\n login data:url="+url+",port="+port+",user="+username);
				ftp.disconnect();
				return success;
			}
			
			log.info("ftp login success.\n login data:url="+url+",port="+port+",user="+username);
			// 转到指定上传目录
			ftp.changeWorkingDirectory(path);
			// 将上传文件存储到指定目录
			ftp.storeFile(filename, input);
			// 关闭输入流
			input.close();
			// 退出ftp
			ftp.logout();
			success = true;
		} catch (IOException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException ioe) {
				}
			}
		}
		return success;
	}

    /**
     * 判断文件的编码格式
     * @param fileName :file
     * @return 文件编码格式
     * @throws Exception
     */
    public static String getFileEncoding(String fileName) {
        BufferedInputStream bin;
        String code = "GBK";
        try {
            bin = new BufferedInputStream(new FileInputStream(fileName));
            int p = (bin.read() << 8) + bin.read();
            switch (p) {
            case 0xefbb:
                code = "UTF-8";
                break;
            case 0xfffe:
                code = "Unicode";
                break;
            case 0xfeff:
                code = "UTF-16BE";
                break;
            default:
                code = "GBK";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return code;
    }
    
    /**
     * 得到文件的md5值
     * @param file 要加密的文件
     * @return 文件的md5值
     */
    public static String getMD5ByFile(File file){
        String md5Value = null;
        FileInputStream in = null;
        try {
            //得到文件流对象
            in = new FileInputStream(file);
            //得到文件读取、写入、映射和操作的通道
            FileChannel fc = in.getChannel();
            //将此通道文件区域全部映射到内存
            MappedByteBuffer byteBuffer = fc.map(FileChannel.MapMode.READ_ONLY, 0, file.length());
            
            //得到MD5摘要对象
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            //使用指定的byteBuffer跟新摘要
            md5.update(byteBuffer);
            //得到hash值结果数组
            byte[] hashResult = md5.digest();
            //将二进制数组转换为十六进制字符串
            BigInteger bi = new BigInteger(1,hashResult);
            md5Value = bi.toString(16);
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } finally{
            if(null != in){
                try {
                    in.close();//关闭流
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return md5Value;
    }
}
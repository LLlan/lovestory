package com.yizhan.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpConnectionManager;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.params.HttpConnectionManagerParams;
import org.apache.commons.httpclient.params.HttpMethodParams;


/**
 * 本类为：https/https报文发送处理类
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2013</p>
 * @version V1.0
 */
public class HttpUtil {

    /** = */
    public static final String QSTRING_EQUAL = "=";
    /** & */
    public static final String QSTRING_SPLIT = "&";
    
	public static String encoding;
    private static final HttpClient client;

    static {
    	HttpConnectionManagerParams params = loadHttpConfFromFile();
    	
    	HttpConnectionManager connectionManager = new MultiThreadedHttpConnectionManager();
        connectionManager.setParams(params);

        client = new HttpClient(connectionManager);
    }
    
    private static HttpConnectionManagerParams loadHttpConfFromFile(){
        Properties p  = new Properties();
        try {
			p.load(HttpUtil.class.getResourceAsStream(HttpUtil.class.getSimpleName().toLowerCase() + ".properties"));
		} catch (IOException e) {
		}
		
		encoding = p.getProperty("http.content.encoding");
		
		HttpConnectionManagerParams params = new HttpConnectionManagerParams();
        params.setConnectionTimeout(Integer.parseInt(p.getProperty("http.connection.timeout")));
        params.setSoTimeout(Integer.parseInt(p.getProperty("http.so.timeout")));
        params.setStaleCheckingEnabled(Boolean.parseBoolean(p.getProperty("http.stale.check.enabled")));
        params.setTcpNoDelay(Boolean.parseBoolean(p.getProperty("http.tcp.no.delay")));
        params.setDefaultMaxConnectionsPerHost(Integer.parseInt(p.getProperty("http.default.max.connections.per.host")));
        params.setMaxTotalConnections(Integer.parseInt(p.getProperty("http.max.total.connections")));
        params.setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(0, false));
		return params;
    }
    
	public static String post(String url, String encoding, String content) {
		try {
			byte[] resp = post(url, content.getBytes(encoding));
			if (null == resp)
				return null;
			return new String(resp, encoding);
		} catch (UnsupportedEncodingException e) {
			return null;
		}
	}
    
    
	public static String post(String url, String content) {
    	return post(url, encoding, content);
    }


    public static byte[] post(String url, byte[] content) {
		try {
			byte[] ret = post(url, new ByteArrayRequestEntity(content));
			return ret;
		} catch (Exception e) {
			return null;
		}
    }

    public static byte[] post(String url, RequestEntity requestEntity) throws Exception {

        PostMethod method = new PostMethod(url);
        method.addRequestHeader("Connection", "Keep-Alive");
        method.getParams().setCookiePolicy(CookiePolicy.IGNORE_COOKIES);
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(0, false));
        method.setRequestEntity(requestEntity);
        method.addRequestHeader("Content-Type","application/x-www-form-urlencoded");
        
        try {
            int statusCode = client.executeMethod(method);
            if (statusCode != HttpStatus.SC_OK) {
                return null;
            }
            return method.getResponseBody();

        } catch (SocketTimeoutException e) {
        	return null;
        } catch (Exception e) {
        	return null;
        } finally {
            method.releaseConnection();
        }
    }
    
    /**
     * 把请求要素按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param para 请求要素
     * @param sort 是否需要根据key值作升序排列
     * @param encode 是否需要URL编码
     * @return 拼接成的字符串
     */
    public static String createLinkString(Map<String, String> para, boolean sort, boolean encode) {
        List<String> keys = new ArrayList<String>(para.keySet());
        
        if (sort)
            Collections.sort(keys);

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = para.get(key);
            if(value==null){
                value = "";
            }
            
            if (encode) {
                try {
                    value = URLEncoder.encode(value, HttpUtil.encoding);
                } catch (UnsupportedEncodingException e) {
                }
            }
            
            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                sb.append(key).append(QSTRING_EQUAL).append(value);
            } else {
                sb.append(key).append(QSTRING_EQUAL).append(value).append(QSTRING_SPLIT);
            }
        }
        return sb.toString();
    }
    public static String getUrl(String geturl){
    	StringBuffer strBuf;
    
		strBuf = new StringBuffer();
			
		try{
			URL url = new URL(geturl);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));//转码。
			String line = null;
			while ((line = reader.readLine()) != null)
			    strBuf.append(line + " ");
			    reader.close();
		}catch(MalformedURLException e) {
			e.printStackTrace(); 
		}catch(IOException e){
			e.printStackTrace(); 
		}
		return strBuf.toString();
    }
}

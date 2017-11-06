 package com.yizhan.interceptor;
 
import com.yizhan.entity.system.Menu;
import com.yizhan.entity.system.User;
import com.yizhan.util.Const;
import com.yizhan.util.Logger;
import com.yizhan.util.RightsHelper;
import java.io.PrintStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
  
  public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
     String path = request.getServletPath();
     if (path.matches(".*/((login)|(logout)|(code)|(app)|(main)|(client)|(servlet)|(uploadFiles)|(resource)|(weixin)|(group)|(api)|(static)|(websocket)|(XiaoQufw)|(familyInfo)).*")) {
       return true;
      }
  
     Subject currentUser = SecurityUtils.getSubject();
     Session session = currentUser.getSession();
     User user = (User)session.getAttribute(Const.SESSION_USER);
     if (user != null){
       Boolean b = Boolean.valueOf(true);
       List menuList = (List)session.getAttribute("allmenuList");
       path = path.substring(1, path.length());
       for (int i = 0; i < menuList.size(); ++i){
         for (int j = 0; j < ((Menu)menuList.get(i)).getSubMenu().size(); ++j) {
           if (((Menu)((Menu)menuList.get(i)).getSubMenu().get(j)).getMENU_URL().split(".do")[0].equals(path.split(".do")[0])) {
        	   //if (((Menu)((Menu)menuList.get(i)).getSubMenu().get(j)).isHasMenu()) {
            //菜单地址为空或者#,跳转到登录页面
             if (((Menu)((Menu)menuList.get(i)).getSubMenu().get(j)).getMENU_URL().equals("#")||
             		((Menu)menuList.get(i)).getSubMenu().get(j).getMENU_URL().equals("")) {
            	 	//response.sendRedirect(request.getContextPath() + "/login_toLogin.do");
            	 	return false;
              }
             Map<String,Object> map = ( Map<String,Object>)session.getAttribute("QX");
             map.remove("add");
             map.remove("del");
             map.remove("edit");
             map.remove("cha");
             String MENU_ID = ((Menu)((Menu)menuList.get(i)).getSubMenu().get(j)).getMENU_ID();
             String USERNAME = session.getAttribute("USERNAME").toString();
  
             String ROLE_NAME = (String)map.get("ROLE_NAME");
             System.out.println("---------权限名字---------" + ROLE_NAME);
             	
             String[] cha_rolename = {"系统管理员","普通用户"};
             String[] add_rolename = {"系统管理员","普通用户"};
             String[] edit_rolename = {"系统管理员","普通用户"};
             String[] del_rolename = {"系统管理员","普通用户"};
  
             map.put("cha", ((RightsHelper.testRights((String)map.get("chas"), MENU_ID)) || (ROLE_NAME.equals(cha_rolename[0])) || (ROLE_NAME.equals(cha_rolename[1]))) ? "1" : "0");
             map.put("add", ((RightsHelper.testRights((String)map.get("adds"), MENU_ID)) || (ROLE_NAME.equals(add_rolename[0])) || (ROLE_NAME.equals(add_rolename[1]))) ? "1" : "0");
             map.put("edit", ((RightsHelper.testRights((String)map.get("edits"), MENU_ID)) || (ROLE_NAME.equals(edit_rolename[0])) || (ROLE_NAME.equals(edit_rolename[1]))) ? "1" : "0");
             map.put("del", ((RightsHelper.testRights((String)map.get("dels"), MENU_ID)) || (ROLE_NAME.equals(del_rolename[0]))) || (ROLE_NAME.equals(del_rolename[1])) ? "1" : "0");
             session.removeAttribute("QX");
             session.setAttribute("QX", map);
            }
          }
        }
  
       return true;
      }
  
     //response.sendRedirect(request.getContextPath() + "/login_toLogin.do");
    return false;
    }
  }


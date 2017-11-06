  package com.yizhan.interceptor.shiro;
  
  import java.io.PrintStream;
  import org.apache.shiro.authc.AuthenticationException;
  import org.apache.shiro.authc.AuthenticationInfo;
  import org.apache.shiro.authc.AuthenticationToken;
  import org.apache.shiro.authc.SimpleAuthenticationInfo;
  import org.apache.shiro.authz.AuthorizationInfo;
  import org.apache.shiro.realm.AuthorizingRealm;
  import org.apache.shiro.subject.PrincipalCollection;
  
 public class ShiroRealm extends AuthorizingRealm{
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)throws AuthenticationException{            
    	String username = (String)token.getPrincipal();
    	String password = new String((char[])token.getCredentials());
  
    	if ((username != null) && (password != null)) {
    		return new SimpleAuthenticationInfo(username, password, getName());
    	}
    	return null;
    }
  
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc){
    	System.out.println("========2");
    	return null;
    }
}


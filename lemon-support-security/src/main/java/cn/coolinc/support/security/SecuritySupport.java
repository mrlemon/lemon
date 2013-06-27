package cn.coolinc.support.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Spring Security辅助工具类
 * @author coolinc
 *
 */
public class SecuritySupport {
	/**
	 * 获取当前用户详细信息
	 * @return
	 */
	public  static UserDetails getCurrentUserDetail(){
		 Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		 User userDetail=(User)auth.getPrincipal();
		 return userDetail;
	}
	
	/**
	 * 获取当前用户ID
	 * @return
	 */
	public static String getCurrentUserId(){
		return getCurrentUserDetail().getUsername();
	}
	
	/**
	 * 获取当前用户密码（加密过后的密码）
	 * @return
	 */
	public static String getCurrentUserPassword(){
		return getCurrentUserDetail().getPassword();
	}
	/**
	 * 获取当前用户授权信息
	 * @return
	 */
	public static Collection<? extends GrantedAuthority> getCurrentUserGrantedAuthority(){
		return  getCurrentUserDetail().getAuthorities();
	}
	
	/**
	 * 获取当前角色数组
	 * @return
	 */
	public static String[] getCurrentUserRoles(){
		List<String> roles=null;
		Collection<? extends GrantedAuthority> gas= getCurrentUserDetail().getAuthorities();
		if(gas!=null){
			roles=new ArrayList<String>();
			for(GrantedAuthority ga:gas){
				roles.add(ga.getAuthority());
			}
			if(roles.size()>0){
				return (String[])roles.toArray();
			}
		}
		return null;
	}
	/**
	 * 获取当前用户角色列表
	 * @return
	 */
	public static List<String> getCurrentUserRoleList(){
	    List<String> roles=null;
	    Collection<? extends GrantedAuthority> gas= getCurrentUserDetail().getAuthorities();
	    if(gas!=null){
	        roles=new ArrayList<String>();
	        for(GrantedAuthority ga:gas){
	            roles.add(ga.getAuthority());
	        }
	    }
	    return roles;
	}
	
	/**
	 * 是否包含某个角色
	 * @param role
	 * @return
	 */
	public static boolean hasRole(String role){
	    List<String> currentUserRoleList = getCurrentUserRoleList();
	    if(currentUserRoleList==null)
	        return false;
	    else
	        return currentUserRoleList.contains(role);
	}
	
	/**
	 * MD5加密，不加盐值
	 * @param s
	 * @return
	 */
	 public static String  MD5(String s){
        Md5PasswordEncoder encoder = new Md5PasswordEncoder();
        return encoder.encodePassword(s, null);
	 }
	 
	 /**
	  * MD5加密，可加盐值
	  * @param s
	  * @param salt
	  * @return
	  */
	 public static String  MD5(String s,String salt){
        Md5PasswordEncoder encoder = new Md5PasswordEncoder();
        return encoder.encodePassword(s, salt);
	  }
	
}
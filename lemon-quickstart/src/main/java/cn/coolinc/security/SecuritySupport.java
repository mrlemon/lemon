package cn.coolinc.security;

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
	
	public  static UserDetails getCurrentUserDetail(){
		 Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		 User userDetail=(User)auth.getPrincipal();
		 return userDetail;
	}
	
	public static String getCurrentUserName(){
		return getCurrentUserDetail().getUsername();
	}
	
	public static String getCurrentUserPassword(){
		return getCurrentUserDetail().getPassword();
	}
	
	public static Collection<? extends GrantedAuthority> getCurrentUserGrantedAuthority(){
		return  getCurrentUserDetail().getAuthorities();
	}
	
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
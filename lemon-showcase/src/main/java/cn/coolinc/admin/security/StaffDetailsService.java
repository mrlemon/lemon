package cn.coolinc.admin.security;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import cn.coolinc.entity.RoleStaff;
import cn.coolinc.entity.Staff;
import cn.coolinc.service.RoleStaffService;
import cn.coolinc.service.StaffService;
public class StaffDetailsService implements UserDetailsService {
	public static final String ROLE_ADMINISTATOR_DEFAULT="ROLE_ADMINISTATOR_DEFAULT";
	public StaffService staffService;
	public RoleStaffService roleStaffService;
	private Log logger = LogFactory.getLog(this.getClass());
	
	public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }

    public void setRoleStaffService(RoleStaffService roleStaffService) {
        this.roleStaffService = roleStaffService;
    }

    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        Staff staff=null;
        staff = staffService.findOneByLoginName(username);
        if(staff==null){
            throw new UsernameNotFoundException("Username "+username+" not found");
        }
        String staffId=String.valueOf(staff.getId());
        String password=staff.getPassword();
        boolean enabled=staff.getEnabled()==1?true:false;
        boolean accountNonExpired=true;
        boolean credentialsNonExpired=true;
        boolean accountNonLocked=staff.getLocked()==0?true:false;
        Collection<GrantedAuthority> authorities =getGrantedAuthorityByStaffId(staffId);
        User userDetails=new User(staffId, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        if(logger.isDebugEnabled()){
            logger.debug(userDetails.toString()+" is login.["+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"]");
        }
        return userDetails;
    }
	
	public Collection<GrantedAuthority> getGrantedAuthorityByStaffId(String staffId){
		Collection<GrantedAuthority> gac=new ArrayList<GrantedAuthority>();
			Map<String,Object> params=new HashMap<String, Object>();
			params.put("staffId", staffId);			
			List<RoleStaff> roleStaffList=roleStaffService.findAll(params);
			for(RoleStaff vo:roleStaffList){
				if(logger.isDebugEnabled()){
					logger.debug(">>user,role:"+vo.getRoleCode());
				}
				GrantedAuthority ga=new SimpleGrantedAuthority(vo.getRoleCode());
				gac.add(ga);
			}
			GrantedAuthority ga=new SimpleGrantedAuthority(ROLE_ADMINISTATOR_DEFAULT);
			gac.add(ga);
			return gac;
	}
}

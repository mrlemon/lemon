
package cn.coolinc.admin.security;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.AntPathRequestMatcher;
import org.springframework.security.web.util.RequestMatcher;
import cn.coolinc.entity.RoleRes;
import cn.coolinc.service.RoleResService;

public class AdminFilterInvocationSecurityMetadataSourceImpl implements FilterInvocationSecurityMetadataSource {

    protected final Log logger = LogFactory.getLog(getClass());

    private  Map<RequestMatcher, Collection<ConfigAttribute>> requestMap;
    
    public RoleResService roleResService;
    
	public void setRoleResService(RoleResService roleResService) {
		this.roleResService = roleResService;
	}

	public AdminFilterInvocationSecurityMetadataSourceImpl(){
	}

    public Collection<ConfigAttribute> getAllConfigAttributes() {
    	requestMap=getRequestMap();
        Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();
        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
            allAttributes.addAll(entry.getValue());
        }

        return allAttributes;
    }

    public Collection<ConfigAttribute> getAttributes(Object object) {
    	requestMap=getRequestMap();
        final HttpServletRequest request = ((FilterInvocation) object).getRequest();
        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : this.requestMap.entrySet()) {
		   if (entry.getKey().matches(request)) {
		       return entry.getValue();
		   }
		}
        return null;
    }

    public boolean supports(Class<?> clazz) {
        return FilterInvocation.class.isAssignableFrom(clazz);
    }
    
    public Map<RequestMatcher, Collection<ConfigAttribute>>  getRequestMap() {
		Set<String> resSet=new HashSet<String>();
		Map<RequestMatcher, Collection<ConfigAttribute>> requestMap_temp=new LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>>();
		List<RoleRes> roleResList=roleResService.findAll();
		for(RoleRes vo:roleResList){
		    if(StringUtils.isNotEmpty(vo.getResCode())){
		        resSet.add(vo.getResCode());
		    }
		}
		for(String res:resSet){
			Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
			if(null!=res){
				for(RoleRes vo:roleResList){
					if(res.equals(vo.getResCode())){
					    if(StringUtils.isNotEmpty(vo.getRoleCode())){
    						ConfigAttribute ca=new SecurityConfig(vo.getRoleCode());
    						atts.add(ca);
					    }
					}
				}
				requestMap_temp.put(new AntPathRequestMatcher(res),atts);
			}
		}
		return requestMap_temp;
    }
}

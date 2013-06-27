package cn.coolinc.admin.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import cn.coolinc.entity.StaffLogin;
import cn.coolinc.service.StaffLoginService;
import cn.coolinc.service.StaffService;
import cn.coolinc.support.security.SecuritySupport;
import cn.coolinc.support.web.ControllerUtils;
public class AdminAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	StaffLoginService staffLoginService;
	StaffService staffService;
    public void setStaffLoginService(StaffLoginService staffLoginService) {
        this.staffLoginService = staffLoginService;
    }

    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }

    @Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
			super.onAuthenticationSuccess(request, response, authentication);
			String staffId=SecuritySupport.getCurrentUserId();
			String ip=ControllerUtils.getRequestIP(request);
			StaffLogin vo=new StaffLogin();
			vo.setLoginIp(ip);
			vo.setStaffId(Integer.valueOf(staffId));
			staffLoginService.save(vo);
	}
}

package com.cm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cm.modules.user.model.SystemUser;
import com.oscloud.core.CommonConstant;

/**
 * 验证后台用户登陆的拦截器
 * 
 * @author hiyung
 * @2017年2月21日
 */
public class LoginInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String url = request.getRequestURL().toString();
		// System.out.println("url is "+url);
		if (url.indexOf("operateFile/uploadFile") > -1 || url.indexOf("login/login") > -1) {
			return true;
		}
		if (url.lastIndexOf("/systemUser/login.action") > 0) {
			return true;
		}

		if (url.lastIndexOf("/upload/") > 0) {
			return true;
		}
		if (url.lastIndexOf("/baseUpload/") > 0) {
			return true;
		}
		SystemUser user = (SystemUser) session.getAttribute(CommonConstant.LONGINKEY);
		if (user == null) {
			// String returnUrl = ;
			// System.out.println("returnUrl is "+returnUrl);
			String returnUrl = request.getServletContext().getContextPath() + "/login.jsp";
			response.sendRedirect(returnUrl.trim());
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}

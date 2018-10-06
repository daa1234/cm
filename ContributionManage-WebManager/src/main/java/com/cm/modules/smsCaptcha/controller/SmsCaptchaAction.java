package com.cm.modules.smsCaptcha.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cm.core.BaseWebController;
import com.oscloud.error.ErrorJson;
import com.oscloud.util.SMSWebServiceUtil;

/**
 * 后台系统用户控制器
 * 
 * @author hiyung
 * @2017年3月25日
 */
@Controller
@RequestMapping("/capt")
public class SmsCaptchaAction extends BaseWebController {
	
	/**
	 * 
	 * pc端页面调用 根据订单号发送短信 <br/>
	 * 
	 * @author gbquan
	 * @return
	 * @since JDK 1.6
	 */
	@RequestMapping("sendMessage")
	public void sendMessage(HttpServletRequest httpServletRequest) {
		try {
			String content = httpServletRequest.getParameter("content");
			if (StringUtils.isEmpty(content)) {
				outWriteJson(new ErrorJson(2, "短信内容不能为空"));
			}
			String mobile = httpServletRequest.getParameter("mobile");
			if (StringUtils.isEmpty(mobile)) {
				outWriteJson(new ErrorJson(2, "系统异常"));
			}
			SMSWebServiceUtil.send(content, new String[] { mobile });
			outWriteJson(new ErrorJson(0, "发送成功"));
		} catch (Exception e) {
			outWriteJson(new ErrorJson(2, "系统异常"));
		}
	}

}

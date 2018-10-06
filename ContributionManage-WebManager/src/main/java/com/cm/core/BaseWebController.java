package com.cm.core;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.cm.modules.privilege.model.Resources;
import com.cm.modules.user.model.SystemUser;
import com.google.common.base.Objects;
import com.oscloud.controller.CommonController;
import com.oscloud.core.CommonConstant;

public class BaseWebController extends CommonController{
	/**
	 * 页面分页参数
	 * @return
	 */
	protected int getIDisplayStart() {
		String keyword = request.getParameter("iDisplayStart");
		try {
			return Integer.parseInt(keyword);
		} catch (Exception e) {
		}
		return 0;
	}
	/**
	 * 页面分页参数
	 * @return
	 */
	protected Integer getIDisplayLength() {
		String keyword = request.getParameter("iDisplayLength");
		try {
			return Integer.parseInt(keyword);
		} catch (Exception e) {
		}
		return 10;
	}
	/**
	 * 计算分页
	 * @return
	 */
	protected int getPage() {
		return  (int) Math.ceil(getIDisplayStart()/ getIDisplayLength());
	}
	/**
	 * 获取搜索关键字
	 * @return
	 */
	protected String searchKey() {
		return request.getParameter("sSearch");
	}
	
	public String getSEcho() {
		String sEcho = request.getParameter("sEcho");
		return StringUtils.defaultString(sEcho,"");
	}
	
	protected void setMenus(List<Resources> menus) {
		session.setAttribute("ownResourceList", menus);
	}
	
	/**
	 * 获取后台登陆用户
	 * @return
	 */
	protected SystemUser getLoginer(){
		Object o = session.getAttribute(CommonConstant.LONGINKEY);
		if(o!=null){
			return (SystemUser) o;
		}else{
			return null;
		}
	}
	/**
	 * 设置后台登陆用户
	 * @return
	 */
	protected void setLoginer(SystemUser user){
		 session.setAttribute(CommonConstant.LONGINKEY, user);
	}
	
	/**
	 * //加入支持测试数据   忽略删除标志
	 * isEnviromentTest:(). <br/>  
	 *  
	 * @author gbquan 
	 * @return  
	 * @since JDK 1.7
	 */
	public boolean isEnviromentTest(){
		String etc = request.getParameter("enviroment");
		if(StringUtils.isNotBlank(etc)&&Objects.equal(etc, "test")){
			return true;
		}
		return false;
	}
	

	
}

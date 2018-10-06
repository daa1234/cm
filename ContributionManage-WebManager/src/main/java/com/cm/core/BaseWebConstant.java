/**  
 * Project Name:91baby  
 * File Name:Constant.java  
 * Package Name:com.baby91.framework.core.base  
 * Date:2015年5月15日下午2:58:08  
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.  
 *  
 */

package com.cm.core;

/**
 * 系统常量
 * 
 * @author hiyung
 * @2017年2月14日
 */
public class BaseWebConstant {

	public final static String ALLOWTYPES_IMG = ".png";
	public final static String ALLOWTYPES = ".jpg|.gif|.png|.bmp|.swf|.rar|.zip|.doc|.docx|.xls|.xlsx|.ppt|.pptx|.txt|.iso|.ipa|.apk";

	/**
	 * 后台系统用户登陆的session
	 */
	// public final static String LONGINKEY = "LONGINKEY";
	/**
	 * 用户(系统用户，APP用户，专家用户)被删除是的状态
	 */
	public final static int deleteFlag = -1;
	/**
	 * 用户账号是开启状态
	 */
	public final static int accountOpen = 1;
	/**
	 * 用户账号是冻结状态
	 */
	public final static int accountClosed = 0;

}

package com.cm.modules.user.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;

import com.cm.common.model.BaseModel;
import com.google.gson.annotations.Expose;
import com.oscloud.util.CommonPropertiesUtil;

/**
 * 该对象表示一个人(医生、患者、后台用户都属于人的角色范畴)
 */
@MappedSuperclass
public class Person extends BaseModel {

	private static final long serialVersionUID = 8432529182064142582L;

	/**
	 * 呢称
	 */
	private String nickName = "";

	/**
	 * 真是姓名
	 */
	private String realName = "";

	private String pinyinRealName = "";

	/**
	 * 性别 (1:男 ,2: 女)
	 */
	private String gender = "";

	/**
	 * 年龄
	 */
	private int age;

	/**
	 * 手机号码
	 */
	private String mobile = "";

	/**
	 * email
	 */
	private String email = "";

	/**
	 * 删除标志
	 */
	private Integer deleteFlag = 0;
	/**
	 * 帐号状态
	 */
	private Integer status = 1;

	/**
	 * 身份证号
	 */
	private String identityNo = "";

	/**
	 * 登录名
	 */

	private String loginName;

	/**
	 * 登录密码
	 */
	@Expose(serialize = false)
	private String password;

	/**
	 * 头像图片
	 */
	private String imgUrl = "";
	private String imgUrlPath = "";

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Column(length = 20)
	public String getIdentityNo() {
		return identityNo;
	}

	public void setIdentityNo(String identityNo) {
		this.identityNo = identityNo;
	}

	@Column(length = 40)
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Column(length = 40)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(length = 40)
	public String getPinyinRealName() {
		return pinyinRealName;
	}

	public void setPinyinRealName(String pinyinRealName) {
		this.pinyinRealName = pinyinRealName;
	}

	@Column(length = 13)
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(length = 40)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(length = 4)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(length = 40)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
		setImgUrlPath();
	}

	@Transient
	public String getImgUrlPath() {
		return imgUrlPath;
	}

	public void setImgUrlPath() {
		if (StringUtils.isEmpty(this.imgUrl)) {
			this.imgUrlPath = "";
		} else {
			this.imgUrlPath = CommonPropertiesUtil.getKey(CommonPropertiesUtil.CM_URI_PATH) + this.imgUrl;
		}
	}

	@Column(columnDefinition = "text")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

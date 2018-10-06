package com.cm.modules.user.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

/**
 * 后台系统用户
 * 
 * @author hiyung
 * @2017年3月25日
 */

@Entity
@Table(name = "systemUser", catalog = "", schema = "")
public class SystemUser extends Person {

	private static final long serialVersionUID = 579724412829504713L;
	private Integer id;
	/**
	 * 当前系统用户的角色id（权限分配的角色id）,根据角色id获取相应的菜单权限
	 */
	private Integer systemRoleId;
	/**
	 * 是否是管理原 1、是普通角色 999、是超级管理员
	 */
	private Integer roleType = 1;
	/* 关联的id，备用字段 */
	private String relevanceId;
	/* 可编辑状态 */
	private boolean editEnable = true;

	// 时区代码（教师角色使用字段）
	private Integer timeZoneCode;

	// 时区名称（教师角色使用字段）
	private String timeZoneName;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSystemRoleId() {
		return systemRoleId;
	}

	public void setSystemRoleId(Integer systemRoleId) {
		this.systemRoleId = systemRoleId;
	}

	public Integer getRoleType() {
		return roleType;
	}

	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}

	public String getRelevanceId() {
		return this.relevanceId;
	}

	public void setRelevanceId(String relevanceId) {
		this.relevanceId = relevanceId;
	}

	public boolean isEditEnable() {
		return this.editEnable;
	}

	public void setEditEnable(boolean editEnable) {
		this.editEnable = editEnable;
	}

	public Integer getTimeZoneCode() {
		return timeZoneCode;
	}

	public void setTimeZoneCode(Integer timeZoneCode) {
		this.timeZoneCode = timeZoneCode;
	}

	@Formula("(select t.name from timezone t where t.code = timeZoneCode)")
	public String getTimeZoneName() {
		return timeZoneName;
	}

	public void setTimeZoneName(String timeZoneName) {
		this.timeZoneName = timeZoneName;
	}

}

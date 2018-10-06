/**  
 * Project Name:framework  
 * File Name:Partner.java  
 * Package Name:com.baby91.framework.application.modeles.partner.model  
 * Date:2015年5月12日上午10:38:09  
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.  
 *  
 */

package com.cm.modules.privilege.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cm.common.model.BaseModel;

/**
 * ClassName:Partner <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2015年5月12日 上午10:38:09 <br/>
 * 角色
 * 
 * @author gbquan
 * @version
 * @since JDK 1.6
 * @see
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "role", catalog = "", schema = "")
public class Role extends BaseModel {
	private Integer id;

	private String name; // 名称

	private String remark; // 描述信息

	/**
	 * 是否能删除
	 */
	private Integer isDelete = 0;
	/**
	 * 系统暂时默认只产生 2个 值 default(普通角色) 或 admin (超级管理员)
	 */
	private String code;

	/**
	 * 状态
	 */
	private Integer status; // 状态 1.正常 2.冻结 3.删除 4.异常

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}

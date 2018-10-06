/**  
 * Project Name:91baby  
 * File Name:RoleUserRe.java  
 * Package Name:com.baby91.framework.application.modeles.privilege.model  
 * Date:2015年7月1日上午10:08:23  
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.  
 *  
 */

package com.cm.modules.privilege.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ClassName:RoleUserRe <br/>
 * Date: 2015年7月1日 上午10:08:23 <br/>
 * 角色 与 资源关系表
 * 
 * @author gbquan
 * @version
 * @since JDK 1.6
 * @see
 */

@Entity
@Table(name = "role_resource_re", catalog = "", schema = "")
public class RoleResourceRe {
	private Integer id;
	private Integer roleId;

	private Integer resourceId;

	private Integer status = 1; // 状态 1.正常 2.冻结 3.删除 4.异常

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

}

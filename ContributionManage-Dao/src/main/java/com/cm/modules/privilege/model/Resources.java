/**  
 * Project Name:91baby  
 * File Name:Resource.java  
 * Package Name:com.baby91.framework.application.modeles.privilege.model  
 * Date:2015年7月1日上午9:31:39  
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.  
 *  
 */

package com.cm.modules.privilege.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Formula;

import com.google.common.collect.Lists;

/**
 * 菜单资源管理
 * 
 * @author hiyung
 * @2017年3月27日
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "resources", catalog = "", schema = "")
public class Resources {
	private Integer id;

	private String name;
	/**
	 * menu：菜单
	 */
	private String molde; // 类型
	/**
	 * 上一级菜单
	 */
	private Integer pid;
	private String uri = ""; // 路径

	private String remark; // 描述信息

	private Integer status; // 状态 1.正常 2.冻结 3.删除

	private String presourceName;

	/**
	 * 序号
	 */
	private Integer sequence;

	private List<Resources> children = Lists.newArrayList();

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMolde() {
		return molde;
	}

	public void setMolde(String molde) {
		this.molde = molde;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public String getName() {

		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Formula("(SELECT name FROM resources r WHERE ISNULL(r.pid) AND r.id=pid )")
	public String getPresourceName() {
		if (StringUtils.isBlank(presourceName)) {
			presourceName = "一级菜单";
		}
		return presourceName;
	}

	public void setPresourceName(String presourceName) {
		this.presourceName = presourceName;
	}

	@Transient
	public List<Resources> getChildren() {
		return children;
	}

	public void setChildren(List<Resources> children) {
		this.children = children;
	}

}

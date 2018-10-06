package com.cm.modules.privilege.dao.impl;

import org.springframework.stereotype.Repository;

import com.cm.modules.privilege.dao.RoleDao;
import com.cm.modules.privilege.model.Role;
import com.oscloud.dao.BaseDAO;

/**
 * @author gbquan
 */
@Repository
public class RoleDaoImpl extends BaseDAO<Role, Integer> implements RoleDao {
	
}
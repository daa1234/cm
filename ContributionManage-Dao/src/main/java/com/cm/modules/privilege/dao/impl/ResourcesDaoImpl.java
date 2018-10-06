package com.cm.modules.privilege.dao.impl;

import org.springframework.stereotype.Repository;

import com.cm.modules.privilege.dao.ResourcesDao;
import com.cm.modules.privilege.model.Resources;
import com.oscloud.dao.BaseDAO;

/**
 * @author gbquan
 */
@Repository
public class ResourcesDaoImpl extends BaseDAO<Resources, Integer> implements ResourcesDao {
	
}
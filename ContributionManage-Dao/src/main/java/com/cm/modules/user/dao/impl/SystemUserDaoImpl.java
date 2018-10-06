package com.cm.modules.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.cm.modules.user.dao.SystemUserDao;
import com.cm.modules.user.model.SystemUser;
import com.oscloud.dao.BaseDAO;
@Repository
public class SystemUserDaoImpl extends BaseDAO<SystemUser, Integer> implements SystemUserDao{

}

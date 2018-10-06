package com.cm.modules.privilege.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cm.core.BaseWebService;
import com.cm.modules.privilege.dao.ResourcesDao;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MenuService extends BaseWebService{

	@Resource
	private ResourcesDao resourceDao;
	
	
}

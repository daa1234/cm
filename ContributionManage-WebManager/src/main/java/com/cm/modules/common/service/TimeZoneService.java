package com.cm.modules.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cm.modules.common.dao.TimeZoneDao;
import com.cm.modules.common.model.TimeZone;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class TimeZoneService {

	@Resource
	private TimeZoneDao dao;

	public List<TimeZone> list() {
		return dao.findAll();
	}
}

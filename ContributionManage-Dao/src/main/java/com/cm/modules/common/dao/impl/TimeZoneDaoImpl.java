package com.cm.modules.common.dao.impl;

import org.springframework.stereotype.Repository;

import com.cm.modules.common.dao.TimeZoneDao;
import com.cm.modules.common.model.TimeZone;
import com.oscloud.dao.BaseDAO;

@Repository
public class TimeZoneDaoImpl extends BaseDAO<TimeZone, Integer> implements TimeZoneDao {

}

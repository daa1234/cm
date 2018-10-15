package com.cm.modules.systemUser.service;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cm.core.BaseWebService;
import com.cm.modules.user.dao.SystemUserDao;
import com.cm.modules.user.model.SystemUser;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.util.Role;

/**
 * 系统用户的Service
 * 
 * @author hiyung
 * @2017年3月25日
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class TeacherService extends BaseWebService {

	@Resource
	private SystemUserDao dao;

	public DataTableReturnObject<SystemUser> list(String searchKey) {
		Search search = new Search();
		search.addFilterEqual("deleteFlag", 0);
		search.addFilterEqual("systemRoleId", Role.TEACHER_ROLE);
		String keyword = searchKey();
		search.addSort("status", true);
		search.addSort("createDate", true);
		if (StringUtils.isNotBlank(keyword)) {
			search.addFilterOr(new Filter("realName", "%" + keyword + "%", Filter.OP_LIKE),
					new Filter("loginName", "%" + keyword + "%", Filter.OP_LIKE));
		}
		search.setMaxResults(getIDisplayLength());
		search.setPage(getPage());

		SearchResult<SystemUser> result = dao.searchAndCount(search);
		// 为操作次数加1
		return new DataTableReturnObject<SystemUser>(result.getTotalCount(), result.getTotalCount(), "",
				result.getResult());
	}

}

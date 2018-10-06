package com.cm.modules.systemUser.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.cm.core.BaseWebService;
import com.cm.modules.user.dao.SystemUserDao;
import com.cm.modules.user.model.SystemUser;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;
import com.oscloud.error.ErrorException;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.util.HexUtil;

/**
 * 系统用户的Service
 * 
 * @author hiyung
 * @2017年3月25日
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SystemUserService extends BaseWebService {

	@Resource
	private SystemUserDao dao;

	public boolean createOrUpdate(SystemUser object, Model model) {
		Search search = new Search();
		search.addFilterEqual("loginName", object.getLoginName());
		List<SystemUser> users = dao.search(search);
		SystemUser systemUser = null;
		if (users.size() != 0) {
			systemUser = users.get(0);
			// 新增用户时，登录名有冲突
			if (object.getId() == null) {
				if (model != null) {
					model.addAttribute("error", new ErrorException(1, "不能重复注册。"));
				}
				return false;
			}
			// 编辑用户时，用户的loginName有冲突
			if (systemUser.getId() != object.getId()) {
				if (model != null) {
					model.addAttribute("error", new ErrorException(1, "不能重复注册。"));
				}
				return false;
			}
		}
		if (StringUtils.isBlank(object.getPassword())) {
			if (object.getId() != null) {
				systemUser = find(object.getId());
			}
		}
		systemUser = setObject(object, systemUser);
		dao.save(systemUser);
		dao.flush();
		return true;
	}

	public SystemUser find(Integer id) {
		return dao.find(id);
	}

	public DataTableReturnObject<SystemUser> list(String searchKey) {
		Search search = new Search();
		search.addFilterEqual("deleteFlag", 0);
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

	public SystemUser queryByLoginName(String loginName) {
		Search search = new Search();
		search.addFilterEqual("loginName", loginName);
		return dao.searchUnique(search);
	}

	private SystemUser setObject(SystemUser object, SystemUser dbData) {
		try {
			if (dbData == null) {
				dbData = object;
				if (StringUtils.isNoneBlank(object.getPassword())) {
					dbData.setPassword(HexUtil.getEncryptedPwd(object.getPassword()));
				}
				object.setCreateDate(new Date());
				object.setCreateUserId(getLoginer().getId());
			} else {
				dbData.setAge(object.getAge());
				dbData.setCreateDate(new Date());
				dbData.setDeleteFlag(object.getDeleteFlag());
				dbData.setEmail(object.getEmail());
				dbData.setGender(object.getGender());
				dbData.setIdentityNo(object.getIdentityNo());
				dbData.setImgUrl(object.getImgUrl());
				dbData.setLoginName(object.getLoginName());
				dbData.setMobile(object.getMobile());
				dbData.setNickName(object.getNickName());
				if (StringUtils.isNoneBlank(object.getPassword())) {
					dbData.setPassword(HexUtil.getEncryptedPwd(object.getPassword()));
				}
				dbData.setPinyinRealName(object.getPinyinRealName());
				dbData.setRealName(object.getRealName());
				if (dbData.getRoleType() == null) {
					dbData.setRoleType(object.getRoleType());
				}
				dbData.setStatus(object.getStatus());
				dbData.setSystemRoleId(object.getSystemRoleId());
				dbData.setUpdateDate(new Date());
				dbData.setUpdateUserId(getLoginer().getId());
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbData;
	}

	public boolean checkUnique(String loginName, String mobile) {
		boolean checkResult = true;
		Search search = new Search();
		if (StringUtils.isNoneBlank(loginName)) {
			search.addFilterEqual("loginName", loginName);
		}
		if (StringUtils.isNoneBlank(mobile)) {
			search.addFilterEqual("mobile", mobile);
		}
		search.addFilterEqual("deleteFlag", 0);
		SystemUser object = dao.searchUnique(search);
		if (object != null) {
			checkResult = false;
		}
		return checkResult;
	}

}

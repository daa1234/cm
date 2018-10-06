package com.cm.modules.privilege.service;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.cm.common.model.SystemUserRoleType;
import com.cm.core.BaseWebService;
import com.cm.modules.privilege.dao.ResourcesDao;
import com.cm.modules.privilege.dao.RoleResourceReDao;
import com.cm.modules.privilege.model.Resources;
import com.cm.modules.privilege.model.RoleResourceRe;
import com.cm.modules.user.model.SystemUser;
import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;
import com.googlecode.genericdao.search.Sort;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ResourceService extends BaseWebService {
	@Resource
	private ResourcesDao resourcesDao;
	@Resource
	private RoleResourceReDao roleResourceReDao;

	public List<Resources> loadResource(SystemUser loginUser) {

		List<Resources> ownResourceList = null;
		// 加载权限
		// 不是超管才加载
		Search rSearch = new Search();
		// 资源集合
		List<Resources> r_list = null;
		// 普通用户角色
		if (Objects.equal(loginUser.getRoleType(), SystemUserRoleType.adminUser)) {
			rSearch = new Search();
			rSearch.addFilterEqual("molde", "menu");
			rSearch.addSorts(Sort.asc("pid"), Sort.asc("sequence"));
			r_list = resourcesDao.search(rSearch);
		} else {
			rSearch.addFilterEqual("roleId", loginUser.getSystemRoleId());
			List<RoleResourceRe> rrrList = roleResourceReDao.search(rSearch);
			List<Integer> resourceIdList = Lists.newArrayList();
			for (RoleResourceRe rrr : rrrList) {
				resourceIdList.add(rrr.getResourceId());
			}
			if (!CollectionUtils.isEmpty(resourceIdList)) {
				rSearch = new Search();
				rSearch.addFilterIn("id", resourceIdList);
				rSearch.addFilterEqual("molde", "menu");
				rSearch.addSorts(Sort.asc("pid"), Sort.asc("sequence"));
				r_list = resourcesDao.search(rSearch);

			}
		}
		// if
		// (Objects.equal(loginUser.getRoleType(),SystemUserRoleType.normalUser))
		// {
		// rSearch.addFilterEqual("roleId", loginUser.getSystemRoleId());
		// List<RoleResourceRe> rrrList = roleResourceReDao.search(rSearch);
		// List<Integer> resourceIdList = Lists.newArrayList();
		// for (RoleResourceRe rrr : rrrList) {
		// resourceIdList.add(rrr.getResourceId());
		// }
		// if (!CollectionUtils.isEmpty(resourceIdList)) {
		// rSearch = new Search();
		// rSearch.addFilterIn("id", resourceIdList);
		// rSearch.addFilterEqual("molde", "menu");
		// rSearch.addSorts(Sort.asc("pid"), Sort.asc("sequence"));
		// r_list = resourcesDao.search(rSearch);
		//
		// }
		// } else {
		// rSearch = new Search();
		// rSearch.addFilterEqual("molde", "menu");
		// rSearch.addSorts(Sort.asc("pid"), Sort.asc("sequence"));
		// r_list = resourcesDao.search(rSearch);
		// }
		if (!CollectionUtils.isEmpty(r_list)) {
			List<Resources> oneMenuList = Lists.newArrayList();
			// 找出一级菜单
			for (Resources r : r_list) {
				if (r.getPid() == null) {
					oneMenuList.add(r);
				}
			}
			Deque<Resources> dqueue = new ArrayDeque<Resources>();
			dqueue.addAll(oneMenuList);
			Resources current = null;
			while (!dqueue.isEmpty()) {
				current = dqueue.poll();
				for (Resources r : r_list) {
					if (r.getPid() != null && r.getPid() == current.getId()) {
						current.getChildren().add(r);
						dqueue.add(r);
					}
				}
			}
			ownResourceList = oneMenuList;
		} else {
			ownResourceList = Lists.newArrayList();

		}
		return ownResourceList;
	}

	public SearchResult<Resources> list(String searchKey) {
		Search search = new Search();
		String keyword = searchKey();
		if (StringUtils.isNotBlank(keyword)) {
			search.addFilterLike("name", "%" + keyword + "%");
		}
		search.setMaxResults(getIDisplayLength());
		int page = (int) Math.ceil(getIDisplayStart() / getIDisplayLength());
		search.setPage(page);
		search.addSorts(Sort.asc("pid"), Sort.asc("sequence"));
		return resourcesDao.searchAndCount(search);
	}

	public boolean createOrUpdate(Resources object) {
		try {
			resourcesDao.save(object);
			resourcesDao.flush();
		} catch (Exception e) {
			logger.error("创建或者保存菜单失败", e);
			return false;
		}
		return true;
	}

	public boolean delete(Integer id) {
		try {
			resourcesDao.removeById(id);
			resourcesDao.flush();
		} catch (Exception e) {
			logger.error(this.getClass() + e.toString());
			return false;
		}
		return true;
	}

	public SearchResult<Resources> listParent() {
		Search search = new Search();
		search.setMaxResults(100);
		search.addFilterNull("pid");
		return resourcesDao.searchAndCount(search);
	}

	public Resources find(Integer id) {
		return resourcesDao.find(id);
	}

}

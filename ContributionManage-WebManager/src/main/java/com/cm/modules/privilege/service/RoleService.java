package com.cm.modules.privilege.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cm.core.BaseWebService;
import com.cm.modules.privilege.dao.ResourcesDao;
import com.cm.modules.privilege.dao.RoleDao;
import com.cm.modules.privilege.dao.RoleResourceReDao;
import com.cm.modules.privilege.model.Resources;
import com.cm.modules.privilege.model.Role;
import com.cm.modules.privilege.model.RoleResourceRe;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RoleService extends BaseWebService {
	@Resource
	private RoleDao roleDao;
	
	@Resource
	private ResourcesDao resourcesDao;
	

	@Resource
	private RoleResourceReDao roleResourceReDao;
	
	@Resource
	private AuthService authService;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Role> roleList() {
		Search search = new Search();
		return roleDao.search(search);
	}

	public SearchResult<Role> list(String keyword) {
		Search search = new Search();
		if (StringUtils.isNotBlank(keyword)) {
			search.addFilterLike("name", "%" + keyword + "%");
		}
		search.setMaxResults(getIDisplayLength());
		int page = (int) Math.ceil(getIDisplayStart() / getIDisplayLength());
		search.setPage(page);

		return roleDao.searchAndCount(search);
	}

	public boolean createOrUpdate(Role object) {
		try {
			roleDao.save(object);
			roleDao.flush();
		} catch (Exception e) {
			logger.error("保存或者创建角色错误", e);
		}
		return true;
	}

	public boolean delete(Integer id) {
		try {
			roleDao.removeById(id);
			roleDao.flush();
		} catch (Exception e) {
			logger.error(this.getClass() + e.toString());
			return false;
		}
		return true;
	}

	public Role find(Integer id) {
		// TODO Auto-generated method stub
		return roleDao.find(id);
	}

	public List<Map<String, Object>> treeResource(Integer id) {
		// 查出当前角色授权的拥有的资源
		Search search = new Search();
		search.addFilterEqual("roleId", id);
		search.setMaxResults(1000);
		List<RoleResourceRe> rrrList = roleResourceReDao.search(search);
		List<Integer> ownResourceIs = Lists.newArrayList();
		for (RoleResourceRe rrr : rrrList) {
			ownResourceIs.add(rrr.getResourceId());
		}
		search = new Search();
		search.setMaxResults(1000);
		List<Resources> result = resourcesDao.search(search);
		List<Map<String, Object>> treeList = new ArrayList<>();
		for (Resources re : result) {

			Map<String, Object> temp = Maps.newHashMap();
			temp.put("id", re.getId());
			if (re.getPid() == null) {
				temp.put("pId", re.getId());
			} else {
				temp.put("pId", re.getPid());
			}
			temp.put("name", re.getName());
			temp.put("open", true);
			if (ownResourceIs.contains(re.getId())) {
				temp.put("checked", true);
			}
			treeList.add(temp);
		}
		
		return treeList;
	}

	public boolean auth(Integer id,String resourcesIds) {
		try {
			List<Integer> resourcesId_list = Lists.newArrayList(); 
			if(!StringUtils.isEmpty(resourcesIds)){
				//转成整型
				String[] arry = resourcesIds.split(",");
				for(String s: arry){
					resourcesId_list.add(Integer.parseInt(s));
				}
			}
			authService.auth(resourcesId_list, id);
			authService.flush();
		} catch (Exception e) {
			logger.error("授权是吧",e);
			return false;
		}
		return true;
	}

}

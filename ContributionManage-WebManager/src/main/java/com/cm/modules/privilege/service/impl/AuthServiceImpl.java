package com.cm.modules.privilege.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cm.modules.privilege.dao.RoleResourceReDao;
import com.cm.modules.privilege.model.RoleResourceRe;
import com.cm.modules.privilege.service.AuthService;
import com.googlecode.genericdao.search.Search;

/**
 * 
 * ClassName: InformationServiceImpl <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2015年5月13日 上午11:40:07 <br/>  
 *  实现授权服务接口类
 * @author gbquan 
 * @version   
 * @since JDK 1.6
 */
@Service
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class AuthServiceImpl implements AuthService {
	@Resource
	private RoleResourceReDao roleResourceReDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean auth(List<Integer> resourceIds,Integer roleId){
		//清空上一次的记录
		Search search = new Search();
		search.addFilterEqual("roleId", roleId);
		List<RoleResourceRe> last_list = roleResourceReDao.search(search);
		for(RoleResourceRe rrr:last_list){
			roleResourceReDao.remove(rrr);
		}
		for(Integer rId:resourceIds){
			RoleResourceRe rse = new RoleResourceRe(); 
			rse.setRoleId(roleId);
			rse.setResourceId(rId);
			roleResourceReDao.save(rse);
		}
		return true;
	}

	
	@Override
	public void flush() {
		roleResourceReDao.flush();
	}
}

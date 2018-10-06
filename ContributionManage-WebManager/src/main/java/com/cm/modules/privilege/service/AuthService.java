package com.cm.modules.privilege.service;

import java.util.List;

/**
 * 
 * ClassName: InformationService <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2015年5月13日 上午11:41:34 <br/>  
 *  授权服务接口
 * @author gbquan 
 * @version   
 * @since JDK 1.6
 */
public interface AuthService {
	
	/**
	 * 全量更新
	 * @param information
	 * @return
	 */
	public boolean auth(List<Integer> resourceIds,Integer roleId);
	public void flush() ;
	
}

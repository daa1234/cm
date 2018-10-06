package com.cm.modules.privilege.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.cm.core.BaseWebController;
import com.cm.modules.privilege.model.Role;
import com.cm.modules.privilege.service.RoleService;
import com.google.common.collect.Lists;
import com.google.gson.Gson;
import com.googlecode.genericdao.search.SearchResult;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.json.ReturnJson;

/**
 * 后台系统角色管理，用户的权限是根据角色来分配的
 * 
 * @author hiyung
 * @2017年3月28日
 */
@RequestMapping("/role")
@Controller
public class RoleAction extends BaseWebController {
	@Resource
	private RoleService service;

	/**
	 * 
	 * list:(角色列表后台调用). <br/>
	 * 
	 * @author gbquan
	 * @return
	 * @since JDK 1.6
	 */

	@RequestMapping(value = "searchRoleAction")
	public void list() {

		SearchResult<Role> result = service.list(searchKey());
		// 为操作次数加1
		DataTableReturnObject<Role> list = new DataTableReturnObject<Role>(result.getTotalCount(),
				result.getTotalCount(), "", result.getResult());
		outWriteJson(list);
	}

	@RequestMapping(value = "saveAction")
	public ModelAndView save(Role object) {
		object.setCreateDate(new Date());
		object.setCreateUserId(getLoginer().getId());
		service.createOrUpdate(object);
		ModelAndView view = new ModelAndView("redirect:/model/privilege/role/role_list.jsp");
		return view;
	}

	@RequestMapping(value = "delete")
	public void delete(Integer id) {
		if (id == null) {
			outWriteJson(new ReturnJson(2, "删除失败。"));
		} else {
			boolean flag = service.delete(id);
			if (flag) {
				outWriteJson(new ReturnJson(0, "删除成功。"));
			} else {
				outWriteJson(new ReturnJson(2, "存在关联，无法删除。"));
			}
		}
	}

	@RequestMapping(value = "editPage")
	public ModelAndView editPage(Integer id, Model model) {
		ModelAndView view = new ModelAndView("/model/privilege/role/edit.jsp");
		model.addAttribute("object", service.find(id));
		return view;
	}

	@RequestMapping(value = "editAction")
	public ModelAndView editAction(Role object) {
		ModelAndView view = new ModelAndView("redirect:/model/privilege/role/role_list.jsp");
		object.setUpdateDate(new Date());
		object.setUpdateUserId(getLoginer().getId());
		service.createOrUpdate(object);
		return view;
	}

	@RequestMapping(value = "showPage")
	public ModelAndView showPage(Integer id, Model model) {
		ModelAndView view = new ModelAndView("/model/privilege/role/show.jsp");
		model.addAttribute("object", service.find(id));
		return view;
	}

	@RequestMapping(value = "addResourcePage")
	public ModelAndView addResourcePage(Integer id, Model model) {
		ModelAndView view = new ModelAndView("/model/privilege/role/addResource.jsp");
		Role object = service.find(id);
		List<Map<String, Object>> treeList = Lists.newArrayList();
		treeList = service.treeResource(id);
		Gson gson = new Gson();
		// model.addAttribute("treeListJson", gson.toJson(treeList));
		model.addAttribute("treeListJson", JSON.toJSON(treeList));
		model.addAttribute("object", object);
		return view;
	}

	/**
	 * 授权接口 auth:(). <br/>
	 * 
	 * @author gbquan
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "auth")
	public void auth(Integer id, String resourcesIds) {
		if (id == null) {
			outWriteJson(new ReturnJson(1, "授权失败"));
			return;
		}
		boolean flag = service.auth(id, resourcesIds);
		if (flag) {
			outWriteJson(new ReturnJson(0, "授权成功"));
		} else {
			outWriteJson(new ReturnJson(0, "授权失败"));
		}
	}
}

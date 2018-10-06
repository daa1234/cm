package com.cm.modules.privilege.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cm.core.BaseWebController;
import com.cm.modules.privilege.model.Resources;
import com.cm.modules.privilege.service.ResourceService;
import com.googlecode.genericdao.search.SearchResult;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.json.ReturnJson;

/**
 * 菜单管理
 * 
 * @author hiyung
 * @2017年3月27日
 */
@RequestMapping("/menu")
@Controller
public class MenuAction extends BaseWebController {

	@Resource
	private ResourceService resourceService;

	/**
	 * list:(菜单列表后台调用). <br/>
	 * 
	 * @author gbquan
	 * @return
	 * @since JDK 1.6
	 */
	@RequestMapping(value = "searchResourcesAction")
	public void list() {
		SearchResult<Resources> result = resourceService.list(searchKey());
		// 为操作次数加1
		DataTableReturnObject<Resources> list = new DataTableReturnObject<Resources>(result.getTotalCount(),
				result.getTotalCount(), getSEcho(), result.getResult());
		outWriteJson(list);
	}

	@RequestMapping(value = "saveAction")
	public ModelAndView save(Resources object) {
		ModelAndView view = new ModelAndView("redirect:/model/privilege/menu/menu_list.jsp");
		// pid 为空顶级
		if (object.getPid() != null) {
			Resources parentResource = new Resources();
			parentResource.setId(object.getPid());
		}
		object.setMolde("menu");
		resourceService.createOrUpdate(object);
		setMenus(resourceService.loadResource(getLoginer()));
		return view;
	}

	@RequestMapping(value = "delete")
	public void delete(Integer id) {
		if (id == null) {
			outWriteJson(new ReturnJson(2, "删除失败。"));
			return;
		}
		boolean flag = resourceService.delete(id);
		if (flag) {
			outWriteJson(new ReturnJson(0, "删除成功。"));
			setMenus(resourceService.loadResource(getLoginer()));
			return;
		}
		outWriteJson(new ReturnJson(2, "存在关联，无法删除。"));
	}

	@RequestMapping(value = "editPage")
	public ModelAndView editPage(Integer id, Model model) {
		ModelAndView view = new ModelAndView("/model/privilege/menu/edit.jsp");
		SearchResult<Resources> result = resourceService.listParent();
		DataTableReturnObject<Resources> list = new DataTableReturnObject<Resources>(result.getTotalCount(),
				result.getTotalCount(), getSEcho(), result.getResult());
		Resources object = resourceService.find(id);
		model.addAttribute("object", object);
		model.addAttribute("list", list);

		return view;
	}

	@RequestMapping(value = "editAction")
	public ModelAndView editAction(Resources object) {
		ModelAndView view = new ModelAndView("redirect:/model/privilege/menu/menu_list.jsp");
		Resources re = resourceService.find(object.getId());
		re.setName(object.getName());
		re.setUri(object.getUri());
		re.setSequence(object.getSequence());
		re.setRemark(object.getRemark());
		re.setPid(object.getPid());
		resourceService.createOrUpdate(re);
		setMenus(resourceService.loadResource(getLoginer()));
		return view;
	}

	@RequestMapping(value = "showPage")
	public ModelAndView showPage(Integer id, Model model) {
		ModelAndView view = new ModelAndView("/model/privilege/menu/show.jsp");
		model.addAttribute("object", resourceService.find(id));
		return view;
	}

	@RequestMapping(value = "addPage")
	public ModelAndView addPage(Model model) {
		ModelAndView v = new ModelAndView("/model/privilege/menu/add.jsp");
		SearchResult<Resources> result = resourceService.listParent();
		DataTableReturnObject<Resources> list = new DataTableReturnObject<Resources>(result.getTotalCount(),
				result.getTotalCount(), getSEcho(), result.getResult());
		model.addAttribute("list", list);
		return v;
	}

}

package com.cm.modules.systemUser.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cm.core.BaseWebConstant;
import com.cm.core.BaseWebController;
import com.cm.modules.privilege.service.ResourceService;
import com.cm.modules.privilege.service.RoleService;
import com.cm.modules.systemUser.service.SystemUserService;
import com.cm.modules.user.model.SystemUser;
import com.oscloud.error.ErrorException;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.json.ReturnJson;
import com.oscloud.util.HexUtil;

/**
 * 后台系统用户控制器
 * 
 * @author hiyung
 * @2017年3月25日
 */
@Controller
@RequestMapping("/systemUser")
public class SystemUserController extends BaseWebController {
	@Resource
	private SystemUserService service;
	@Resource
	private RoleService roleService;
	@Resource
	private ResourceService resourceService;

	/**
	 * 后台用户登陆
	 * 
	 * @return
	 */
	@RequestMapping("login")
	public ModelAndView login(String loginName, String password, Model model) {
		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			model.addAttribute("error", new ErrorException(1, "用户名或者密码不能为空"));
			return new ModelAndView("/login.jsp");
		}
		SystemUser user = service.queryByLoginName(loginName);
		if (user == null || !HexUtil.validPasswd(password, user.getPassword())) {
			model.addAttribute("error", new ErrorException(1, "用户名或者密码错误"));
			return new ModelAndView("/login.jsp");
		}

		setLoginer(user);
		setMenus(resourceService.loadResource(user));
		return new ModelAndView("/index.jsp");
	}

	@RequestMapping("logout")
	public ModelAndView logout() {
		setLoginer(null);
		return new ModelAndView("redirect:/login.jsp");
	}

	/**
	 * 获取后台管理用户（Web后台管理调用）
	 */
	@RequestMapping(value = "searchUserAction")
	public void list() {
		DataTableReturnObject<SystemUser> list = service.list(searchKey());
		outWriteJson(list);
	}

	@RequestMapping(value = "showPage")
	public ModelAndView showPage(Integer id, Model model) {
		model.addAttribute("object", service.find(id));
		return new ModelAndView("/model/user/showUser.jsp");
	}

	/**
	 * 添加一个用户
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addPage")
	public ModelAndView addPage(Model model) {
		model.addAttribute("roleList", roleService.roleList());
		return new ModelAndView("/model/user/addUser.jsp");
	}

	@RequestMapping(value = "createOrUpdate")
	public ModelAndView createOrUpdate(SystemUser object, Model model) {
		ModelAndView view = new ModelAndView("redirect:/model/user/userlist.jsp");
		view.addObject("iDisplayStart", getIDisplayStart());
		if (service.createOrUpdate(object, model)) {
			return view;
		}
		view.setViewName("/model/user/addUser.jsp");
		return view;
	}

	// @RequestMapping(value = "checkUnique")
	// public void checkUnique(String loginName) {
	// SystemUser unique = service.queryByLoginName(loginName);
	// if (unique != null) {
	// outWrite(false);
	// }
	// outWrite(true);
	// }

	@RequestMapping(value = "delete")
	public void delete(Integer id) {
		if (id == null) {
			outWriteJson(new ReturnJson(2, "删除失败。"));
			return;
		}
		SystemUser user = service.find(id);
		if (user == null) {
			outWriteJson(new ReturnJson(2, "删除失败。"));
			return;
		}
		// 标志为删除状态
		user.setDeleteFlag(BaseWebConstant.deleteFlag);

		if (service.createOrUpdate(user, null)) {
			outWriteJson(new ReturnJson(0, "删除成功"));
			return;
		}

		outWriteJson(new ReturnJson(2, "删除失败"));
	}

	@RequestMapping(value = "changSataus")
	public void changSataus(Integer id) {
		if (id == null) {
			outWriteJson(new ReturnJson(2, "状态修改失败。"));
			return;
		}
		SystemUser user = service.find(id);
		if (user == null) {
			outWriteJson(new ReturnJson(2, "状态修改失败。"));
			return;
		}
		// 修改用户的状态
		if (user.getStatus() == BaseWebConstant.accountClosed) {
			user.setStatus(BaseWebConstant.accountOpen);
		} else {
			user.setStatus(BaseWebConstant.accountClosed);
		}

		if (service.createOrUpdate(user, null)) {
			outWriteJson(new ReturnJson(0, "状态修改成功"));
			return;
		}

		outWriteJson(new ReturnJson(2, "状态修改失败"));
	}

	@RequestMapping(value = "editPage")
	public ModelAndView editPage(Integer id, Model model) {
		if (id == null) {
			return new ModelAndView("/model/user/editUser.jsp");
		}
		// 初始化角色列表
		model.addAttribute("roleList", roleService.roleList());
		SystemUser user = service.find(id);
		model.addAttribute("object", user);
		return new ModelAndView("/model/user/editUser.jsp");
	}

	@RequestMapping(value = "editAction")
	public ModelAndView editAction(SystemUser object, Model model)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView view = new ModelAndView("redirect:/model/user/userlist.jsp");
		service.createOrUpdate(object, model);
		return view;
	}

	@RequestMapping(value = "checkUnique")
	public void checkUnique(String loginName, String mobile)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		outWrite(service.checkUnique(loginName, mobile));
	}

}

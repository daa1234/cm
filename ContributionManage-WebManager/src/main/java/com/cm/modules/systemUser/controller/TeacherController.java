package com.cm.modules.systemUser.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cm.core.BaseWebController;
import com.cm.modules.common.service.TimeZoneService;
import com.cm.modules.privilege.service.ResourceService;
import com.cm.modules.privilege.service.RoleService;
import com.cm.modules.systemUser.service.SystemUserService;
import com.cm.modules.systemUser.service.TeacherService;
import com.cm.modules.user.model.SystemUser;
import com.oscloud.json.DataTableReturnObject;
import com.oscloud.util.Role;

/**
 * 后台系统用户控制器
 * 
 * @author hiyung
 * @2017年3月25日
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController extends BaseWebController {
	@Resource
	private SystemUserService systemUserService;
	@Resource
	private TeacherService teacherService;
	@Resource
	private RoleService roleService;
	@Resource
	private ResourceService resourceService;
	@Resource
	private TimeZoneService timeZoneService;

	/**
	 * 获取后台管理用户（Web后台管理调用）
	 */
	@RequestMapping(value = "searchTeacher")
	public void list() {
		DataTableReturnObject<SystemUser> list = teacherService.list(searchKey());
		outWriteJson(list);
	}

	@RequestMapping(value = "showPage")
	public ModelAndView showPage(Integer id, Model model) {
		model.addAttribute("object", systemUserService.find(id));
		return new ModelAndView("/model/teacher/showTeacher.jsp");
	}

	/**
	 * 添加一个用户
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addPage")
	public ModelAndView addPage(Model model) {
		model.addAttribute("timeZoneLst", timeZoneService.list());
		return new ModelAndView("/model/teacher/addTeacher.jsp");
	}

	@RequestMapping(value = "createOrUpdate")
	public ModelAndView createOrUpdate(SystemUser object, Model model) {
		ModelAndView view = new ModelAndView("redirect:/model/teacher/teacherlist.jsp");
		view.addObject("iDisplayStart", getIDisplayStart());
		object.setSystemRoleId(Role.TEACHER_ROLE);
		if (systemUserService.createOrUpdate(object, model)) {
			return view;
		}
		view.setViewName("/model/teacher/addTeacher.jsp");
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

	@RequestMapping(value = "editPage")
	public ModelAndView editPage(Integer id, Model model) {
		if (id == null) {
			return new ModelAndView("/model/teacher/editTeacher.jsp");
		}
		SystemUser user = systemUserService.find(id);
		model.addAttribute("object", user);
		return new ModelAndView("/model/teacher/editTeacher.jsp");
	}

	@RequestMapping(value = "editAction")
	public ModelAndView editAction(SystemUser object, Model model)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView view = new ModelAndView("redirect:/model/teacher/teacherlist.jsp");
		object.setSystemRoleId(Role.TEACHER_ROLE);
		systemUserService.createOrUpdate(object, model);
		return view;
	}

	@RequestMapping(value = "checkUnique")
	public void checkUnique(String loginName, String mobile)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		outWrite(systemUserService.checkUnique(loginName, mobile));
	}

}

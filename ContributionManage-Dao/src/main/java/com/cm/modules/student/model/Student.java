package com.cm.modules.student.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.cm.common.model.BaseModel;
import com.google.gson.annotations.Expose;

@Entity
@Table(name = "student", catalog = "", schema = "")
public class Student extends BaseModel {

	private static final long serialVersionUID = 1L;

	private Integer id;

	// 邮箱，用户名
	private String email;

	// 学生姓名
	private String studentName;

	// 学号
	private String studentNumber;

	// 手机号
	private String mobile;

	// 昵称
	private String nickName;

	// 登录密码
	@Expose(serialize = false)
	private String password;

	// 时区代码
	private Integer timeZoneCode;

	// 时区名称
	private String timeZoneName;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getTimeZoneCode() {
		return timeZoneCode;
	}

	public void setTimeZoneCode(Integer timeZoneCode) {
		this.timeZoneCode = timeZoneCode;
	}

	@Formula("(select t.name from timezone t where t.code = timeZoneCode)")
	public String getTimeZoneName() {
		return timeZoneName;
	}

	public void setTimeZoneName(String timeZoneName) {
		this.timeZoneName = timeZoneName;
	}

}

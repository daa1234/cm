package com.cm.modules.student.dao.impl;

import org.springframework.stereotype.Repository;

import com.cm.modules.student.dao.StudentDao;
import com.cm.modules.student.model.Student;
import com.oscloud.dao.BaseDAO;

@Repository
public class StudentDaoImpl extends BaseDAO<Student, Integer> implements StudentDao {

}

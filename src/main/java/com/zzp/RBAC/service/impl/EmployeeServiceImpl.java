package com.zzp.RBAC.service.impl;

import com.zzp.RBAC.domain.Counts;
import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.mappers.EmployeeMapper;
import com.zzp.RBAC.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    @Qualifier("employeeMapper")
    private EmployeeMapper employeeMapper;
    @Override
    public List<Employee> findAll() {
        return employeeMapper.findAll();
    }

    /**
     * 验证账号
     * @param name 用户名
     * @param password 密码
     * @return 用户的所有信息
     */
    @Override
    public Employee checkLogin(String name, String password) {
        return employeeMapper.findByNameAndPassword(name, password);
    }

    /**
     * 存入计数
     * @return Counts
     */
    @Override
    public Counts saveCount() {
        Counts counts = new Counts();
        counts.setAllCount(employeeMapper.findAllCount());
        counts.setAdminCount(employeeMapper.findAdminCount(true));
        counts.setUserCount(employeeMapper.findAdminCount(false));
        counts.setRoleCount(employeeMapper.findRoleCount());
        return counts;
    }


}

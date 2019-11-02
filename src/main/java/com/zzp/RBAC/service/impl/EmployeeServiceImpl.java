package com.zzp.RBAC.service.impl;

import com.zzp.RBAC.domain.Counts;
import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.domain.query.QueryObject;
import com.zzp.RBAC.mappers.EmployeeMapper;
import com.zzp.RBAC.mappers.PermissionMapper;
import com.zzp.RBAC.service.EmployeeService;
import com.zzp.RBAC.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    @Qualifier("employeeMapper")
    private EmployeeMapper employeeMapper;
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public List<Employee> findAll(QueryObject qo) {
        return employeeMapper.findAll(qo);
    }

    /**
     * 验证账号
     * @param name 用户名
     * @param password 密码
     * @return 用户的所有信息
     */
    @Override
    public Employee checkLogin(String name, String password) {
        var employee = employeeMapper.findByNameAndPassword(name, password);
        UserContext.setCurrentUser(employee);
        if (!employee.getAdmin()){//非管理员
            // 根据员工ID查询员工的所有权限
            List<String> exps = permissionMapper.selectByEmployeeId(employee.getId());
            UserContext.setExpressions(exps);
        }
        return employee;
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

    @Override
    public void deleteByPrimaryKey(Long id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Employee queryById(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(Employee employee, Long[] ids) {
        if (employee != null && employee.getId() != null) {
            // 先移除employee表和role表的旧的关系,再在后面新增新关系
            employeeMapper.deleteRelation(employee.getId());
            employeeMapper.updateByPrimaryKey(employee);
        } else {
            employeeMapper.insert(employee);
        }

        //新增员工(empoyee表)和角色(role表)的关系
        if (ids != null) {
            for (Long roleId : ids) {
                employeeMapper.insertRelation(employee.getId(), roleId);
            }
        }
    }


}

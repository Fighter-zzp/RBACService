package com.zzp.RBAC.service;

import com.zzp.RBAC.domain.Counts;
import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.domain.query.QueryObject;

import java.util.List;

public interface EmployeeService {
    /**
     * 分页
     * @param qo
     * @return
     */
    List<Employee> findAll(QueryObject qo);
    Employee checkLogin(String name,String password);
    Counts saveCount();
    void deleteByPrimaryKey(Long id);

    Employee queryById(Long id);

    void saveOrUpdate(Employee employee, Long[] ids);
}

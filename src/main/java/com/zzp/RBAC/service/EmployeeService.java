package com.zzp.RBAC.service;

import com.zzp.RBAC.domain.Counts;
import com.zzp.RBAC.domain.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    Employee checkLogin(String name,String password);
    Counts saveCount();
}

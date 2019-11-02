package com.zzp.RBAC.service.impl;

import com.zzp.RBAC.domain.Department;
import com.zzp.RBAC.mappers.DepartmentMapper;
import com.zzp.RBAC.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public void saveOrUpdate(Department department) {
        if (department!=null && department.getId()!=null){
            departmentMapper.updateById(department);
        }else {
            departmentMapper.insert(department);
        }
    }

    @Override
    public void removeById(Long id) {
        departmentMapper.deleteById(id);
    }

    @Override
    public Department queryById(Long id) {
        return null;
    }

    @Override
    public List<Department> queryAll() {
        return departmentMapper.findAll();
    }
}

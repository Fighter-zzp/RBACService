package com.zzp.RBAC.mappers;

import com.zzp.RBAC.domain.Department;

import java.util.List;

public interface DepartmentMapper {
    int deleteById(Long id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectById(Long id);

    int updateByIdSelective(Department record);

    int updateById(Department record);

    List<Department> findAll();
}
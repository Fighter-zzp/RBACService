package com.zzp.RBAC.service;

import com.github.pagehelper.Page;
import com.zzp.RBAC.domain.Department;

import java.util.List;

public interface DepartmentService {

    /**
     * 新增或修改部门
     * @param department
     */
    void saveOrUpdate(Department department);

    /**
     * 根据ID移除部门
     * @param id
     */
    void removeById(Long id);

    /**
     * 根据ID查询部门
     * @param id
     * @return
     */
    Department queryById(Long id);

    /**
     * 查询全部
     * @return
     */
    List<Department> queryAll();

    /**
     * 分页查询
     * @return
     *
     */
//    Page<Department> queryPageList(QueryObject qo);
}

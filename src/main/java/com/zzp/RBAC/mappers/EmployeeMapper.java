package com.zzp.RBAC.mappers;

import com.zzp.RBAC.domain.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

    List<Employee> findAll();

    Employee findByNameAndPassword(@Param("username") String name,@Param("password") String password);

    Integer findAllCount();

    Integer findAdminCount(@Param("admin") Boolean admin);

    Integer findRoleCount();
}
package com.zzp.RBAC.mappers;

import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.domain.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(@Param("employeeId") Long id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);


    Employee findByNameAndPassword(@Param("username") String name,@Param("password") String password);

    Integer findAllCount();

    Integer findAdminCount(@Param("admin") Boolean admin);

    Integer findRoleCount();

    List<Employee> findAll(QueryObject qo);

    void deleteRelation(@Param("employeeId") Long id);

    void insertRelation(@Param("employeeId") Long employeeId, @Param("roleId") Long roleId);
}
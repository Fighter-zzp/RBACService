package com.zzp.RBAC.mappers;

import com.zzp.RBAC.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> findAll();
    List<Role> selectByEmployeeId(@Param("employeeId") Long employeeId);
    void insertRelation(@Param("roleId") Long id, @Param("permissionId")Long permissionId);
    void deleteRelation(@Param("roleId")Long id);
}
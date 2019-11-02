package com.zzp.RBAC.mappers;

import com.zzp.RBAC.domain.Permission;
import com.zzp.RBAC.domain.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper {
    int insert(Permission record);

    List<Permission> selectAll();


    List<String> selectPermissions();

    List<String> selectByEmployeeId(@Param("employeeId") Long id);

    List<Permission> selectByRoleId(@Param("roleId") Long roleId);
}
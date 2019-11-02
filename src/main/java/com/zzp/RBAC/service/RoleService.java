package com.zzp.RBAC.service;

import com.zzp.RBAC.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleService {
    Role findById(Long id);

    List<Role> findAll();
    void deleteById(Long id);


    void saveOrUpdate(Role role,Long ids[]);
}

package com.zzp.RBAC.service;

import com.zzp.RBAC.domain.Permission;
import com.zzp.RBAC.domain.query.QueryObject;

import java.util.List;

public interface PermissionService {
    /**
     * 重新加载权限列表
     */
    void reload();
    /**
     * 查询全部
     * @return
     */
    List<Permission> queryAll();

}

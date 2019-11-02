package com.zzp.RBAC.service.impl;

import com.zzp.RBAC.domain.Role;
import com.zzp.RBAC.mappers.RoleMapper;
import com.zzp.RBAC.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Role findById(Long id){
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> findAll() {
        return roleMapper.findAll();
    }

    @Override
    public void deleteById(Long id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(Role role, Long[] ids) {
        if (role!=null && role.getId()!=null){
            //更新数据之前,先把role_permission的旧关系删除
            roleMapper.deleteRelation(role.getId());
            roleMapper.updateByPrimaryKey(role);
        }else {
            roleMapper.insert(role);
        }
        //维护role表和permission表的关系(role_permission表)
        if (ids != null) {
            for (Long permissionId : ids) {
                roleMapper.insertRelation(role.getId(), permissionId);
            }
        }
    }
}

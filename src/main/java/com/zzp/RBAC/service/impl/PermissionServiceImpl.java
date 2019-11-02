package com.zzp.RBAC.service.impl;

import com.zzp.RBAC.domain.Permission;
import com.zzp.RBAC.mappers.PermissionMapper;
import com.zzp.RBAC.service.PermissionService;
import com.zzp.RBAC.utils.RequiredPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.lang.reflect.Method;
import java.util.Collection;
import java.util.List;
import java.util.Map;
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private ApplicationContext act;//spring 容器类
    @Override
    public void reload() {
        //取出数据库的权限表达式
        var expressions = permissionMapper.selectPermissions();
        //从spring容器中获取有Controller注解的bean
        var beansWithControllerMap = act.getBeansWithAnnotation(Controller.class);
        var ctls = beansWithControllerMap.values();
        ctls.forEach(ctl->{
            //获取所有controller bean的方法对象
            var methods = ctl.getClass().getDeclaredMethods();
            for (Method method : methods) {
                //获取Controller方法对象上的@RequiredPermission注解对象
                RequiredPermission anno = method.getAnnotation(RequiredPermission.class);
                //如果方法上存在权限注解,并且权限注解表达式未存在于数据库中,则将该权限对象插入数据库
                if (anno != null && !expressions.contains(anno.value()[1])) {
                    String name = anno.value()[0];
                    String expression = anno.value()[1];
                    var permission = new Permission();
                    permission.setName(name);
                    permission.setExpression(expression);
                    // 将该权限对象插入数据库
                    permissionMapper.insert(permission);
                }
            }
        });
    }

    @Override
    public List<Permission> queryAll() {
        return permissionMapper.selectAll();
    }
}

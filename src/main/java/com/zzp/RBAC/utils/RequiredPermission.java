package com.zzp.RBAC.utils;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 权限注解,可以在Controller方法上使用,用于描述Controller方法所拥有的权限;
 * 使用格式@RequiredPermission({"权限名称","权限表达式"})
 *      举例: @RequiredPermission({"删除部门","department:delete"}),delete是方法名;
 */
@Retention(RetentionPolicy.RUNTIME) //能加载到JVM中
@Target(ElementType.METHOD) //能在方法上使用该注解
public @interface RequiredPermission {
    /* 数组形式,值的格式{"值1","值2"} ,值1对应权限名称,值2对应权限表达式*/
    String[] value();
}

package com.zzp.RBAC.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class Employee implements Serializable {
    /**
    * 主键
    */
    private Long id;

    /**
    * 员工名称(登录账号)
    */
    private String name;

    /**
    * 员工密码
    */
    private String password;

    /**
    * 员工邮箱
    */
    private String email;

    /**
    * 员工年龄
    */
    private Integer age;

    /**
    * 是否是超级管理员
    */
    private Boolean admin;

    private static final long serialVersionUID = 1L;

    //关联一方对象
    private Department dept;
//    关联many方对象
    private List<Role> roles;
}
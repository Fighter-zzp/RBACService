package com.zzp.RBAC.domain;

import lombok.Data;

@Data
public class Department {
    private Long id;

    /**
    * 部门名称
    */
    private String name;

    /**
    * 部门编号
    */
    private String sn;
}
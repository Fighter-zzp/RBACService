package com.zzp.RBAC.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class Permission implements Serializable {
    /**
    * 主键
    */
    private Long id;

    /**
    * 权限名称
    */
    private String name;

    /**
    * 权限表达式
    */
    private String expression;

    private static final long serialVersionUID = 1L;
}
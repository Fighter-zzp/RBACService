package com.zzp.RBAC.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Role implements Serializable {
    /**
    * 角色主键
    */
    private Long id;

    /**
    * 角色名称
    */
    private String name;

    /**
    * 角色编码
    */
    private String sn;

    private static final long serialVersionUID = 1L;
    //关联many方对象
    private List<Permission> pers = new ArrayList<>();

}
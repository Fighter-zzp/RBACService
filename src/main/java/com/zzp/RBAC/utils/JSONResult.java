package com.zzp.RBAC.utils;

import lombok.Getter;
import lombok.Setter;

/**
 * 封装登录结果相关信息
 */
@Getter@Setter
public class JSONResult {

    private boolean success = true;
    private String msg;

    //登录结果标记信息,登录失败时调用该方法,将错误信息告诉用户
    public JSONResult mark(String msg){
        this.msg=msg;
        this.success=false;
        return this;
    }
}

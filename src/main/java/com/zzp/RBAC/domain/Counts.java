package com.zzp.RBAC.domain;

import lombok.Data;

@Data
public class Counts {
    private Integer allCount;
    private Integer adminCount;
    private Integer userCount;
    private Integer roleCount;
}

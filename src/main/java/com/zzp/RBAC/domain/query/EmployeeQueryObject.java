package com.zzp.RBAC.domain.query;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeQueryObject extends QueryObject {
    private Long deptId = -1L;//部门ID,在高级查询中,默认值-1 表示全部部门.
}

package com.zzp.RBAC.domain.query;


import com.zzp.RBAC.utils.StringUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 封装条件表单数据
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class QueryObject {
	// 封装高级查询条件
	private String keyword;
	public String getKeyword() {
		return StringUtil.hasLength(keyword)?keyword:null;
	}
	
	// 封装分页数据
	private int currentPage=1;
	private int pageSize=3;

	public int getStart() {
		return (currentPage - 1) * pageSize;
	}
}

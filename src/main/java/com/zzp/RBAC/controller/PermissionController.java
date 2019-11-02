package com.zzp.RBAC.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.RBAC.domain.Permission;
import com.zzp.RBAC.domain.query.QueryObject;
import com.zzp.RBAC.service.PermissionService;
import com.zzp.RBAC.utils.RequiredPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/list")
    public String getAll(Model model) {
        List<Permission> list = permissionService.queryAll();
        model.addAttribute("depts", list);
        return "permission/list";
    }

    @RequiredPermission({"查询权限", "permission:page"})
    @RequestMapping("page")
    public String getPageList(@ModelAttribute("qo") QueryObject qo, Model model) {
        //获取指定页数据，大小为3
        PageHelper.startPage(qo.getCurrentPage(), 3);
        //紧跟的第一个select方法被分页
        var permissionList = permissionService.queryAll();
        //使用PageInfo包装数据
        PageInfo pageInfo = new PageInfo(permissionList, 3);
        model.addAttribute("page", pageInfo);
        return "permission/list";
    }


    @RequestMapping("/reload")
    public String reload() {
        permissionService.reload();
        return "redirect:/permission/page";
    }
}

package com.zzp.RBAC.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.RBAC.domain.Permission;
import com.zzp.RBAC.domain.Role;
import com.zzp.RBAC.domain.query.QueryObject;
import com.zzp.RBAC.service.PermissionService;
import com.zzp.RBAC.service.RoleService;
import com.zzp.RBAC.utils.RequiredPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("page")
    public String getPageList(@ModelAttribute("qo") QueryObject qo, Model model){
        //获取指定页数据，大小为3
        PageHelper.startPage(qo.getCurrentPage(), 3);
        //紧跟的第一个select方法被分页
        var roles = roleService.findAll();
        //使用PageInfo包装数据
        PageInfo pageInfo = new PageInfo(roles, 3);
        model.addAttribute("page", pageInfo);
        return "role/list";
    }

    @RequiredPermission({"新增/修改角色","role:saveOrUpdate"})
    @RequestMapping("save")
    public String saveOrUpdate(Role role, Long[] ids) {
        roleService.saveOrUpdate(role,ids);
        return "redirect:/role/page";
    }

    @RequiredPermission({"角色编辑","role:input"})
    @RequestMapping("/edit")
    public String getPage(Model model, Long id) {
        if (id != null) {
            Role role = roleService.findById(id);
            model.addAttribute("role", role);
        }
        List<Permission> permissions = permissionService.queryAll();
        model.addAttribute("permissions",permissions);
        return "role/edit";
    }

    @RequestMapping("delete")
    public String delete(Long id){
        roleService.deleteById(id);
        return "redirect:/role/page";
    }
}

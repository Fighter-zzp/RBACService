package com.zzp.RBAC.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.RBAC.domain.Department;
import com.zzp.RBAC.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/dep")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("list")
    public String department(Model model){
        var dep = departmentService.queryAll();
        model.addAttribute("depts", dep);
        return "department/list";
    }

    @RequestMapping("delete")
    public String delete(Long id){
        departmentService.removeById(id);
        return "redirect:/dep/page";
    }

    @RequestMapping("save")
    public String saveOrUpdate(Department department) {
        departmentService.saveOrUpdate(department);
        return "redirect:/dep/page";
    }

    @RequestMapping("/page")
    public String getOrders(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        //获取指定页数据，大小为3
        PageHelper.startPage(page,3);
        //紧跟的第一个select方法被分页
        List<Department> departments = departmentService.queryAll();
        //使用PageInfo包装数据
        PageInfo pageInfo = new PageInfo(departments, 3);
        model.addAttribute("page", pageInfo);
        return "department/list";
    }
}

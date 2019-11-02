package com.zzp.RBAC.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.RBAC.domain.Department;
import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.domain.Role;
import com.zzp.RBAC.domain.query.EmployeeQueryObject;
import com.zzp.RBAC.service.DepartmentService;
import com.zzp.RBAC.service.EmployeeService;
import com.zzp.RBAC.service.RoleService;
import com.zzp.RBAC.utils.RequiredPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private RoleService roleService;

    //显示所有的预约信息
    @RequestMapping("/page")
    public String getPageList(@ModelAttribute("qo") EmployeeQueryObject qo, Model model) {
        //获取指定页数据，大小为3
        PageHelper.startPage(qo.getCurrentPage(), 3);
        //紧跟的第一个select方法被分页
        var employees = employeeService.findAll(qo);
        //使用PageInfo包装数据
        PageInfo pageInfo = new PageInfo(employees, 3);
        var departments = departmentService.queryAll();
        model.addAttribute("page", pageInfo);
        model.addAttribute("depts", departments);
        return "employee/list";
    }

    @RequiredPermission({"删除员工","employee:delete"})
    @RequestMapping("/delete")
    public String delete(Long id){
        employeeService.deleteByPrimaryKey(id);
        return "redirect:/employee/page";
    }

    /**
     * 进入编辑
     * @param model
     * @param id
     * @return
     */
    @RequiredPermission({"员工编辑","employee:input"})
    @RequestMapping("/edit")
    public String getPage(Model model, Long id) {
        if (id != null) {
            Employee employee = employeeService.queryById(id);
            model.addAttribute("emp", employee);
        }
        List<Department> depts = departmentService.queryAll();
        model.addAttribute("depts", depts);
        List<Role> roles = roleService.findAll();
        model.addAttribute("roles",roles);
        return "employee/edit";
    }

    /**
     * 编辑后保存
     */
    @RequiredPermission({"新增/修改员工","employee:saveOrUpdate"})
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Employee employee, Long[] ids) {
        employeeService.saveOrUpdate(employee, ids);
        return "redirect:/employee/page";
    }
}

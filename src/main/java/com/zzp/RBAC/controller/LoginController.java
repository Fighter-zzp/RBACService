package com.zzp.RBAC.controller;

import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"employee","count"})
public class LoginController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    public String login(String loginUsername,String loginPassword ,Model model){
        var employee = employeeService.checkLogin(loginUsername, loginPassword);
        if (employee==null) {
            return "redirect:/rabc/login.jsp";
        }else {
            model.addAttribute("count",employeeService.saveCount());
            model.addAttribute("employee", employee);
            return "index";
        }
    }
    @RequestMapping("loginout")
    public String loginout(HttpSession session){
        //销毁session
        session.invalidate();
        return "redirect:/login.jsp";
    }
}

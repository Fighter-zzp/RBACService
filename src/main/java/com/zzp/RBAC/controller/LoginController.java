package com.zzp.RBAC.controller;

import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session, SessionStatus sessionStatus){
        //销毁session
        session.invalidate();
        //清除SessionAttributes
        sessionStatus.setComplete();
        return "redirect:/login.jsp";
    }

    @RequestMapping("home")
    public String home(Model model){
        model.addAttribute("count",employeeService.saveCount());
        return "index";
    }

}

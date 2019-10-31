package com.zzp.RBAC.utils;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserContext {
    public static final String EMP_IN_SESSION = "EMP_IN_SESSION";
    public static final String EXPS_IN_SESSION = "EXPS_IN_SESSION";

    //获取session对象(作用域)
    private static HttpSession getSession(){
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
        HttpServletRequest request = servletRequestAttributes.getRequest();
        return request.getSession();
    }

    public static void setCurrentUser(Object obj){
        getSession().setAttribute(EMP_IN_SESSION,obj);
    }
    public static void setExpressions(Object obj){
        getSession().setAttribute(EXPS_IN_SESSION,obj);
    }

    public static Object getCurrentUser(){
        return getSession().getAttribute(EMP_IN_SESSION);
    }
    public static Object getExpressions(){
        return getSession().getAttribute(EXPS_IN_SESSION);
    }

}

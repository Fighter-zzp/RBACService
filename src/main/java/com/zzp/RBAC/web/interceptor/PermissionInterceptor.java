package com.zzp.RBAC.web.interceptor;


import com.zzp.RBAC.domain.Employee;
import com.zzp.RBAC.utils.RequiredPermission;
import com.zzp.RBAC.utils.UserContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.List;

/**
 * 权限拦截器
 */
public class PermissionInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Employee emp = (Employee) UserContext.getCurrentUser();
        //1:如果是管理员用户,则放行
        if (emp.getAdmin()) {
            return true;//放行
        }
        //强转成操作方法
        HandlerMethod hm = (HandlerMethod) handler;
        //获取到当前访问的方法对象
        Method m = hm.getMethod();
        //从方法对象中获取到方法上的注解
        RequiredPermission anno = m.getAnnotation(RequiredPermission.class);
        //2:如果注解为空,则说明访问该方法不需要权限,立即放行
        if (anno == null) {
            return true;//放行
        }
        //获取当前访问的方法上的权限表达式
        String exp = anno.value()[1];
        //从session中获取当前用户所拥有的权限表达式
        List<String> exps = (List<String>) UserContext.getExpressions();
        //3:如果用户拥有访问该方法的权限,则放行
        if (exps.contains(exp)){
            return true;
        }
        //不满足以上各情况,则说明用户无该权限,跳转到没有权限的错误页面
        request.getRequestDispatcher("/WEB-INF/views/commons/nopermission.jsp").forward(request,response);
        return false;
    }

}

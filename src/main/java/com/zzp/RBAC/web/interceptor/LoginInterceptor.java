package com.zzp.RBAC.web.interceptor;

import com.zzp.RBAC.utils.UserContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    //放行的url
    private String[] urls = {"login"};
    /**
     * 请求Controller之前执行preHandler()方法
     * @param request
     * @param response
     * @param handler
     * @return true: 放行; false: 不放行;
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取用户当前的请求地址
        String requestURI = request.getServletPath();
        if (checkURL(requestURI)){
            //放行
            return true;
        }else {
            var user = request.getSession().getAttribute("employee");
            if (user == null){
                response.sendRedirect("redirect:login.jsp");
                return false;
            }
            return true;
        }
    }

    /**
     * 查看url是否在可放行数组中
     * @param url 获取的url
     * @return
     */
    private boolean checkURL(String url){
        for (String u : urls) {
//            System.out.println(url+":"+u+"-->"+url.contains(u));
            if (url.contains(u)){
                return true;
            }
        }
        return false;
    }
}

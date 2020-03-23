package top.lzp.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Lu
 * @date 2020/3/23:15:24:30
 * @description
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求
        String URI = request.getRequestURI();
        if(!URI.contains("login")){
            //不是登录请求
            Object user = request.getSession().getAttribute("user");
            if(user == null){
                //没有登录  重定向到登录页面/请求
                response.sendRedirect(request.getContextPath()+"/login/login.do");
                return false;
            }
        }
        return true;
    }
}

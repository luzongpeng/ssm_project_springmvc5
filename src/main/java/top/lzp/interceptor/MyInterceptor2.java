package top.lzp.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义拦截器1
 *
 * @author Lu
 * @date 2020/3/23:11:51:57
 * @description
 */
public class MyInterceptor2 implements HandlerInterceptor {
    //预处理
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("2 preHandler预处理");
        //不拦截
        return true;
    }

    //后处理
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("2 preHandler后处理");
    }

    //渲染后处理
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("2 preHandler页面渲染后处理");
    }
}

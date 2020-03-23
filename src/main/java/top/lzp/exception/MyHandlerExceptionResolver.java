package top.lzp.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义异常处理器实现
 * @author Lu
 * @date 2020/3/22:18:42:27
 * @description
 */
public class MyHandlerExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response
            , Object o, Exception e) { //o异常对象的全包名+类名+方法名
        ModelAndView mav = new ModelAndView();
        //获取异常信息
        String errorMsg = "";
        //判断异常信息类型
        if(e instanceof MyException){
            //执行自定义异常类型
            errorMsg = "自定义异常"+ ((MyException) e).getMsg()+ " " +o;
        }else {
            //运行时异常
            errorMsg = "运行时异常" + e.getMessage()+ " " +o;
        }
        //将异常信息输出到错误页面
        mav.addObject("error",errorMsg);
        //设置要跳转的视图的名称
        mav.setViewName("error");
        return mav;
    }
}

package top.lzp.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 自定义全局异常处理类
 * @author Lu
 * @date 2020/3/23:01:15:31
 * @description
 */
@ControllerAdvice
public class MyGlobalExceptionHandler {
    //处理运行时异常
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    String runtimeHandler(RuntimeException e){
        return e.getMessage();
    }

    //处理运行时异常
    @ExceptionHandler(MyException.class)
    String myHandler(MyException e, Model model){
        model.addAttribute("error",e.getMsg()+" "+e.getStackTrace()[0]);
        return "error";
    }

    //登录异常自定义
    @ExceptionHandler(MyLoginException.class)
    String loginException(MyLoginException e, Model model){
        Object obj = e.getObj();
        if(obj != null){
            model.addAttribute("username",obj.toString());
        }
        model.addAttribute("errorMsg",e.getMsg());
        return "login_page";
    }
}

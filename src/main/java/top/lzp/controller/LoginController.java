package top.lzp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import top.lzp.bean.User;
import top.lzp.exception.MyLoginException;

import javax.servlet.http.HttpSession;

/**
 * @author Lu
 * @date 2020/3/23:15:17:22
 * @description
 * 登录
 */
@Controller
@RequestMapping("/login/")
public class LoginController {
    //登录请求

    //登录成功 重定向到列表页
    @RequestMapping(value = "login.do",method = RequestMethod.POST)
    public String login(User u, HttpSession session) throws MyLoginException {
        User user = new User();
        user.setUsername("joey");
        user.setPassword("123");
        if(u.getUsername().equals(user.getUsername())){
            //用户名正确
            if(u.getPassword().equals(user.getPassword())){
                session.setAttribute("user",u);
            }else {
                //throw new MyLoginException("密码错误");
                throw new MyLoginException(u.getUsername(),"密码错误");

            }
        }else {
            throw new MyLoginException("用户名错误");
        }
        //判断用户
//        if(u != null){
//            session.setAttribute("user",u);
//        }
        return "redirect:/item/allList.do";
    }
    //登录失败
    @RequestMapping(value = "login.do",method = RequestMethod.GET)
    public String login(){
        return "login_page";
    }
}

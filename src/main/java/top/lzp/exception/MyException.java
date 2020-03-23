package top.lzp.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * 自定义异常类
 * @author Lu
 * @date 2020/3/23:00:50:06
 * @description
 */
@Setter
@Getter
public class MyException extends Exception{
    //错误消息
    private String msg;

    public MyException(String msg) {
        super();
        this.msg = msg;
    }
}

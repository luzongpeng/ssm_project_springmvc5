package top.lzp.exception;

import lombok.Getter;

/**
 * @author Lu
 * @date 2020/3/23:15:37:49
 * @description
 */
@Getter
public class MyLoginException extends Exception{
    private String msg;
    private Object obj;

    public MyLoginException(String msg) {
        super();
        this.msg = msg;
    }
    public MyLoginException(Object obj,String msg) {
        super();
        this.msg = msg;
        this.obj = obj;
    }
}

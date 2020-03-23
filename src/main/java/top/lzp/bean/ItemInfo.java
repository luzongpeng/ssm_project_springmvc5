package top.lzp.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Lu
 * @date 2020/3/19:11:56:58
 * @description
 */
@Setter
@Getter
@ToString
public class ItemInfo {
    private String item_id;
    private String item_name;
    private String item_type;
    private Double item_price;

}

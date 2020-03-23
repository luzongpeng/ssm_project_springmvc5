package top.lzp.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 封装类
 * @author Lu
 * @date 2020/3/22:08:18:43
 * @description
 */

@Setter
@Getter
public class ItemInfoVo {
    private ItemInfo itemInfo;
    private String[] ids;
    private List<Double> priceList;
}

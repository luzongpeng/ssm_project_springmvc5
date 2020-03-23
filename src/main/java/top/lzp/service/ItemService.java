package top.lzp.service;

import top.lzp.bean.ItemInfo;
import top.lzp.bean.ItemInfoVo;
import top.lzp.exception.MyException;

import java.util.List;

/**
 * @author Lu
 * @date 2020/3/19:19:00:32
 * @description
 */
public interface ItemService {
    //查询全部
    public List<ItemInfo> selectAll() throws MyException;
    //根据id查询对象数据
    public ItemInfo selectItemInfoById(String id);
    //根据id删除
    public void deleteById(String id);

    public void save(ItemInfo item);
    //根据vo查询返回列表
    public List<ItemInfo> selectByVo(ItemInfoVo vo);
}

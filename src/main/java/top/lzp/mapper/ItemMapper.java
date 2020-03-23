package top.lzp.mapper;

import top.lzp.bean.ItemInfo;
import top.lzp.bean.ItemInfoVo;

import java.util.List;

/**
 * @author Lu
 * @date 2020/3/19:18:57:16
 * @description
 */
public interface ItemMapper {
    //查询所有
    public List<ItemInfo> selectAll();
    //根据id查询itemInfo
    public ItemInfo selectItemInfoById(String id);
    //根据id删除itemInfo
    public void deleteById(String id);
    //保存
    public void save(ItemInfo item);
    //根据vo 查询 返回
    public List<ItemInfo> selectByVo(ItemInfoVo vo);
    
}

package top.lzp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.lzp.bean.ItemInfo;
import top.lzp.bean.ItemInfoVo;
import top.lzp.exception.MyException;
import top.lzp.mapper.ItemMapper;

import java.util.List;

/**
 * @author Lu
 * @date 2020/3/19:19:01:39
 * @description
 */
@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemMapper itemMapper;

    @Override
    public List<ItemInfo> selectAll() throws MyException {
        //制造运行时异常
//        int i = 1/0;
//        if(true){
//            throw new MyException("列表没有获取到");
//        }
        return itemMapper.selectAll();
    }

    @Override
    public ItemInfo selectItemInfoById(String id) {
        return itemMapper.selectItemInfoById(id);
    }

    @Override
    public void deleteById(String id) {
        itemMapper.deleteById(id);
    }

    //保存
    @Override
    public void save(ItemInfo item) {
        itemMapper.save(item);
    }

    @Override
    public List<ItemInfo> selectByVo(ItemInfoVo vo) {
        return itemMapper.selectByVo(vo);

    }
}

package top.lzp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import top.lzp.bean.ItemInfo;
import top.lzp.bean.ItemInfoVo;
import top.lzp.exception.MyException;
import top.lzp.service.ItemService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**游戏信息管理
 * @author Lu
 * @date 2020/3/19:19:05:11
 * @description
 */
@Controller
@RequestMapping(value = "/item/")
public class ItemController {
    @Autowired
    private ItemService itemService;
    @RequestMapping(value = "allList.do")
    public ModelAndView list() throws MyException {
        ModelAndView mav = new ModelAndView();
        //查询 将结果赋值给mav
        List<ItemInfo> itemList = itemService.selectAll();
        mav.addObject("itemList",itemList);
        //设置视图名称
        mav.setViewName("item_list");
        return mav;
    }

    @RequestMapping("select.do")
    public String select(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model){
        //获取参数
        String id = request.getParameter("id");
        //查询
        ItemInfo item  = itemService.selectItemInfoById(id);
        List<ItemInfo> itemList = new ArrayList<ItemInfo>();
        itemList.add(item);
        //==request.setAttribute("itemList",itemList);
        model.addAttribute("itemList",itemList);
        return "item_list";
    }

    //基本类型参数绑定
    @RequestMapping("delete.do")
    //public String delete(@RequestParam(value = "id",required = false,defaultValue = "1") String id){
    //一般设置页面返回的属性名和后台一致，如果不一致可用上述自己配置映射 @RequestParam(...)
    public String delete( String id){
        //从前台获取id
        System.out.println("delete id ="+id);
        //删除
        itemService.deleteById(id);
        //重定向到网页
        return "redirect:allList.do";
    }

    //通过绑定bean对象的形式来完成参数获取
    @RequestMapping("save.do")
    public String save(ItemInfo item){
        //获取参数
        System.out.println(item);
        //保存逻辑
        itemService.save(item);
        //重定向到列表
        return "redirect:allList.do";
    }

    //包装类绑定
    @RequestMapping("selectByVo.do")
    public String selectByVo(ItemInfoVo vo,Model model){
        //获取vo对象
        System.out.println("itemInfo"+vo.getItemInfo());
        //查询
        List<ItemInfo> itemList = itemService.selectByVo(vo);
        //保存数据
        model.addAttribute("itemList",itemList);
        //返回视图名称
        return "item_list";
    }

    //绑定数组
    @RequestMapping("selectArrays.do")
    public void selectArrays(String[] ids){
        System.out.println(ids.length);
        for (String string:ids) {
            System.out.println("id = " + string);
        }
    }

    //绑定Vo数组
    @RequestMapping("selectVoArrays.do")
    public void selectVoArrays(ItemInfoVo vo){
        System.out.println("ids = " + vo.getIds().length);
        for (String string:vo.getIds()) {
            System.out.println("id = " + string);
        }
    }

    //绑定VoList集合
    @RequestMapping("selectVoList.do")
    public String selectVoList(ItemInfoVo vo){
        System.out.println("list = " + vo.getPriceList().size());
        Double totalPrice = 0d;
        for (Double price:vo.getPriceList()) {
            System.out.println("price = " + price);
            totalPrice += price;
        }
        System.out.println("总价=" + totalPrice);
        return "redirect:allList.do";
    }

    //接受前台的json字符串
    @RequestMapping("jsonData.do")
    @ResponseBody
    public ItemInfo jsonData(@RequestBody ItemInfo item){
        System.out.println("json Data = " +item);
        return item;
    }

    //回显数据
    @RequestMapping("editGoods.do")
    @ResponseBody
    public ItemInfo editGoods(String id){
        ItemInfo item = itemService.selectItemInfoById(id);
        return item;
    }

    //使用RequestBody绑定list
    @RequestMapping("getNameList.do")
    public void getNameList(@RequestBody List<String> nameList){
        System.out.println("获取所有游戏名称");
        System.out.println("namelist size = " + nameList.size());
        for (String string : nameList
             ) {
            System.out.println(string);
        }
    }

    //使用restFul开发
    //查询一个游戏信息，并且显示在内容页
    @RequestMapping(value = "{item_id}",method = RequestMethod.GET)
    @ResponseBody
    public ItemInfo restFul(@PathVariable("item_id") String id,Model model){
        //查询

        ItemInfo item = itemService.selectItemInfoById(id);
        model.addAttribute("item",item);
        //返回页面
        //return "item_info";
        return item;
    }
}

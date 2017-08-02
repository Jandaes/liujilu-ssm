package com.liujilu.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.toolkit.IdWorker;
import com.liujilu.model.SysUser;
import com.liujilu.service.SysUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @since 2017-07-31
 */
@Controller
@RequestMapping("/")
public class SysUserController {
    private Logger logger = Logger.getLogger(SysUserController.class);

    @Autowired
    private SysUserService userService;

    /**
     * 返回到JSP
     * @return
     */
    @RequestMapping("index")
	public ModelAndView index(){
        ModelAndView mv = new ModelAndView("index");
        logger.info("进来了");
        List<SysUser> userList = userService.selectList(new EntityWrapper<SysUser>());
        for (SysUser user:userList) {
            System.out.println(user.toString());
        }
        mv.addObject("userList",userList);
        return mv;
    }

    /**
     * 返回到FreeMarker
     * @param model
     * @return
     */
    @RequestMapping("/freemarker/index")
    public String index(Model model,String name){
        logger.info("进来了Freemarker 处理器");
        EntityWrapper entityWrapper = new EntityWrapper<SysUser>();
        //通过姓名查询
        if(!"".equals(name) && name!=null){
            entityWrapper.like("name",name.trim());
        }
        List<SysUser> userList = userService.selectList(entityWrapper);
        for (SysUser user:userList) {
            System.out.println(user.toString());
        }
        model.addAttribute("userList",userList);
        //保存查询条件
        model.addAttribute("name",name);
        return "indexs";
    }


    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping(value = "/freemarker/save",method = RequestMethod.POST)
    public String save(Model model,SysUser user) {
        logger.info("进入到添加方法");
        try{
            user.setId(IdWorker.getId()+"");
            //创建时间用服务器时间
            user.setCreateTime(new Date());
            userService.insert(user);
        }catch (Exception e){
            model.addAttribute("message",e.getMessage());
        }
        return "redirect:/freemarker/index";
    }


    /**
     * 删除用户
     * @param id 用户编号
     */
    @RequestMapping(value = "/freemarker/delete")
    public String delete(Model model,String id){
        logger.info("进入到删除用户方法");
        try{
            userService.deleteById(id);
        }catch (Exception e){
            model.addAttribute("message",e.getMessage());
        }
        return "redirect:/freemarker/index";
    }


    /**
     * 根据用户编号修改用户
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/freemarker/update")
    public String update(Model model,SysUser user){
        logger.info("进入到修改用户方法");
        try{
            userService.updateById(user);
        }catch (Exception e){
            model.addAttribute("message",e.getMessage());
        }
        return "redirect:/freemarker/index";
    }
}

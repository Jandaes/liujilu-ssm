package com.liujilu.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.liujilu.model.SysUser;
import com.liujilu.service.SysUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public String index(Model model){
        logger.info("进来了Freemarker 处理器");
        List<SysUser> userList = userService.selectList(new EntityWrapper<SysUser>());
        for (SysUser user:userList) {
            System.out.println(user.toString());
        }
        model.addAttribute("userList",userList);
        return "indexs";
    }
}

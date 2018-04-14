package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.ShiroAmdinRole;
import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShiroRoleTree;
import com.baizhi.cmfz.service.ShiroAmdinRoleService;
import com.baizhi.cmfz.service.ShiroRoleService;
import com.baizhi.cmfz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class ShiroRoleController {
    @Autowired
    private ShiroAmdinRoleService shiroAmdinRoleService;
    @Autowired
    private ShiroRoleService shiroRoleService;
    @Autowired
    private UserService userService;


    @RequestMapping("ShiroRoleSelectAll")
    @ResponseBody
    public List selectAll() {
        List<ShiroRoleTree> roles = shiroRoleService.selectAll();
        System.out.println(roles);
        return roles;

    }

    @RequestMapping("updateShiroRole")
    @ResponseBody
    public int updateShiroRole(Admin admin, int[] ids) {
        int updateAdmin = userService.updateAdmin(admin);
        int i1 = shiroAmdinRoleService.deleteShiroAmdinRoleByName(admin.getUsername());

        for (int i = 0; i < ids.length; i++) {
            ShiroAmdinRole shiroAmdinRole = new ShiroAmdinRole();
            shiroAmdinRole.setRoleid(ids[i]);
            shiroAmdinRole.setUsername(admin.getUsername());
            shiroAmdinRoleService.insert(shiroAmdinRole);
        }
        if (updateAdmin!=0&&i1!=0){
            return 1;
        }

            return 0;
    }

}

package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShiroRoleResource;
import com.baizhi.cmfz.entity.Tree;
import com.baizhi.cmfz.service.RoleManagerService;
import com.baizhi.cmfz.service.ShiroRoleResourceService;
import com.baizhi.cmfz.service.ShiroRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class RoleManagerController {
    @Autowired
    private RoleManagerService roleManagerService;
    @Autowired
    private ShiroRoleService shiroRoleService;
    @Autowired
    private ShiroRoleResourceService shiroRoleResourceService;


    @RequestMapping("showRoleResourse")
    @ResponseBody
    public Map showRoleResourse(int page, int rows) {
        Map map = roleManagerService.showRoleResourse(page, rows);
        return map;

    }

    @RequestMapping("insertRoleResourse")
    @ResponseBody
    public int insertRoleResourse(String rolename, int[] ids) {
        try {
            ShiroRole shiroRole = new ShiroRole();
            shiroRole.setRolename(rolename);
            int insert = shiroRoleService.insert(shiroRole);
            for (int i = 0; i < ids.length; i++) {
                ShiroRoleResource sr = new ShiroRoleResource();
                sr.setRolename(rolename);
                sr.setResid(ids[i]);
                roleManagerService.insert(sr);

            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        return 1;
    }

    @RequestMapping("selectByRoleName")
    @ResponseBody
    public List<Tree> selectByRoleName(String rolename) {

        List<Tree> list = roleManagerService.selectByRoleName(rolename);
        return list;
    }

    @RequestMapping("updateRoleResourse")
    @ResponseBody
    public int updateRoleResourse(String rolename, String oldrolename, int[] idss) {
        System.out.println(idss);
        try {
            if (!oldrolename.equals(rolename)) {
                //先删除
                shiroRoleService.deleteByRoleName(oldrolename);
                shiroRoleResourceService.deleteByRoleName(oldrolename);

                //后添加
                ShiroRole shiroRole = new ShiroRole();
                shiroRole.setRolename(rolename);
                int insert = shiroRoleService.insert(shiroRole);
                for (int i = 0; i < idss.length; i++) {
                    ShiroRoleResource sr = new ShiroRoleResource();
                    sr.setRolename(rolename);
                    sr.setResid(idss[i]);
                    roleManagerService.insert(sr);

                }
            } else {
                shiroRoleResourceService.deleteByRoleName(oldrolename);
                for (int i = 0; i < idss.length; i++) {
                    ShiroRoleResource sr = new ShiroRoleResource();
                    sr.setRolename(rolename);
                    sr.setResid(idss[i]);
                    roleManagerService.insert(sr);

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        return 1;
    }

    @RequestMapping("deleteRole")
    @ResponseBody
    public int deleteRole(String [] rolename){
        for (int i=0;i<rolename.length;i++){
            shiroRoleService.deleteByRoleName(rolename[i]);
            shiroRoleResourceService.deleteByRoleName(rolename[i]);
        }
        return 1;
    }


}

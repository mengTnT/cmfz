package com.baizhi.cmfz.controller;

import javax.servlet.http.HttpSession;

import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.service.ShiroAmdinRoleService;
import com.baizhi.cmfz.util.GetToken;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.baizhi.cmfz.service.UserService;

import java.util.Map;


@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ShiroAmdinRoleService shiroAmdinRoleService;

    @RequestMapping("login")
    @ResponseBody
    public Admin login(Admin u, HttpSession httpSession) {
        String username = u.getUsername();
        Admin admin1 = userService.selectByName(username);
        String salt = admin1.getSalt();
        String password = u.getPassword();
        String s = DigestUtils.md5Hex(password + salt);
        u.setPassword(s);
        Admin admin = userService.login(u);

        if (admin != null) {
            httpSession.setAttribute("admin", admin);
            return admin;
        } else {
            return null;
        }

    }

    @RequestMapping("login2")
    @ResponseBody
    public String login2(Admin u) {
        String username = u.getUsername();
        String password = u.getPassword();
        // 登陆  账号  密码
        // 1. 加载配置文件  初始化安全管理器
        IniSecurityManagerFactory iniSecurityManagerFactory = new IniSecurityManagerFactory("classpath:shiro-myRealm.ini");
        // 2. 从工厂中获取安全管理器
        SecurityManager securityManager = iniSecurityManagerFactory.getInstance();

        // 3. 将安全管理器注入安全工具勒种，获取需要认证的主体
        SecurityUtils.setSecurityManager(securityManager);

        AuthenticationToken token = GetToken.getToken(username, password);
        try {
            SecurityUtils.getSubject().login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return null;
        }
        return "ok";

    }

    @RequestMapping("getAllAdmin")
    @ResponseBody
    public Map getAllAdmin(int page, int rows) {

        return userService.getAllAdmin(page,rows);
    }

    @RequestMapping("addAdmin")
    @ResponseBody
    public int addAdmin(Admin admin) {
        return   userService.addAdmin(admin);
    }

    @RequestMapping("deleteAdmin")
    @ResponseBody
    public int deleteAdmin(String[] username){
        for (int i=0;i<username.length;i++){
            int i1 = userService.deleteByName(username[i]);
            int ii = shiroAmdinRoleService.deleteShiroAmdinRoleByName(username[i]);
            if(i1!=0&&ii!=0){
                return 1;
            }
        }
        return 0;
    }

}

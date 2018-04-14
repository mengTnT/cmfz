package com.baizhi.cmfz.realm;


import com.baizhi.cmfz.dao.UserDao;
import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.AdminDTO;
import com.baizhi.cmfz.entity.ShiroRole;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;

/**
 * 自定义realm
 */
public class MyRealm extends AuthorizingRealm {
    @Autowired
    private UserDao userDao;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 获取用户标识
        String username = principalCollection.getPrimaryPrincipal().toString();
        // 根据用户名，从数据库中获取当前主体的角色/资源标识
        Admin admin = userDao.getAdminByName(username);
        List<ShiroRole> shiroRoleList = admin.getList();
        String[] rolename = new String[shiroRoleList.size()];


        int i = 0;
        for (ShiroRole s : shiroRoleList
                ) {
            rolename[i] = s.getRolename();
            i++;
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(Arrays.asList(rolename));
        /*nfo.addStringPermissions(Arrays.asList("user:create","user:update","user:delete","banner:create","banner:update"));*/
        return info;

    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 1. 获取token中用户输入的数据
        String username = authenticationToken.getPrincipal().toString();
        Admin admin = userDao.selectByName(username);
        if (admin != null) {
            return new SimpleAuthenticationInfo(username, admin.getPassword(), this.getName());
        }
        // 2. 根据用户输入的账号，去数据库匹配查询

        // 3. 将 密码数据交于shiro 的认证器，方便之后的密码校验


        return null;
    }
}

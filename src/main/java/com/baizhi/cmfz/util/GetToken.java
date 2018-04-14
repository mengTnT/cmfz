package com.baizhi.cmfz.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;

public class GetToken {
    public static AuthenticationToken getToken(String username,String password){



        // 4. 主体完成认证  token  令牌  保存用户的数据
        /**
         * UnknownAccountException ：未知账户
         * IncorrectCredentialsException：密码错误
         */
        AuthenticationToken token = new UsernamePasswordToken(username,password);
        return token;
    }

}

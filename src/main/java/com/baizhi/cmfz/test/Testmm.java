package com.baizhi.cmfz.test;


import com.baizhi.cmfz.util.GetToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;

/**
 * shiro的授权
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Testmm {
    @Test
    public  void tttt() {
        IniSecurityManagerFactory iniSecurityManagerFactory = new IniSecurityManagerFactory("classpath:shiro-myRealm.ini");
        SecurityManager securityManager = iniSecurityManagerFactory.getInstance();

        SecurityUtils.setSecurityManager(securityManager);

        Subject subject = SecurityUtils.getSubject();

        try{
            subject.login(new UsernamePasswordToken("test","123456"));

            // 认证通过后对主体授权
            // 基于角色的访问控制
         /*   boolean role2 = subject.hasRole("role1");*/
          /*   boolean[] booleans = subject.hasRoles(Arrays.asList("role1", "role2"));
            // 以异常的方式，检查
            subject.checkRole("role2");*/
            // 基于资源标识
           /* boolean permitted = subject.isPermitted("banner:create");
            boolean[] permitted1 = subject.isPermitted("user:create", "user:delete", "banner:update");*/
           /* for (boolean p:permitted1) {
                System.out.println(p);
            }*/
            /* subject.checkPermission("user:create");*/
        }catch(Exception e){
            e.printStackTrace();
        }



    }
}

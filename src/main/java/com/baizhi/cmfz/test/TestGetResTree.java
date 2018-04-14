package com.baizhi.cmfz.test;


import com.baizhi.cmfz.dao.RoleManagerDao;
import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.util.ResourceUtil2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestGetResTree {
    @Autowired
    private RoleManagerDao roleManagerDao;

    @Test
    public void getRes(){

        List<ShiroRole> roles =new ArrayList<>();
        roles.add(new ShiroRole(1,"system"));
        roles.add(new ShiroRole(2,"log"));
        ResourceUtil2.getTree(roles,roleManagerDao);

    }
}

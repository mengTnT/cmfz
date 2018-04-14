package com.baizhi.cmfz.test;

import com.baizhi.cmfz.dao.UserDao;
import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.AdminDTO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestAdmin {
    @Autowired
    private UserDao userDao;
    @Test
    public void tttt(){
       PageHelper.startPage(1, 5);
        List<Admin> list = userDao.getAllAdmin();
        PageInfo<Admin> pageInfo = new PageInfo<>(list);
        List<Admin> list2 = pageInfo.getList();

        System.out.println(list2);
        System.out.println(pageInfo.getTotal());
    }
}

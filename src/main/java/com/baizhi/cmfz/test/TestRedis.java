package com.baizhi.cmfz.test;

import com.baizhi.cmfz.entity.Admin;

import com.baizhi.cmfz.entity.Banner;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestRedis {
    @Autowired
    private RedisTemplate redisTemplate;
    @Test
    public void TestBanner(){
       /* Admin admin =new Admin(1,"aaa","bbbb","ccc");

        redisTemplate.opsForValue().set("admin",admin);*/
        List<Banner> list1= (List) redisTemplate.opsForValue().get("list"+1+10);
        System.out.println("666");
        System.out.println(list1);

    }
}

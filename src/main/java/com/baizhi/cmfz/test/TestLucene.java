package com.baizhi.cmfz.test;

import com.baizhi.cmfz.dao.ArticleDao;
import com.baizhi.cmfz.dao.GuruDao;
import com.baizhi.cmfz.entity.Article;
import com.baizhi.cmfz.service.ArticleService;
import com.baizhi.cmfz.util.LuceneUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestLucene {
    @Autowired
    private ArticleDao articleDao;
    @Test
    public void test11 ()throws Exception{
      /*  List<Article> list = articleDao.showAllArticle(1, 10);
        System.out.println(list);
        for (Article a:list
             ) {
            LuceneUtil.createIndexDB(a);
        }*/
       Map<String, Object> map = LuceneUtil.findIndexDB("上", 1, 3);
        System.out.println(map.get("rows"));
    }
}

package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.dao.ArticleDao;
import com.baizhi.cmfz.entity.Article;
import com.baizhi.cmfz.service.ArticleService;
import com.baizhi.cmfz.util.LuceneUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class LuceneController {
    @Autowired
    private ArticleDao articleDao;

    @RequestMapping("showLuceneArticle")
    @ResponseBody
    public Map showLuceneArticle(int page, int rows,String keysword)  {
        Map<String, Object> map = null;
        try {
            String str= new String(keysword.getBytes("ISO-8859-1"),"UTF-8");
           map = LuceneUtil.findIndexDB(str, page, rows);

        } catch (Exception e) {
            LuceneUtil.close();
            e.printStackTrace();
        }
        finally {
            LuceneUtil.close();
        }
        return map;
    }
    @RequestMapping("reset")
    @ResponseBody
    public void reset()throws Exception{
        LuceneUtil.deleteIndexDB();
    }
    @RequestMapping("add")
    @ResponseBody
    public void add()throws Exception{
        List<Article> list = articleDao.showAllArticle(1, 100);
        for (Article a:list) {
            LuceneUtil.createIndexDB(a);
        }
        LuceneUtil.close();

    }
}

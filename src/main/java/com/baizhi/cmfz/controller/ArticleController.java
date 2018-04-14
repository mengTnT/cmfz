package com.baizhi.cmfz.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baizhi.cmfz.entity.Article;

import com.baizhi.cmfz.service.ArticleService;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("showAllArticle")
    @ResponseBody
    public Map showAllArticle(int page, int rows) {
        return articleService.showAllArticle(page, rows);
    }

    @RequestMapping("addArticle")
    @ResponseBody
    public int addArticle(Article article, MultipartFile image, HttpServletRequest request) throws IllegalStateException, IOException {
        //得到原始文件名
        String pic = image.getOriginalFilename();
        //获取到images的绝对路径，表示要上传到哪个文件夹
        String realPath = request.getRealPath("picture/si/");
        //通过时间重命名、时间+源文件名重命名,防止重名
        pic = new Date().getTime() + "_" + pic;
        File file = new File(realPath + "/" + pic);

        //把原始文件名赋值给对象
        article.setArticleImage("/si/" + pic);
        //把上传上来的文件转换为磁盘文件
        image.transferTo(file);

        return articleService.addArticle(article);


    }
    @RequestMapping("updateArticle")
    @ResponseBody
    public int updateArticle(Article article, MultipartFile image, HttpServletRequest request) throws IllegalStateException, IOException {
        if (!image.isEmpty()) {
            //得到原始文件名
            String pic = image.getOriginalFilename();
            //获取到images的绝对路径，表示要上传到哪个文件夹
            String realPath = request.getRealPath("picture/si/");
            //通过时间重命名、时间+源文件名重命名,防止重名
            pic = new Date().getTime() + "_" + pic;
            File file = new File(realPath + "/" + pic);

            //把原始文件名赋值给对象
            article.setArticleImage("/si/" + pic);
            //把上传上来的文件转换为磁盘文件
            image.transferTo(file);
            return articleService.updateArticle(article);
        }


        return articleService.updateArticle(article);

    }
    @RequestMapping("deleteArticle")
    @ResponseBody
    public int deleteArticle(String[]ids){

        return articleService.deleteArticle(ids);
    }


}

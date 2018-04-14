package com.baizhi.cmfz.dao;

import java.util.List;

import com.baizhi.cmfz.entity.Article;
import org.apache.ibatis.annotations.Param;

public interface ArticleDao {
	public List<Article> showAllArticle(@Param("start")int start, @Param("rows")int rows);
	public int getTotal();
	public int addArticle(Article article);
	public int updateArticle(Article article);
	public int deleteArticle(String[]ids);


}

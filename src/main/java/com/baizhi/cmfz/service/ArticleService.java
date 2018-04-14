package com.baizhi.cmfz.service;

import java.util.List;
import java.util.Map;

import com.baizhi.cmfz.entity.Article;

public interface ArticleService {
	public Map showAllArticle(int page, int rows);
	public int addArticle(Article article);
	public int updateArticle(Article article);
	public int deleteArticle(String[]ids);


}

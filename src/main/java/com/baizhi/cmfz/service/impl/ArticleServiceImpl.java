package com.baizhi.cmfz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.cmfz.dao.ArticleDao;
import com.baizhi.cmfz.entity.Article;
import com.baizhi.cmfz.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	private ArticleDao articleDao;


	@Override
	public Map showAllArticle(int page, int rows) {
		Map map=new HashMap();
		int start=(page-1)*rows;

		int total=articleDao.getTotal();
		List<Article> list = articleDao.showAllArticle(start, rows);
		map.put("total", total);
		map.put("rows", list);
		return map;

	}

	@Override
	public int addArticle(Article article) {
		return articleDao.addArticle(article);
	}

	@Override
	public int updateArticle(Article article) {
		return articleDao.updateArticle(article);
	}

	@Override
	public int deleteArticle(String[] ids) {
		return articleDao.deleteArticle(ids);
	}
}

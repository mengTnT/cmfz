package com.baizhi.cmfz.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Article {
	private String articleId;
	private String articleName;
	private String articleImage;
	private String articleContent;
	private Guru guru;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date articleDate;
	private int articleCount;//浏览次数
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getArticleImage() {
		return articleImage;
	}
	public void setArticleImage(String articleImage) {
		this.articleImage = articleImage;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public Guru getGuru() {
		return guru;
	}
	public void setGuru(Guru guru) {
		this.guru = guru;
	}
	public Date getArticleDate() {
		return articleDate;
	}
	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}
	public int getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}
	public Article(String articleId, String articleName, String articleImage,
			String articleContent, Guru guru, Date articleDate, int articleCount) {
		super();
		this.articleId = articleId;
		this.articleName = articleName;
		this.articleImage = articleImage;
		this.articleContent = articleContent;
		this.guru = guru;
		this.articleDate = articleDate;
		this.articleCount = articleCount;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleName="
				+ articleName + ", articleImage=" + articleImage
				+ ", articleContent=" + articleContent + ", guru=" + guru
				+ ", articleDate=" + articleDate + ", articleCount="
				+ articleCount + "]";
	}
	

}

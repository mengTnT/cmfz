package com.baizhi.cmfz.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baizhi.cmfz.entity.Article;
import com.baizhi.cmfz.entity.Guru;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.ChineseAnalyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;




public class LuceneUtil {
	
	private static Version version;
	private static IndexWriterConfig indexConfig;
	private static Analyzer analyzer;
	private static Directory directory;
	private static ThreadLocal<IndexWriter> t = new ThreadLocal<IndexWriter>();
	static {
		try {
			directory = FSDirectory.open(new File("D://indexDB"));
			version = Version.LUCENE_44;
			analyzer =  new IKAnalyzer();
			indexConfig = new IndexWriterConfig(version, analyzer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 创建索引库
	 * @param article
	 * @throws Exception
	 */
	public static void createIndexDB(Article article) {
		try {
			IndexWriter indexWriter = getIndexWriter();
			Document doc = getDocument(article);
  			indexWriter.addDocument(doc);
			indexWriter.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	* 索引库的检索  分页
	* */
	public static Map<String,Object> findIndexDB(String keysword,Integer page,Integer rows) throws Exception{
		//index查询器
		IndexSearcher indexSearcher = new IndexSearcher(IndexReader.open(directory));
		String[] fields = {"guru","articleName","articleContent"};
		//封装关键字
		QueryParser queryParser = new MultiFieldQueryParser(version, fields, analyzer);
		Query query = queryParser.parse(keysword);
		//html转换
		Formatter formatter = new SimpleHTMLFormatter("<font color='red'><b>", "</b></font>");
		//根据query查询
		Scorer scorer = new QueryScorer(query);
		//关键字高亮
		Highlighter highlighter = new Highlighter(formatter, scorer);

		TopDocs search = indexSearcher.search(query, 100000);
		List<Article> articleList = new ArrayList<Article>();
        //获取标号数组
		ScoreDoc[] scoreDocs = search.scoreDocs;
		int ss=scoreDocs.length;
		int start = (page-1)*rows ;
		int end =  Math.min(scoreDocs.length,page*rows);
		for (int i = start; i < end; i++) {
			int num = scoreDocs[i].doc;
			Document doc = indexSearcher.doc(num);
			highlighter.getBestFragment(analyzer, "articleName", doc.get("articleName"));
			String articleId = doc.get("articleId");
			String articleName = highlighter.getBestFragment(analyzer, "articleName", doc.get("articleName"));
			if(articleName==null){
				articleName = doc.get("articleName");
			}
			String articleImage = doc.get("articleImage");
			String articleContent = highlighter.getBestFragment(analyzer, "articleContent", doc.get("articleContent"));
			if(articleContent==null){
				articleContent = doc.get("articleContent");
			}
			String guruName = highlighter.getBestFragment(analyzer, "guru", doc.get("guru"));
			if(guruName==null){
				guruName = doc.get("guru");
			}
			String articleDate = doc.get("articleDate");
			Long valueOf = Long.valueOf(articleDate);
			Date date = new Date(valueOf);
			String articleCount = doc.get("articleCount");
			Article article = new Article();
			Guru guru = new Guru();
			guru.setSiName(guruName);
			
			article.setGuru(guru);
			article.setArticleContent(articleContent);
			article.setArticleCount(Integer.valueOf(articleCount));
			article.setArticleDate(date);
			article.setArticleId(articleId);
			article.setArticleImage(articleImage);
			article.setArticleName(articleName);
			articleList.add(article);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rows", articleList);
		map.put("total", search.totalHits);
		return map;
	}

	/**
	 * 索引库的更新
	 * @param article
	 * @throws Exception
	 */
	public static void updateIndexDB(Article article) throws Exception{
		IndexWriter indexWriter = getIndexWriter();
		Document doc = getDocument(article);
		indexWriter.updateDocument(new Term("id",article.getArticleId()), doc);
		indexWriter.commit();
	}

	/**
	 * 索引库的 批量删除
	 * @param ids
	 * @throws Exception
	 */
	public static void deleteIndexDB(String[] ids) throws Exception{
		IndexWriter indexWriter = getIndexWriter();
		Term[] terms = new Term[ids.length];
		for (int i=0;i<ids.length;i++) {
			Term term = new Term("id",ids[i]);
			terms[i] = term;
		}
		indexWriter.deleteDocuments(terms);
		indexWriter.commit();
	}

	/**
	 * 删除所有
	 * @throws Exception
	 */
	public static void deleteIndexDB() throws Exception{
		IndexWriter indexWriter = getIndexWriter();
		indexWriter.deleteAll();
		indexWriter.commit();
	}

	/**
	 * JavaBean 转换为 Doc
	 * @param article
	 * @return
	 */
	public static Document getDocument(Article article){
		Document doc = new Document();
		doc.add(new StringField("articleId",article.getArticleId(),Store.YES));
		doc.add(new TextField("articleName",article.getArticleName(),Store.YES));
		doc.add(new TextField("articleImage",article.getArticleImage(),Store.YES));
		doc.add(new TextField("articleContent",article.getArticleContent(),Store.YES));
		doc.add(new TextField("guru",article.getGuru().getSiName(),Store.YES));
		doc.add(new LongField("articleDate",article.getArticleDate().getTime(),Store.YES));
		doc.add(new IntField("articleCount",article.getArticleCount(),Store.YES));
		return doc;
	}

	/**
	 * 获取indexWriter
	 * @return
	 * @throws Exception
	 */
	private static IndexWriter getIndexWriter()throws Exception{
		IndexWriter indexWriter = t.get();
		if(indexWriter==null){
			indexWriter = new IndexWriter(directory, indexConfig);
			t.set(indexWriter);
		}
		return indexWriter;
	}

	/**
	 * 关闭资源
	 */
	public static void close(){
		IndexWriter indexWriter = t.get();
		if(indexWriter!=null){
			try {
				indexWriter.close();
				t.remove();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	 
}

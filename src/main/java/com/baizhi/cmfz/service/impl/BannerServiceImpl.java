package com.baizhi.cmfz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.baizhi.cmfz.Log.ServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.baizhi.cmfz.dao.BannerDao;
import com.baizhi.cmfz.entity.Banner;
import com.baizhi.cmfz.service.BannerService;
@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private RedisTemplate redisTemplate;
	@ServiceLog("展示轮播图")
	@Override
	public Map getAllBanner(int page, int rows) {
		Map map=new HashMap();
		int start=(page-1)*rows;
		int total=bannerDao.getTotal();
		map.put("total", total);
		if(redisTemplate.opsForValue().get("list"+page+rows)!=null){
			List<Banner> list1= (List) redisTemplate.opsForValue().get("list"+page+rows);
			map.put("rows", list1);
			return map;

		}
		else {
			List<Banner> list = bannerDao.getAllBanner(start, rows);
			map.put("rows", list);
			System.out.println(map);
			redisTemplate.opsForValue().set("list"+page+rows,list);
			return map;
		}
	}
	@ServiceLog("添加轮播图")
	@Override
	public int addBanner(Banner banner) {
		deleteAllRedis();
		int result=bannerDao.addBanner(banner);
		return result;
	}
	@ServiceLog("删除轮播图")
	@Override
	public int deleteBanner(int[] ids) {
		deleteAllRedis();
		return bannerDao.deleteBanner(ids);
	}
	@ServiceLog("修改轮播图")
	@Override
	public int updateBanner(Banner banner) {
		deleteAllRedis();
		return bannerDao.updateBanner(banner);
	}

	public void deleteAllRedis(){
		Set keys = redisTemplate.keys("**list**"); // 模糊查询相关key集合
		redisTemplate.delete(keys); //删除所有key
	}
}

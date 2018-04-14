package com.baizhi.cmfz.dao;

import java.util.List;

import com.baizhi.cmfz.entity.Banner;
import org.apache.ibatis.annotations.Param;

public interface BannerDao {
	public List<Banner> getAllBanner(@Param("start")int start, @Param("rows")int rows);
	public int addBanner(Banner banner);
	public int deleteBanner(int[] ids);
	public int updateBanner(Banner banner);
	public int getTotal();

}

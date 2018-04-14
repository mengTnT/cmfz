package com.baizhi.cmfz.service;

import java.util.List;
import java.util.Map;

import com.baizhi.cmfz.entity.Banner;

public interface BannerService {
	public Map getAllBanner(int page, int rows);
	public int addBanner(Banner banner);
	public int deleteBanner(int[] ids);
	public int updateBanner(Banner banner);
}

package com.baizhi.cmfz.entity;

import java.io.Serializable;

public class Banner implements Serializable {
	private int bannerId;
	private String bannerImage;
	private String bannerName;
	private int bannerNum;
	private String bannerState;
	public int getBannerId() {
		return bannerId;
	}
	public void setBannerId(int bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public String getBannerName() {
		return bannerName;
	}
	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	public int getBannerNum() {
		return bannerNum;
	}
	public void setBannerNum(int bannerNum) {
		this.bannerNum = bannerNum;
	}
	public String getBannerState() {
		return bannerState;
	}
	public void setBannerState(String bannerState) {
		this.bannerState = bannerState;
	}
	public Banner(int bannerId, String bannerImage, String bannerName,
			int bannerNum, String bannerState) {
		super();
		this.bannerId = bannerId;
		this.bannerImage = bannerImage;
		this.bannerName = bannerName;
		this.bannerNum = bannerNum;
		this.bannerState = bannerState;
	}
	public Banner() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Banner [bannerId=" + bannerId + ", bannerImage=" + bannerImage
				+ ", bannerName=" + bannerName + ", bannerNum=" + bannerNum
				+ ", bannerState=" + bannerState + "]";
	}
	
	

}

package com.baizhi.cmfz.entity;

public class Guru {
	private String siId;
	private String siName;
	private String siImage;
	private String siNickname;
	public String getSiId() {
		return siId;
	}
	public void setSiId(String siId) {
		this.siId = siId;
	}
	public String getSiName() {
		return siName;
	}
	public void setSiName(String siName) {
		this.siName = siName;
	}
	public String getSiImage() {
		return siImage;
	}
	public void setSiImage(String siImage) {
		this.siImage = siImage;
	}
	public String getSiNickname() {
		return siNickname;
	}
	public void setSiNickname(String siNickname) {
		this.siNickname = siNickname;
	}
	public Guru(String siId, String siName, String siImage, String siNickname) {
		super();
		this.siId = siId;
		this.siName = siName;
		this.siImage = siImage;
		this.siNickname = siNickname;
	}
	public Guru() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Guru [siId=" + siId + ", siName=" + siName + ", siImage="
				+ siImage + ", siNickname=" + siNickname + "]";
	}
	

}

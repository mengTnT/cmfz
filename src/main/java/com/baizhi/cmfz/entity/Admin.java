package com.baizhi.cmfz.entity;

import java.io.Serializable;
import java.util.List;

public class Admin implements Serializable{
	private int id;
	private String username;
	private String password;
	private String salt;
	private List<ShiroRole> list;

	public Admin() {
	}

	@Override
	public String toString() {
		return "Admin{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", salt='" + salt + '\'' +
				", list=" + list +
				'}';
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public List<ShiroRole> getList() {
		return list;
	}

	public void setList(List<ShiroRole> list) {
		this.list = list;
	}

	public Admin(int id, String username, String password, String salt, List<ShiroRole> list) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.salt = salt;
		this.list = list;

	}
}

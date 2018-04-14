package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.AdminDTO;
import com.baizhi.cmfz.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
	public Admin login(Admin admin);
	public Admin selectByName(String username);
	public List<Admin> getAllAdmin();
	public int addAdmin(Admin admin);
	public Admin getAdminByName(String username);
	public  int updateAdmin(Admin admin);
	public List<User> findUserByIds(int [] ids);
	public List<User> getAllUsers();
	public  int addUser(User user);
	public int deleteByName(String username);
}

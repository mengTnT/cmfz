package com.baizhi.cmfz.service;

import com.baizhi.cmfz.Log.ServiceLog;
import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {

	public Admin login(Admin admin);

	public Admin selectByName(String userName);

	public Map getAllAdmin(int page, int rows);

	public Map getAllUsers(int page, int rows);

	public int addAdmin(Admin admin);

	public  int updateAdmin(Admin admin);

	public List<User> findUserByIds(int [] ids);

	public  int addUser(User user);

	public int deleteByName(String username);


}

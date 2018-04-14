package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.Log.ServiceLog;
import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.AdminDTO;
import com.baizhi.cmfz.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.cmfz.dao.UserDao;
import com.baizhi.cmfz.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public Map getAllAdmin(int page, int rows) {
        Map map = new HashMap();
        PageHelper.startPage(page, rows);
        List<Admin> list = userDao.getAllAdmin();
        PageInfo<Admin> pageInfo = new PageInfo<>(list);
        List<Admin> list2 = pageInfo.getList();
        map.put("rows", list2);
        map.put("total", pageInfo.getTotal());
        return map;

    }

    @Override
    public Map getAllUsers(int page, int rows) {
        Map map = new HashMap();
        PageHelper.startPage(page, rows);
        List<User> list = userDao.getAllUsers();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        List<User> list2 = pageInfo.getList();
        map.put("rows", list2);
        map.put("total", pageInfo.getTotal());
        return map;
    }

    @Override
    public int addAdmin(Admin admin) {
        return userDao.addAdmin(admin);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return userDao.updateAdmin(admin);
    }

    @Override
    public List<User> findUserByIds(int[] ids) {
        return userDao.findUserByIds(ids);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @ServiceLog("删除管理员")
    @Override
    public int deleteByName(String username) {
        return userDao.deleteByName(username);
    }

    @ServiceLog("登录方法")
    @Override
    public Admin login(Admin admin) {
        Admin admin2 = userDao.login(admin);
        return admin2;
    }

    @ServiceLog("根据名称查询盐值")
    @Override
    public Admin selectByName(String userName) {
        Admin admin = userDao.selectByName(userName);
        return admin;
    }
}

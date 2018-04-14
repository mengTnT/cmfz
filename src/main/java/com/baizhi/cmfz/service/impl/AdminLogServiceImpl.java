package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.AdminLogDao;
import com.baizhi.cmfz.entity.AdminLog;
import com.baizhi.cmfz.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminLogServiceImpl implements AdminLogService{
    @Autowired
    private AdminLogDao adminLogDao;
    @Override
    public int addAdminLog(AdminLog adminLog) {
        int result=adminLogDao.addAdminLog(adminLog);

        return result;
    }

    @Override
    public Map getAllLog(int page, int rows) {
        Map map=new HashMap();
        int start=(page-1)*rows;
        int total=adminLogDao.getTotal();
        List<AdminLog> list =adminLogDao.getAllLog(start,rows);
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    @Override
    public int deleteLog(int[] ids) {
        return adminLogDao.deleteLog(ids);
    }
}

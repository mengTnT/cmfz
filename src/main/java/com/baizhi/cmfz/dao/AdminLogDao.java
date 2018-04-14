package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.AdminLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminLogDao {
    public int addAdminLog(AdminLog adminLog);
    public List<AdminLog> getAllLog(@Param("start")int start, @Param("rows")int rows);
    public int deleteLog(int [] ids);
    public int getTotal();
}

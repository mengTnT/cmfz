package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.AdminLog;

import java.util.List;
import java.util.Map;

public interface AdminLogService {
    public int addAdminLog(AdminLog adminLog);
    public Map getAllLog(int page, int rows);
    public int deleteLog(int [] ids);
}

package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.AdminLog;
import com.baizhi.cmfz.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class AdminLogController {
    @Autowired
    private AdminLogService adminLogService;
    @RequestMapping("getAllLog")
    @ResponseBody
    public Map getAllLog(int page, int rows){
        return adminLogService.getAllLog(page,rows);

    }
    @RequestMapping("deleteLog")
    @ResponseBody
    public int deleteLog(int [] ids){
        return adminLogService.deleteLog(ids);
    }
}

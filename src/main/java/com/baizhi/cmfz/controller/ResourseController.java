package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Resourse;
import com.baizhi.cmfz.entity.Tree;
import com.baizhi.cmfz.service.ResourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ResourseController {
    @Autowired
    private ResourseService resourseService;

    @RequestMapping("selectAllResourse")
    @ResponseBody
    public List<Tree> selectAll() {
        return resourseService.selectAll();
    }
}

package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Guru;
import com.baizhi.cmfz.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GuruController {
    @Autowired
    private GuruService guruService;

    @RequestMapping("getGuru")
    @ResponseBody
    public List<Guru> getGuru() {

        return guruService.getGuru();
    }
}

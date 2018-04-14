package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("getAllUsers")
    @ResponseBody
    public Map getAllUsers(int page, int rows) {

        return userService.getAllUsers(page,rows);
    }
}

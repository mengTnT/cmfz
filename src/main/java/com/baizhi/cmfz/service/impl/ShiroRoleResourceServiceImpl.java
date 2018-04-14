package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.ShiroRoleResourceMapper;
import com.baizhi.cmfz.entity.ShiroRoleResource;
import com.baizhi.cmfz.service.ShiroRoleResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShiroRoleResourceServiceImpl implements ShiroRoleResourceService {

    @Autowired
    private ShiroRoleResourceMapper shiroRoleResourceMapper;
    @Override
    public int deleteByRoleName(String rolename) {
        return shiroRoleResourceMapper.deleteByRoleName(rolename);
    }

    @Override
    public int insert(ShiroRoleResource record) {
        return shiroRoleResourceMapper.insert(record);
    }
}

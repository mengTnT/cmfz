package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.ShiroAmdinRoleMapper;
import com.baizhi.cmfz.entity.ShiroAmdinRole;
import com.baizhi.cmfz.service.ShiroAmdinRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShiroAmdinRoleServiceImpl implements ShiroAmdinRoleService {
    @Autowired
    private ShiroAmdinRoleMapper shiroAmdinRoleMapper;
    @Override
    public int deleteShiroAmdinRoleByName(String username) {
        return shiroAmdinRoleMapper.deleteShiroAmdinRoleByName(username);
    }

    @Override
    public int insert(ShiroAmdinRole record) {
        return shiroAmdinRoleMapper.insert(record);
    }
}

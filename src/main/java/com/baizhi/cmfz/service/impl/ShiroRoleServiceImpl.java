package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.ShiroAmdinRoleMapper;
import com.baizhi.cmfz.dao.ShiroRoleMapper;
import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShiroRoleTree;
import com.baizhi.cmfz.service.ShiroRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShiroRoleServiceImpl implements ShiroRoleService {
    @Autowired
    private ShiroRoleMapper shiroRoleMapper;
    @Override
    public List<ShiroRoleTree> selectAll() {
        return shiroRoleMapper.selectAll();
    }

    @Override
    public int insert(ShiroRole record) {
        return shiroRoleMapper.insert(record);
    }

    @Override
    public int deleteByRoleName(String rolename) {
        return shiroRoleMapper.deleteByRoleName(rolename);
    }


}

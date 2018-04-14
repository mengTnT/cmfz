package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShiroRoleTree;

import java.util.List;

public interface ShiroRoleMapper {
    int deleteByPrimaryKey(Integer roleid);
    int deleteByRoleName(String rolename);
    int insert(ShiroRole record);

    ShiroRole selectByPrimaryKey(Integer roleid);

    List<ShiroRoleTree> selectAll();

    int updateByPrimaryKey(ShiroRole record);
}
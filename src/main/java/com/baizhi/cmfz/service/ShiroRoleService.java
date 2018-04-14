package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShiroRoleTree;

import java.util.List;

public interface ShiroRoleService {
    List<ShiroRoleTree> selectAll();
    int insert(ShiroRole record);
    int deleteByRoleName(String rolename);

}

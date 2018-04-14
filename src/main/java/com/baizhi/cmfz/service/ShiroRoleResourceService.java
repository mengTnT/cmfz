package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.ShiroRoleResource;

public interface ShiroRoleResourceService {
    int deleteByRoleName(String rolename);
    int insert(ShiroRoleResource record);
}

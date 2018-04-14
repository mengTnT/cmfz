package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.ShiroAmdinRole;

public interface ShiroAmdinRoleService {
    public int deleteShiroAmdinRoleByName(String username);
    public int insert(ShiroAmdinRole record);
}

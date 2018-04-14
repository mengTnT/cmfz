package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.ShiroRoleResource;
import com.baizhi.cmfz.entity.Tree;

import java.util.List;
import java.util.Map;

public interface RoleManagerService {
    public Map showRoleResourse(int page, int rows);
    public int insert(ShiroRoleResource record);
    public List<Tree> selectByRoleName(String rolename);


}

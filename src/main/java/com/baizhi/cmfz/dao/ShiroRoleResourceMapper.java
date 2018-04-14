package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.ShiroRoleResource;
import java.util.List;

public interface ShiroRoleResourceMapper {
    int deleteByPrimaryKey(Integer roleResid);
    int deleteByRoleName(String rolename);

    int insert(ShiroRoleResource record);

    ShiroRoleResource selectByPrimaryKey(Integer roleResid);

    List<ShiroRoleResource> selectAll();

    int updateByPrimaryKey(ShiroRoleResource record);
}
package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.ShiroAmdinRole;
import java.util.List;

public interface ShiroAmdinRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShiroAmdinRole record);

    ShiroAmdinRole selectByPrimaryKey(Integer id);

    List<ShiroAmdinRole> selectAll();

    int updateByPrimaryKey(ShiroAmdinRole record);

    public int deleteShiroAmdinRoleByName(String username);
}
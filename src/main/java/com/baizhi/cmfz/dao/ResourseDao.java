package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Resourse;
import com.baizhi.cmfz.entity.Tree;

import java.util.List;

public interface ResourseDao {
    public List<Tree> selectAll();
    public List<Tree> selectByRoleName(String rolename);

}

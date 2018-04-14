package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.ShiroRole;
import com.baizhi.cmfz.entity.ShowRoleResourseDTO;
import com.baizhi.cmfz.entity.Tree;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleManagerDao {
    public List<ShowRoleResourseDTO> showRoleResourse();
    public List<Tree> selcetParentResByShiroRoleName(@Param("roles")List<ShiroRole> roles);
    public List<Tree> selcetSonResByRoleName(@Param("roles") List<ShiroRole> roles, @Param("parentId")int parentId);
}

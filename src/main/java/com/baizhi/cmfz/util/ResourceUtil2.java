package com.baizhi.cmfz.util;

import com.baizhi.cmfz.dao.RoleManagerDao;
import com.baizhi.cmfz.entity.Tree;
import com.baizhi.cmfz.entity.ShiroRole;
import java.util.List;

public class ResourceUtil2 {
    // 封装资源数据

    /**
     *
     */
    public static List<Tree> getTree(List<ShiroRole> roles, RoleManagerDao roleDao){
        // 根据角色查询顶级资源
        List<Tree> pRes = roleDao.selcetParentResByShiroRoleName(roles);
        // 根据一级资源  查询子级资源
        for (Tree p:pRes) {
            selectSonTree(p,roles,roleDao);
        }

        for (Tree p:pRes) {
            System.out.println("顶级资源："+p);

            for (Tree s:p.getChildren()) {

                System.out.println("====="+s);

            }

        }
        return pRes;

    }

    /**
     * 不确定节点资源封装   复杂sql   sql的复用  不要手动维护（不确定节点资源）
     *
     */
    public static void selectSonTree(Tree t,List<ShiroRole> roles,RoleManagerDao roleDao){
        // 1. 根据父级id/角色名   查询子级资源
        List<Tree> sonRes = roleDao.selcetSonResByRoleName(roles,t.getId());
        // 2. 判断子级是否存在，存在 继续查询 将子级数据放入 父级对象中
        if(sonRes.size()>0 && sonRes !=null){
            t.setChildren(sonRes);
            for (Tree s:sonRes) {
                selectSonTree(s,roles,roleDao);
            }
        }

    }
}

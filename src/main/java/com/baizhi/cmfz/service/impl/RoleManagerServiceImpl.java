package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.ResourseDao;
import com.baizhi.cmfz.dao.RoleManagerDao;
import com.baizhi.cmfz.dao.ShiroRoleResourceMapper;
import com.baizhi.cmfz.entity.*;
import com.baizhi.cmfz.service.RoleManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class RoleManagerServiceImpl implements RoleManagerService {
    @Autowired
    private RoleManagerDao roleManagerDao;
    @Autowired
    private ShiroRoleResourceMapper shiroRoleResourceMapper;
    @Autowired
    private ResourseDao resourseDao;
    @Override
    public Map showRoleResourse(int page, int rows) {
        Map map = new HashMap();
        PageHelper.startPage(page, rows);
        List<ShowRoleResourseDTO> list = roleManagerDao.showRoleResourse();
        PageInfo<ShowRoleResourseDTO> pageInfo = new PageInfo<>(list);
        List<ShowRoleResourseDTO> list2 = pageInfo.getList();
       /* for (ShowRoleResourseDTO s:list2
             ) {
            List<Resourse> resourses = s.getList();
            System.out.println(resourses);
        }*/
        map.put("rows", list);
        map.put("total", list.size());
        return map;
    }

    @Override
    public int insert(ShiroRoleResource record) {
        return shiroRoleResourceMapper.insert(record);
    }

    @Override
    public List<Tree> selectByRoleName(String rolename) {
        return resourseDao.selectByRoleName(rolename);
    }


}

package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.ResourseDao;
import com.baizhi.cmfz.entity.Resourse;
import com.baizhi.cmfz.entity.Tree;
import com.baizhi.cmfz.service.ResourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourseServiceImpl implements ResourseService {
    @Autowired
    private ResourseDao resourseDao;

    @Override
    public List<Tree> selectAll() {
        return resourseDao.selectAll();
    }
}

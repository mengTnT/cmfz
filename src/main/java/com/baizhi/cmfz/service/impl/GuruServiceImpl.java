package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.GuruDao;
import com.baizhi.cmfz.entity.Guru;
import com.baizhi.cmfz.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GuruServiceImpl implements GuruService {
    @Autowired
    private GuruDao guruDao;
    @Override
    public List<Guru> getGuru() {
        return guruDao.getGuru();
    }
}

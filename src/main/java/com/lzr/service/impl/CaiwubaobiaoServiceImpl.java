package com.lzr.service.impl;

import com.lzr.dao.CaiwubaobiaoDao;
import com.lzr.service.CaiwubaobiaoService;
import com.lzr.vo.Caiwubaobiao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CaiwubaobiaoServiceImpl implements CaiwubaobiaoService {
    @Autowired
    CaiwubaobiaoDao caiwubaobiaoDao;
    @Override
    public List<Caiwubaobiao> Query(int cwstate, int time, String year) {
        List<Caiwubaobiao> list=caiwubaobiaoDao.Query(cwstate,time,year);
        return  list;
    }
}

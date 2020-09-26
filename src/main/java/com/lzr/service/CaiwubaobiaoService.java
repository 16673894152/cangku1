package com.lzr.service;

import com.lzr.vo.Caiwubaobiao;
import com.lzr.vo.PageVo;
import com.lzr.vo.UserInf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CaiwubaobiaoService {
    public List<Caiwubaobiao> Query(int cwstate, int time, String year);
}

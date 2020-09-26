package com.lzr.dao;

import com.lzr.vo.Caiwubaobiao;
import org.apache.ibatis.annotations.Param;

import java.sql.Array;
import java.util.List;

public interface CaiwubaobiaoDao {
    /**
     * 图形报表
     *
     * @param cwstate 支出或者收入状态
     * @param time    年或者月展示
     * @return
     */
    public List<Caiwubaobiao> Query(@Param("cwstate") int cwstate, @Param("time")int time ,@Param("year") String year);
}

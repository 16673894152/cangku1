package com.lzr.service.impl;

import com.github.pagehelper.PageHelper;
import com.lzr.dao.UserInfDao;
import com.lzr.service.UserInfService;
import com.lzr.vo.PageVo;
import com.lzr.vo.UserInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfServiceImpl implements UserInfService {
    @Autowired
    UserInfDao userInfDao;
    @Override
    public int addUserInf(UserInf userInf) {
        return userInfDao.addUserInf(userInf);
    }

    @Override
    public UserInf LoginUserInf(UserInf userInf) {
        return userInfDao.LoginUserInf(userInf);
    }

    @Override
    public int updateUserInf(UserInf userInf) {
        return userInfDao.updateUserInf(userInf);
    }

    @Override
    public int delUserInf(int id) {
        return  userInfDao.delUserInf(id);
    }

    @Override
    public List<UserInf> queryUserInfByUser1(UserInf userInf) {
        return userInfDao.queryUserInfByUser1(userInf);
    }

    @Override
    public PageVo<UserInf> queryUserInfByUser2(UserInf userInf, int page, int rows) {
        PageVo<UserInf> pageVo = new PageVo<>();

        //在需要分页的代码调用前 执行以下代码
        PageHelper.startPage(page, rows);
        //获取分页后 显示的数据集合
        pageVo.setRows(userInfDao.queryUserInfByUser1(userInf));
        //获取总的记录数量
        pageVo.setTotal(userInfDao.queryUserInfByUser2(userInf));

        return pageVo;
    }

    @Override
    public int queryUserInfByUser2(UserInf userInf) {
       return userInfDao.queryUserInfByUser2(userInf);
    }

    @Override
    public UserInf queryByid(int id) {
        return userInfDao.queryByid(id);
    }
}

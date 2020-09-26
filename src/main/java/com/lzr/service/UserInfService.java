package com.lzr.service;

import com.lzr.vo.PageVo;
import com.lzr.vo.UserInf;

import java.util.List;

public interface UserInfService {
    /**
     * 添加一个用户
     * @param userInf
     * @return
     */
    public int addUserInf(UserInf userInf);


    /**
     * 登用户
     * @param userInf
     * @return
     */
    public UserInf LoginUserInf(UserInf userInf);

    /**
     * 修改用户
     * @param userInf
     * @return
     */
    public int updateUserInf(UserInf userInf);

    /**
     * 通过用户id删除用户
     * @param id
     * @return
     */

    public int delUserInf(int id);

    /**
     * 根据用户信息查用户
     * @param userInf
     * @return
     */
    public List<UserInf> queryUserInfByUser1(UserInf userInf);
    public PageVo<UserInf> queryUserInfByUser2(UserInf userInf, int page, int rows) ;
    public int queryUserInfByUser2(UserInf userInf);
    /**
     * 根据ID查询用户
     * @param id
     * @return
     */

    public UserInf queryByid(int id);

}

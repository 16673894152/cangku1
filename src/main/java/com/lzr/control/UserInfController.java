package com.lzr.control;

import com.lzr.service.UserInfService;
import com.lzr.vo.PageVo;
import com.lzr.vo.UserInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userinf")
public class UserInfController {

    @Autowired
    UserInfService userInfService;

    @RequestMapping("/queryalluser1.action")
    @ResponseBody
    public List<UserInf> queryAll(@RequestParam String loginname, @RequestParam String username) {
        UserInf userInf = new UserInf();
        System.out.println("来了"+loginname+"username"+username);
        userInf.setLoginname(loginname);
        userInf.setUsername(username);
        List<UserInf> list = userInfService.queryUserInfByUser1(userInf);
        System.out.println("list"+list);
        return list;
    }
    @RequestMapping("/queryalluser.action")
    @ResponseBody
    public PageVo<UserInf> queryPersonbyCond2(UserInf userInf,
                                              @RequestParam(value = "page",defaultValue = "1") int page,
                                              @RequestParam(value = "rows",defaultValue = "5")int rows){
        return userInfService.queryUserInfByUser2(userInf,page,rows);
    }


    @RequestMapping("/loginuser.action")
    @ResponseBody
    public Map login(HttpServletRequest request, UserInf userInf) {
        Map<String, String> map = new HashMap<String, String>();
        UserInf user1=userInfService.LoginUserInf(userInf);
        if (user1 != null) {
            map.put("msg", ""+user1.getUsername()+"");
            map.put("code", "1");
        } else {
            map.put("msg", "登录失败");
            map.put("code", "0");
        }
        return map;
    }



    @RequestMapping("/deluser.action")
    @ResponseBody
    public int delUser(@RequestParam int id) {
        return userInfService.delUserInf(id);
    }

    @RequestMapping("/queryuserid.action")
    @ResponseBody
    public UserInf queryUser(@RequestParam int id) {
        return userInfService.queryByid(id);
    }

    @RequestMapping("/updateuser.action")
    @ResponseBody
    public int updateUser(@ModelAttribute UserInf userInf) {
        System.out.println(userInf);
        return userInfService.updateUserInf(userInf);
    }
    @RequestMapping("/adduser.action")
    @ResponseBody
    public Map<String,String> addUser(@ModelAttribute UserInf userInf) {
        Map<String, String> map = new HashMap<String, String>();
        int num=userInfService.addUserInf(userInf);
        if (num== 1) {
            map.put("msg", "注册成功");
            map.put("code", "1");
        } else {
            map.put("msg", "注册失败");
            map.put("code", "0");
        }
        return map;
    }
}
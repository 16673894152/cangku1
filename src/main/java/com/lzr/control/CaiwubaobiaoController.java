package com.lzr.control;

import com.lzr.service.CaiwubaobiaoService;
import com.lzr.service.UserInfService;
import com.lzr.vo.Caiwubaobiao;
import com.lzr.vo.PageVo;
import com.lzr.vo.UserInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/caiwu")
public class CaiwubaobiaoController {

    @Autowired
    CaiwubaobiaoService caiwubaobiaoService;

    @RequestMapping("/query1.action")
    @ResponseBody
    public List<Caiwubaobiao> queryAll1(@RequestParam int time, @RequestParam String year, @RequestParam int cwstate) {
        UserInf userInf = new UserInf();
        //支出
        List<Caiwubaobiao> list = caiwubaobiaoService.Query(cwstate, time, year);
        System.out.println(list+"收入");
        //收入
        return list;
    }
}
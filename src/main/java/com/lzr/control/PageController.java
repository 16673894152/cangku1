package com.lzr.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PageController {

    @RequestMapping("/page/{name}")
    public ModelAndView tiaozhuan2(@PathVariable  String name, HttpServletRequest request) {
        ModelAndView modelAndView
                =new ModelAndView();
        modelAndView.setViewName(name);
        modelAndView.addAllObjects(request.getParameterMap());
        return modelAndView;
    }
}
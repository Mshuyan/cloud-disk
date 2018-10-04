package cn.itcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/account")
public class Test {

    @RequestMapping("/test")
    @ResponseBody
    public String test(HttpServletResponse response){

        String str = "hello";

        return str;
    }
}

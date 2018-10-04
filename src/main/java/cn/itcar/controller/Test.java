package cn.itcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/account")
public class Test {

    @RequestMapping("/test")
    @ResponseBody
    public String test(HttpServletResponse response){

        return "hello";
    }
}

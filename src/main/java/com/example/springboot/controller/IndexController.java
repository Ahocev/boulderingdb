package com.example.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("index");

        response.addObject("message", "Hello World!");

        return response;
    }

    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView response = new ModelAndView("register");

        return response;
    }

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView response = new ModelAndView("login");

        return response;
    }


}

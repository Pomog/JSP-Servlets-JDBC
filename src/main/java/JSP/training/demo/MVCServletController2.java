package JSP.training.demo;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


@Controller
public class MVCServletController2 {
    @RequestMapping("/MVCServletController2")
    public ModelAndView doGet() {
        String [] names = {"Tom", "Jerry", "Donald"};
        ModelAndView modelAndView = new ModelAndView("MVCView2");
        modelAndView.addObject("names", names);
        return modelAndView;
    }
}
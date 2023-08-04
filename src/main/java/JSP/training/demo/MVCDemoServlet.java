package JSP.training.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MVCDemoServlet {
    @RequestMapping(value = {"/MVCDemoServlet"})
    public ModelAndView doGet() {
        List<Student> students = StudentDataUtil.getStudents();

        ModelAndView modelAndView = new ModelAndView("MVCDemoView");
        modelAndView.addObject("students", students);

        return modelAndView;
    }
}

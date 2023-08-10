package JSP.training.demo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ServletForTestConnectionPool {

    private final StudentRepository studentRepository;

    public ServletForTestConnectionPool(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @RequestMapping("/ServletForTestConnectionPool")
    public ModelAndView doGet() {
        Iterable<StudentEntity> studentEntities  = studentRepository.findAll();
       //Print out the studentEntities
        for (StudentEntity studentEntity : studentEntities) {
            System.out.println(studentEntity.getFirstName());
        }
        ModelAndView modelAndView = new ModelAndView("ServletForTestConnectionPool");
        modelAndView.addObject("students", studentEntities );
        return modelAndView;
    }
}

package JSP.training.demo;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.sql.DataSource;
import java.sql.SQLException;

@Controller
public class ServletForTestConnectionPool {

    private final DataSource dataSource;

    private final StudentRepository studentRepository;

    public ServletForTestConnectionPool(DataSource dataSource, StudentRepository studentRepository) {
        this.dataSource = dataSource;
        this.studentRepository = studentRepository;
    }

    @RequestMapping("/ServletForTestConnectionPool")
    public ModelAndView doGet() {
        Iterable<StudentEntity> studentEntities  = studentRepository.findAll();
       //Print out the studentEntities
        for (StudentEntity studentEntity : studentEntities) {
            System.out.println(studentEntity.getFirstName());
        }
        if (dataSource instanceof HikariDataSource) {
            System.out.println("Using HikariCP connection pool");
        } else {
            System.out.println("Not using HikariCP connection pool");
        }

        ModelAndView modelAndView = new ModelAndView("ServletForTestConnectionPool");
        modelAndView.addObject("students", studentEntities );
        return modelAndView;
    }
}

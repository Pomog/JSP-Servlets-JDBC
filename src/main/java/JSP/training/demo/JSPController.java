package JSP.training.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JSPController {

    @RequestMapping(value = {"/", "/index"})
    public String index() {
        return "index";
    }
}

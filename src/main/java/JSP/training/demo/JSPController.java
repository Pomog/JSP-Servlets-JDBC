package JSP.training.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JSPController {

    @RequestMapping(value = {"/", "/index"})
    public String index() {
        return "index";
    }

    @RequestMapping(value = {"exp1"})
    public String expressions() {
        return "expressions";
    }

    @RequestMapping(value = {"cookies"})
    public String cookies() {
        return "cookies";
    }

    @RequestMapping(value = {"i18n"})
    public String i18n() {
        return "i18n";
    }
}

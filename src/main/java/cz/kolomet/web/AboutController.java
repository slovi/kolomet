package cz.kolomet.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/about/**")
@Controller
public class AboutController extends AbstractController {

    @RequestMapping
    public ModelAndView index() {
    	Map<String, Object> model = new HashMap<String, Object>();
    	setDefaultModel(model);
        return new ModelAndView("about/index", model);
    }

}
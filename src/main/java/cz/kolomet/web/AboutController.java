package cz.kolomet.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/public/about/**")
@Controller
public class AboutController extends AbstractController {

    @RequestMapping
    public String index(Model model) {
        return "about/index";
    }

}
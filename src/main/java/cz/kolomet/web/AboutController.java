package cz.kolomet.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.web.pub.AbstractPublicController;

@RequestMapping("/public/about/**")
@Controller
public class AboutController extends AbstractPublicController {

    @RequestMapping
    public String index(Model model) {
        return "about/index";
    }

}
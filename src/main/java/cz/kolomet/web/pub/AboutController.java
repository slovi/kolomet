package cz.kolomet.web.pub;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/public/about/**")
@Controller
public class AboutController extends AbstractPublicController {

    @RequestMapping
    public String index(Model model) {
        return "public/about/index";
    }

}
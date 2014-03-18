package cz.kolomet.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cz.kolomet.repository.ProductRepository;

@RequestMapping("/")
@Controller
public class IntroController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView index() {
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	setDefaultModel(model);
    	model.put("products", productRepository.findByPriority());
        return new ModelAndView("intro/index", model);
    }
    
    @RequestMapping(value="intro/index", method=RequestMethod.GET)
    public ModelAndView introIndex() {
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	setDefaultModel(model);
    	model.put("products", productRepository.findByPriority());
        return new ModelAndView("intro/index", model);
    }
    
}

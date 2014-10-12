package cz.kolomet.web.pub;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;

@RequestMapping("/public")
@Controller
public class IntroController extends AbstractPublicController implements InitializingBean {
	
	private Integer productsSize = 9;
	
	private PageRequest pageRequest;
	
	@Autowired
	private ProductRepository productRepository;
	
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model) {
    	
    	model.addAttribute("products", productRepository.findByPriority(pageRequest));
        return "public/intro/index";
    }
    
    @RequestMapping(value="intro/index", method=RequestMethod.GET)
    public String introIndex(Model model) {
    	
    	model.addAttribute("products", productRepository.findByPriority(pageRequest));
        return "public/intro/index";
    }
    
    @Override
    public void afterPropertiesSet() throws Exception {
    	super.afterPropertiesSet();
    	this.pageRequest = new PageRequest(0, productsSize, ProductSpecifications.getDefaultSort());
    }
    
}
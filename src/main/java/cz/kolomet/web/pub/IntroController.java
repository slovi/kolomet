package cz.kolomet.web.pub;

import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Producer;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.service.ProducerService;

@RequestMapping("/public")
@Controller
public class IntroController extends AbstractPublicController implements InitializingBean {
	
	private Integer productsSize = 9;
	
	private PageRequest pageRequest;
	
	// TODO predelat na service a dto
	//@Autowired
	//private ProductService productService;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProducerService producerService;
	
	@ModelAttribute("pageTitleCode")
	public String getPageTitleCode() {
		return "page_store_intro_title";
	}
	
	@ModelAttribute("pageDescription")
	public String getPageDescription() {
		return "page_store_intro_description";
	}
	
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model) {
    	
		// TODO predelat na service a dto
    	model.addAttribute("products", productRepository.findByPriority(pageRequest));
    	
    	List<Producer> producers = producerService.findAllProducers();
    	StringBuilder builder = new StringBuilder();
    	for (Producer producer: producers) {
    		builder.append(",");
    		builder.append(producer.getCodeDescription());
    	}
    	model.addAttribute("pageKeywordsArgs", builder.toString());
        return "public/intro/index";
    }
    
    @RequestMapping(value="intro/index", method=RequestMethod.GET)
    public String introIndex(Model model) {
    	
		// TODO predelat na service a dto
    	model.addAttribute("products", productRepository.findByPriority(pageRequest));
    	
    	List<Producer> producers = producerService.findAllProducers();
    	StringBuilder builder = new StringBuilder();
    	for (Producer producer: producers) {
    		builder.append(",");
    		builder.append(producer.getCodeDescription());
    	}
    	model.addAttribute("pageKeywordsArgs", builder.toString());
    	
        return "public/intro/index";
    }
    
    @Override
    public void afterPropertiesSet() throws Exception {
    	super.afterPropertiesSet();
    	this.pageRequest = new PageRequest(0, productsSize, ProductSpecifications.getDefaultSort());
    }
    
}

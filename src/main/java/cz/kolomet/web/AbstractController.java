package cz.kolomet.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.ProducerRepository;

public class AbstractController {
	
	@Autowired
	private ProducerRepository producerRepository; 
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	private String defaultCategoryCodeKey = "cattype_bike"; // TODO nastavit jako property

	protected void setDefaultModel(Model model) {
		this.setDefaultModel(model, this.defaultCategoryCodeKey);
	}
	
	protected void setDefaultModel(Model model, String categoryTypeCodeKey) {
		model.addAttribute("categories", categoryRepository.find(StringUtils.isEmpty(categoryTypeCodeKey) ? defaultCategoryCodeKey : categoryTypeCodeKey));
		model.addAttribute("producers", producerRepository.findAll());
	}

}

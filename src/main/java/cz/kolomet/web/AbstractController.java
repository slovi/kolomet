package cz.kolomet.web;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.ProducerRepository;

public class AbstractController {
	
	@Autowired
	private ProducerRepository producerRepository; 
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	private String defaultCategoryCodeKey = "cattype.bike"; // TODO nastavit jako property

	protected void setDefaultModel(Map<String, Object> model) {
		this.setDefaultModel(model, this.defaultCategoryCodeKey);
	}
	
	protected void setDefaultModel(Map<String, Object> model, String categoryTypeCodeKey) {
		model.put("categories", categoryRepository.find(StringUtils.isEmpty(categoryTypeCodeKey) ? defaultCategoryCodeKey : categoryTypeCodeKey));
		model.put("producers", producerRepository.findAll());
	}

}

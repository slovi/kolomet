package cz.kolomet.domain;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.repository.BicycleCategoryRepository;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.FigureHeightRepository;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.repository.ProductAttributeTypeRepository;
import cz.kolomet.repository.ProductColorRepository;
import cz.kolomet.repository.ProductUsageRepository;
import cz.kolomet.repository.SellerRepository;

@Component
@Configurable
public class DomainEntityDataOnDemand {
	
	private Random rnd = new SecureRandom();
	
	private Map<Class<? extends DomainEntity>, JpaRepository<? extends DomainEntity, Long>> repositories = 
			new HashMap<Class<? extends DomainEntity>, JpaRepository<? extends DomainEntity,Long>>();
	
	private Map<Class<? extends DomainEntity>, List<? extends DomainEntity>> data = 
			new HashMap<Class<? extends DomainEntity>, List<? extends DomainEntity>>();

	@Autowired
	private BicycleCategoryRepository bicycleCategoryRepository;
	
	@Autowired
	private FigureHeightRepository figureHeightRepository;
	
	@Autowired
	private ProducerRepository producerRepository;
	
	@Autowired
	private ProductColorRepository productColorRepository;
	
	@Autowired
	private ProductUsageRepository productUsageRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private SellerRepository sellerRepository;
	
	@Autowired
	private ProductAttributeTypeRepository productAttributeTypeRepository;
	
	public List<? extends DomainEntity> getDomainEntites(Class<? extends DomainEntity> domainEntityClass) {
		init();
		return data.get(domainEntityClass);
	}
	
	@SuppressWarnings("unchecked")
	public <T extends DomainEntity> T getSpecificDomainEntity(Class<T> domainEntityClass, int index) {
		init();
		T codelist = (T) data.get(domainEntityClass).get(index);
		return (T) repositories.get(domainEntityClass).findOne(codelist.getId());
	}
	
	public <T extends DomainEntity> T getRandomDomainEntity(Class<T> domainEntityClass) {
		init();
		return getSpecificDomainEntity(domainEntityClass, rnd.nextInt(data.get(domainEntityClass).size()));
	}
	
	public void init() {
		if (repositories.isEmpty()) {
			repositories.put(BicycleCategory.class, bicycleCategoryRepository);
			data.put(BicycleCategory.class, bicycleCategoryRepository.findAll());
			repositories.put(FigureHeight.class, figureHeightRepository);
			data.put(FigureHeight.class, figureHeightRepository.findAll());
			repositories.put(Producer.class, producerRepository);
			data.put(Producer.class, producerRepository.findAll());
			repositories.put(ProductColor.class, productColorRepository);
			data.put(ProductColor.class, productColorRepository.findAll());
			repositories.put(ProductUsage.class, productUsageRepository);
			data.put(ProductUsage.class, productUsageRepository.findAll());
			repositories.put(Category.class, categoryRepository);
			data.put(Category.class, categoryRepository.findAll());
			repositories.put(Seller.class, sellerRepository);
			data.put(Seller.class, sellerRepository.findAll());
			repositories.put(ProductAttributeType.class, productAttributeTypeRepository);
			data.put(ProductAttributeType.class, productAttributeTypeRepository.findAll());
		}
	}
	
}

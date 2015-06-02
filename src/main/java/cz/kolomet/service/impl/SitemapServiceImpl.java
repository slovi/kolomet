package cz.kolomet.service.impl;

import java.io.File;
import java.net.MalformedURLException;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.redfin.sitemapgenerator.WebSitemapGenerator;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SimpleNameIdentifiable;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.repository.SellerRepository;
import cz.kolomet.repository.SellerSpecifications;
import cz.kolomet.service.SiteMapService;

@Service
@Transactional
public class SitemapServiceImpl implements SiteMapService {

	public static int DEFAULT_SIZE = 30;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private SellerRepository sellerRepository;
	
	@Value("${domain.dynamic}")
	private String domain;
	
	private int size = DEFAULT_SIZE;
	
	@Override	
	public void generateSitemap(File file) {
		
		logger.debug("Sitemap generator job started to: " + file.getAbsolutePath());

		WebSitemapGenerator wsg = createWebSiteGenerator(file);
		
		// generate products
		appendRepositoryDataToSiteMapGenerator(new PageResolver<Product>() {

			@Override
			public Page<Product> resolvePage(Pageable pageable) {
				return productRepository.findAll(ProductSpecifications.enabledProduct(), pageable);
			}
		}, "kolo", wsg);
		
		// generate places
		appendRepositoryDataToSiteMapGenerator(new PageResolver<Place>() {

			@Override
			public Page<Place> resolvePage(Pageable pageable) {
				return placeRepository.findAll(pageable);
			}
		}, "mista", wsg);
		
		// generate sellers
		appendRepositoryDataToSiteMapGenerator(new PageResolver<Seller>() {

			@Override
			public Page<Seller> resolvePage(Pageable pageable) {
				return sellerRepository.findAll(SellerSpecifications.enabledSeller(), pageable);
			}
		}, "prodejce", wsg);
		
		wsg.write();
		
		logger.debug("Sitemap generator successfully finished: " + file.getAbsolutePath());
	}

	private WebSitemapGenerator createWebSiteGenerator(File file) {
		try {
			return WebSitemapGenerator.builder(domain, file).build();
		} catch (MalformedURLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private <T extends SimpleNameIdentifiable> void appendRepositoryDataToSiteMapGenerator(
			PageResolver<T> pageResolver, String urlPath, WebSitemapGenerator wsg) {
		int i = 0;
		while (true) {
			Page<T> idenfifiablePage = pageResolver.resolvePage(new PageRequest(i, size));
			if (idenfifiablePage.hasContent()) {
				for (SimpleNameIdentifiable identifiable: idenfifiablePage.getContent()) {
					identifiable.simplifyName();
					addUrlToWebSitemapGenerator(urlPath, wsg, identifiable);
				}
				i++;
			} else {
				break;
			}
		}
	}

	private void addUrlToWebSitemapGenerator(String urlPath, WebSitemapGenerator wsg, SimpleNameIdentifiable identifiable) {
		try {
			wsg.addUrl(domain + urlPath + "/" + identifiable.getSimplifiedName());
		} catch (MalformedURLException e) {
			throw new RuntimeException(e);
		}
	}

	interface PageResolver<T> {
		Page<T> resolvePage(Pageable pageable);
	}
	
}
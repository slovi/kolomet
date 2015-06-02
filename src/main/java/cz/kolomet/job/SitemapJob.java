package cz.kolomet.job;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import cz.kolomet.service.SiteMapService;

@Component
public class SitemapJob implements ServletContextAware {
	
	private ServletContext servletContext;
	
	@Autowired
	private SiteMapService sitemapService;

	@Scheduled(cron = "${sitemap.cron}")
	public void geneateSitemap() {
		String sitemapPath = servletContext.getRealPath("/");
		File sitemapFile = new File(sitemapPath);
		sitemapService.generateSitemap(sitemapFile);
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}

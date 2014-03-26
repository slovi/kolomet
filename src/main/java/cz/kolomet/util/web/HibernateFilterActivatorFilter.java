package cz.kolomet.util.web;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Filter;
import org.hibernate.Session;
import org.springframework.orm.jpa.EntityManagerHolder;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.transaction.support.TransactionSynchronizationManager;

public class HibernateFilterActivatorFilter extends OpenEntityManagerInViewFilter {
	
	public static final String NEWS_ITEM_ENABLE_FILTER = "newsItemEnabledFilter";
	public static final String PRODUCT_ENABLED_FILTER = "productEnabledFilter";
	public static final String PRODUCERS_ENABLED_FILTER = "sellerEnabledFilter";

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		EntityManagerFactory emf = lookupEntityManagerFactory(request);
		if (TransactionSynchronizationManager.hasResource(emf)) {
			EntityManagerHolder emHolder = (EntityManagerHolder) TransactionSynchronizationManager.getResource(emf);
			EntityManager em = emHolder.getEntityManager();
			Session session = (Session) em.getDelegate();
			enableFilters(session);
			try {
				filterChain.doFilter(request, response);
			} finally {
				disableFilters(session);
			}
		} else {
			filterChain.doFilter(request, response);
		}
	
	}
	
	protected void enableFilters(Session session) {
		
		Filter newsItemFilter = session.enableFilter(NEWS_ITEM_ENABLE_FILTER);
		newsItemFilter.setParameter("enabled", true);
		
		Filter productsFilter = session.enableFilter(PRODUCT_ENABLED_FILTER);
		productsFilter.setParameter("enabled", true);
		
		Filter producersFilter = session.enableFilter(PRODUCERS_ENABLED_FILTER);
		producersFilter.setParameter("enabled", true);
	}

	protected void disableFilters(Session session) {
		session.disableFilter(NEWS_ITEM_ENABLE_FILTER);
		session.disableFilter(PRODUCT_ENABLED_FILTER);
		session.disableFilter(PRODUCERS_ENABLED_FILTER);
	}
	
}

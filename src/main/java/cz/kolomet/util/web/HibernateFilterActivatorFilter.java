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
	
	private String[] enabledFilters = {PRODUCT_ENABLED_FILTER, PRODUCERS_ENABLED_FILTER};

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
		
		for (String enabledFilter: enabledFilters) {
			Filter newsItemFilter = session.enableFilter(enabledFilter);
			newsItemFilter.setParameter("enabled", true);
		}
	}

	protected void disableFilters(Session session) {
		for (String enabledFilter: enabledFilters) {
			session.disableFilter(enabledFilter);
		}
	}
	
	public void setEnabledFilters(String filterNames) {
		this.enabledFilters = filterNames.split(", ");
	}
	
}

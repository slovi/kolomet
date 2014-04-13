package cz.kolomet.util.web;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

import cz.kolomet.security.ApplicationUserDetails;

public class HibernateFilterActivatorFilter extends OpenEntityManagerInViewFilter {
	
	public static final String NEWS_ITEM_ENABLE_FILTER = "newsItemEnabledFilter";
	public static final String PRODUCT_ENABLED_FILTER = "productEnabledFilter";
	public static final String PRODUCT_VALIDTO_FILTER = "productValidToFilter";
	public static final String SELLER_ENABLED_FILTER = "sellerEnabledFilter";
	public static final String SELLER_OWN_FILTER = "sellerOwnFilter";
	
	public static Map<String, FilterInfo<?>> filters = new HashMap<String, HibernateFilterActivatorFilter.FilterInfo<?>>();
	
	static {
		filters.put(NEWS_ITEM_ENABLE_FILTER, new EnabledFilterParamValueResolver());
		filters.put(PRODUCT_ENABLED_FILTER, new EnabledFilterParamValueResolver());
		filters.put(SELLER_ENABLED_FILTER, new EnabledFilterParamValueResolver());
		filters.put(PRODUCT_VALIDTO_FILTER, new ProductValidToValueResolver());
		filters.put(SELLER_OWN_FILTER, new SellerOwnValueResolver());
	}
	
	private String[] enabledFilters;

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
			FilterInfo<?> resolver = filters.get(enabledFilter);
			if (resolver.apply()) {
				Filter filter = session.enableFilter(enabledFilter);
				filter.setParameter(resolver.paramName(), resolver.paramValue());
			}
		}
	}

	protected void disableFilters(Session session) {
		for (String enabledFilter: enabledFilters) {
			FilterInfo<?> resolver = filters.get(enabledFilter);
			if (resolver.apply()) {
				session.disableFilter(enabledFilter);
			}
		}
	}
	
	public void setEnabledFilters(String filterNames) {
		this.enabledFilters = filterNames.split(",");
	}
	
	static interface FilterInfo<T> {
		Boolean apply();
		String paramName();
		T paramValue();
	}
	
	static class EnabledFilterParamValueResolver implements FilterInfo<Boolean> {

		@Override
		public Boolean apply() {
			return true;
		}
		
		@Override
		public String paramName() {
			return "enabled";
		}

		@Override
		public Boolean paramValue() {
			return true;
		}
		
	}
	
	static class SellerOwnValueResolver implements FilterInfo<Long> {

		@Override
		public Boolean apply() {
			return ApplicationUserDetails.getActualApplicationUserDetails().hasAuthority("per_products_own");
		}
		
		@Override
		public String paramName() {
			return "sellerId";
		}

		@Override
		public Long paramValue() {
			return ApplicationUserDetails.getActualApplicationUserDetails().getSellerId();
		}
		
	}
	
	static class ProductValidToValueResolver implements FilterInfo<Date> {
		
		@Override
		public Boolean apply() {
			return true;
		}
		
		@Override
		public String paramName() {
			return "actualDate";
		}
		
		@Override
		public Date paramValue() {
			return new Date();
		}		
		
	} 
	
}

package cz.kolomet.util.db;

import org.hibernate.Hibernate;
import org.hibernate.proxy.HibernateProxy;

public class OrmUtils {

	@SuppressWarnings("unchecked")
	public static <T> T deproxy(T entity) {
		if (entity == null) {
			return null;
		}

		if (entity instanceof HibernateProxy) {
			Hibernate.initialize(entity);
			entity = (T) ((HibernateProxy) entity).getHibernateLazyInitializer().getImplementation();
		}
		return entity;

	}
	
}

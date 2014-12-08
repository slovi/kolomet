package cz.kolomet.util.repository;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;

@NoRepositoryBean
public class CustomRepositoryFactoryBean<R extends JpaRepository<T, ID>, T, ID extends Serializable> extends
		JpaRepositoryFactoryBean<R, T, ID> {
	
	@Override
	protected RepositoryFactorySupport createRepositoryFactory(EntityManager entityManager) {
		return new CustomRepositoryFactory<T, ID>(entityManager);
	}
	
	private static class CustomRepositoryFactory<T, ID extends Serializable> extends JpaRepositoryFactory {

		private EntityManager entityManager;
		private final CustomCrudMethodMetadataPostProcessor lockModePostProcessor = CustomCrudMethodMetadataPostProcessor.INSTANCE;
		
		public CustomRepositoryFactory(EntityManager entityManager) {
			super(entityManager);
			this.entityManager = entityManager;
			addRepositoryProxyPostProcessor(lockModePostProcessor);
		}
		
		@Override
		@SuppressWarnings("unchecked")
		protected Object getTargetRepository(RepositoryMetadata metadata) {
			CustomRepositoryImpl<T, Serializable> repository = new CustomRepositoryImpl<T, Serializable>((Class<T>) metadata.getDomainType(), entityManager);
			repository.setRepositoryMethodMetadata(lockModePostProcessor.getLockMetadataProvider());
			return repository;
		}
		
		@Override
		protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
			return CustomRepository.class;
		}
		
	}
	
}

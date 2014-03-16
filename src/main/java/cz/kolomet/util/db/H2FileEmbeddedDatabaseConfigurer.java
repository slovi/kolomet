package cz.kolomet.util.db;

import java.sql.Driver;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.datasource.embedded.ConnectionProperties;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseConfigurer;

public class H2FileEmbeddedDatabaseConfigurer implements EmbeddedDatabaseConfigurer, InitializingBean {

	private Class<? extends Driver> driverClass;
	
	@Override
	public void configureConnectionProperties(ConnectionProperties properties, String databaseName) {
		properties.setDriverClass(this.driverClass);
		properties.setUrl(String.format("jdbc:h2:D:/apps/h2/db/%s;DB_CLOSE_DELAY=-1", databaseName));
		properties.setUsername("sa");
		properties.setPassword("");
	}

	@Override
	public void shutdown(DataSource dataSource, String databaseName) {
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public void afterPropertiesSet() throws Exception {
		this.driverClass = (Class<? extends Driver>) Class.forName("org.h2.Driver");		
	}

}

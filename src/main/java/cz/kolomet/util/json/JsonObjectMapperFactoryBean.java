package cz.kolomet.util.json;

import org.springframework.http.converter.json.Jackson2ObjectMapperFactoryBean;

public class JsonObjectMapperFactoryBean extends Jackson2ObjectMapperFactoryBean {
	
	@Override
	public void afterPropertiesSet() {
		super.afterPropertiesSet();
	}

}

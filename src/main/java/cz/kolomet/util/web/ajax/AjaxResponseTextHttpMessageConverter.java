package cz.kolomet.util.web.ajax;

import java.util.Collections;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

public class AjaxResponseTextHttpMessageConverter extends MappingJackson2HttpMessageConverter implements InitializingBean {

	private MediaType mediaType = MediaType.TEXT_PLAIN;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		setSupportedMediaTypes(Collections.singletonList(mediaType));
	}

}

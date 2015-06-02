package cz.kolomet.util.json;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;

import cz.kolomet.util.StringUtils;

public class JsonSerializerImpl implements JsonSerializer {
	
	private ObjectMapper mapper;
	
	@Override
	public <T> String toJson(T object) {
		try {
			return StringUtils.escapeJavaString(mapper.writeValueAsString(object));
		} catch (JsonProcessingException e) {
			throw new JsonException(e);
		}
	}
	
	public<T> String toJsonArray(Collection<T> collection) {
		try {
			return StringUtils.escapeJavaString(mapper.writeValueAsString(collection));
		} catch (JsonProcessingException e) {
			throw new JsonException(e);
		}
	}
	
	@Override
	public<T> String toJsonArray(Collection<T> collection, Set<String> fields) {
		
		SimpleBeanPropertyFilter filter = SimpleBeanPropertyFilter.filterOutAllExcept(fields);
    	FilterProvider provider = new SimpleFilterProvider().addFilter("by name", filter);
		try {
			return StringUtils.escapeJavaString(mapper.writer(provider).writeValueAsString(collection));
		} catch (JsonProcessingException e) {
			throw new JsonException(e);
		}
	}

	@Override
	public <T> String toJsonArray(Collection<T> collection, String[] fields) {
		Set<String> fieldsSet = new HashSet<String>();
    	Collections.addAll(fieldsSet, fields);
    	return toJsonArray(collection, fieldsSet); 
	}
	
	@Override
	public<T> T toObject(String jsonString, Class<T> clazz) {
		return toObject(new ByteArrayInputStream(jsonString.getBytes()), clazz);
	}
	
	@Override
	public<T> T toObject(InputStream input, Class<T> clazz) {
		try {
			return mapper.readValue(input, clazz);
		} catch (Exception e) {
			throw new JsonException(e);
		}
	}

	public ObjectMapper getMapper() {
		return mapper;
	}

	public void setMapper(ObjectMapper mapper) {
		this.mapper = mapper;
	}

}

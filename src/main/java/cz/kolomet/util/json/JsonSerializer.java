package cz.kolomet.util.json;

import java.io.InputStream;
import java.util.Collection;
import java.util.Set;

public interface JsonSerializer {
	
	public<T> String toJson(T object);
	
	public<T> String toJsonArray(Collection<T> collection);
	
	public<T> String toJsonArray(Collection<T> collection, String[] fields);
	
	public<T> String toJsonArray(Collection<T> collection, Set<String> fields);
	
	public<T> T toObject(String jsonString, Class<T> clazz);
	
	public<T> T toObject(InputStream input, Class<T> clazz);

}

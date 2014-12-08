package cz.kolomet.util.json;

import java.util.Collection;
import java.util.Set;

public interface JsonSerializer {
	
	public<T> String toJsonArray(Collection<T> collection);
	
	public<T> String toJsonArray(Collection<T> collection, String[] fields);
	
	public<T> String toJsonArray(Collection<T> collection, Set<String> fields);

}

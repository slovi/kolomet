package cz.kolomet.util.web;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.MethodParameter;
import org.springframework.data.web.SortHandlerMethodArgumentResolver;

public class PrefixedSortHandlerMethodArgumentResolver extends SortHandlerMethodArgumentResolver {
	
	private static final String DEFAULT_PREFIX = "";
	private static final String DEFAULT_PARAMETER = "sort";
	private static final String DEFAULT_QUALIFIER_DELIMITER = "_";

	private String sortParameter = DEFAULT_PARAMETER;
	private String prefix = DEFAULT_PREFIX;
	private String qualifierDelimiter = DEFAULT_QUALIFIER_DELIMITER;

	@Override
	protected String getSortParameter(MethodParameter parameter) {
		
		StringBuilder builder = new StringBuilder(prefix);

		if (parameter != null && parameter.hasParameterAnnotation(Qualifier.class)) {
			builder.append(parameter.getParameterAnnotation(Qualifier.class).value()).append(qualifierDelimiter);
		}

		return builder.append(sortParameter).toString();
	}

	public String getSortParameter() {
		return sortParameter;
	}

	public void setSortParameter(String sortParameter) {
		this.sortParameter = sortParameter;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getQualifierDelimiter() {
		return qualifierDelimiter;
	}

	public void setQualifierDelimiter(String qualifierDelimiter) {
		this.qualifierDelimiter = qualifierDelimiter;
	}
	
}

package cz.kolomet.util;

import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.TypeDescriptor;

public class OrmConversionServiceAdapter implements ConversionService {
	
	private ConversionService conversionService;

	@Override
	public boolean canConvert(Class<?> sourceType, Class<?> targetType) {
		Class<?> optimizedClass = optimizeClass(targetType);
		return conversionService.canConvert(sourceType, optimizedClass);
	}

	@Override
	public boolean canConvert(TypeDescriptor sourceType, TypeDescriptor targetType) {
		TypeDescriptor optimizedSourceDescriptor = optimizeTypeDescriptor(sourceType);
		TypeDescriptor optimizedTargetDescriptor = optimizeTypeDescriptor(targetType);
		return conversionService.canConvert(optimizedSourceDescriptor, optimizedTargetDescriptor);
	}

	@Override
	public <T> T convert(Object source, Class<T> targetType) {
		Class<T> optimizedClass = optimizeClass(targetType);
		return conversionService.convert(source, optimizedClass);
	}
	
	@Override
	public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
		TypeDescriptor optimizedSourceDescriptor = optimizeTypeDescriptor(sourceType);
		TypeDescriptor optimizedTargetDescriptor = optimizeTypeDescriptor(targetType);
		return conversionService.convert(source, optimizedSourceDescriptor, optimizedTargetDescriptor);
	}

	private TypeDescriptor optimizeTypeDescriptor(TypeDescriptor type) {
		if (isJavassistClass(type.getName())) {
			return TypeDescriptor.valueOf(optimizeClassName(type.getName()));
		} else {
			return type;
		}
	}
	
	private <T> Class<T> optimizeClass(Class<T> clazz) {
		if (isJavassistClass(clazz.getName())) {
			return optimizeClassName(clazz.getName());
		} else {
			return clazz;
		}
	}

	@SuppressWarnings("unchecked")
	private <T> Class<T> optimizeClassName(String className) {
		try {
			int index = className.indexOf('_');
			return (Class<T>) Class.forName(className.substring(0, index));
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	private boolean isJavassistClass(String className) {
		return className.contains("_$$_");
	}

	public ConversionService getConversionService() {
		return conversionService;
	}

	public void setConversionService(ConversionService conversionService) {
		this.conversionService = conversionService;
	}

}

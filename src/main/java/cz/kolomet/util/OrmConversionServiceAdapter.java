package cz.kolomet.util;

import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.TypeDescriptor;

public class OrmConversionServiceAdapter implements ConversionService {
	
	private ConversionService conversionService;

	@Override
	public boolean canConvert(Class<?> sourceType, Class<?> targetType) {
		return conversionService.canConvert(sourceType, targetType);
	}

	@Override
	public boolean canConvert(TypeDescriptor sourceType, TypeDescriptor targetType) {
		
		String className = targetType.getType().getName(); 
		if (className.contains("_javassist")) {
			int index = className.indexOf('_');
			try {
				TypeDescriptor convertedTargetType = TypeDescriptor.valueOf(Class.forName(className.substring(0, index)));
				return conversionService.canConvert(sourceType, convertedTargetType);
			} catch (ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
		} else {
			return conversionService.canConvert(sourceType, targetType);
		}
		
	}

	@Override
	public <T> T convert(Object source, Class<T> targetType) {
		return conversionService.convert(source, targetType);
	}

	@Override
	public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
		return conversionService.convert(source, sourceType, targetType);
	}

	public ConversionService getConversionService() {
		return conversionService;
	}

	public void setConversionService(ConversionService conversionService) {
		this.conversionService = conversionService;
	}

}

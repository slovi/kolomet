package cz.kolomet.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;

public class EnumDto {
	
	private final Enum<?> value;
	private final String messageCode;
	private final MessageSourceAccessor messageSourceAccessor;
	
	public EnumDto(Enum<?> value, MessageSource messageSource) {
		this(value, messageSource, createMessageCode(value));
	}
	
	public EnumDto(Enum<?> value, MessageSource messageSource, String messageCode) {
		this.value = value;
		this.messageCode = messageCode;
		this.messageSourceAccessor = new MessageSourceAccessor(messageSource);
	}
	
	public static List<EnumDto> createCollection(Enum<?>[] enumValues, MessageSource messageSource) {
		List<EnumDto> enumCollection = new ArrayList<EnumDto>();
		for (Enum<?> enumValue: enumValues) {
			enumCollection.add(new EnumDto(enumValue, messageSource, createMessageCode(enumValue)));
		}
		return enumCollection;
	}

	private static String createMessageCode(Enum<?> enumValue) {
		return "enum_" + enumValue.getClass().getSimpleName().toLowerCase() + "_" + enumValue.toString().toLowerCase();
	}
	
	public String getLabel() {
		return messageSourceAccessor.getMessage(getMessageCode());
	}
	
	public Enum<?> getValue() {
		return value;
	}
	public String getMessageCode() {
		return messageCode;
	}

}

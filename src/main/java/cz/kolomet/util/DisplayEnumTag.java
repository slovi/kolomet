package cz.kolomet.util;

import org.springframework.context.MessageSource;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import cz.kolomet.dto.EnumDto;

public class DisplayEnumTag extends RequestContextAwareTag {

	private Enum<?> enumValue;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		
		MessageSource messageSource = getRequestContext().getMessageSource();
		
		if (enumValue != null) {
		
			EnumDto enumDto = new EnumDto(enumValue, messageSource);
			pageContext.getOut().write(enumDto.getLabel());
		}
		
		return EVAL_BODY_INCLUDE;
	}

	public Enum<?> getEnumValue() {
		return enumValue;
	}

	public void setEnumValue(Enum<?> enumValue) {
		this.enumValue = enumValue;
	}

}

package cz.kolomet.util.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;

public class KolometAcceptHeaderLocaleResolver extends AcceptHeaderLocaleResolver {
	
	@Override
	public Locale resolveLocale(HttpServletRequest request) {
		Locale locale = super.resolveLocale(request);
		if (locale.getLanguage().equals("cs") && StringUtils.isEmpty(locale.getCountry())) {
			return new Locale("cs", "CZ");
		} else {
			return locale;
		}
	}

}

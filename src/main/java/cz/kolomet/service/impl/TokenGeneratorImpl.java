package cz.kolomet.service.impl;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import cz.kolomet.service.TokenGenerator;

@Service
public class TokenGeneratorImpl implements TokenGenerator {
	
	@Override
	public String generateToken(Object baseValue) {
		return RandomStringUtils.randomAlphanumeric(40);
	}

}

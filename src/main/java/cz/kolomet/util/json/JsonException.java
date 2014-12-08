package cz.kolomet.util.json;

import cz.kolomet.service.exception.ServiceExpcetion;

public class JsonException extends ServiceExpcetion {

	public JsonException(Exception cause) {
		super(cause.getMessage(), cause, "");
	}

}

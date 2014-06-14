package cz.kolomet.service.exception;

public class DefaultObjectDataReadException extends ServiceExpcetion {

	private final Object object;
	private final String data;
	
	public DefaultObjectDataReadException(Object object, String data, Exception e) {
		super("Cannot read default data " + data + " of object " + object, e, "exception_cannot_read_object_default_data");
		this.object = object;
		this.data = data;
	}

	public String getData() {
		return data;
	}
	
	public Object getObject() {
		return object;
	}
	
}
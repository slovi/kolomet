package cz.kolomet.service.exception;

public class EntityNotFoundException extends ServiceExpcetion implements Ignored {
	
	public EntityNotFoundException(Object argument) {
		this("Entity not found", "exception_entity_not_found", new Object[] {argument});
	}

	public EntityNotFoundException(String message, String code, Object[] arguments) {
		super(message, code, arguments);
	}

}

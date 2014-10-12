package cz.kolomet.util.db;

import org.hibernate.cfg.DefaultNamingStrategy;
import org.hibernate.internal.util.StringHelper;

public class StandardNamingStrategy extends DefaultNamingStrategy {

	@Override
	public String collectionTableName(String ownerEntity, String ownerEntityTable, String associatedEntity, 
				String associatedEntityTable, String propertyName) {
		return tableName(corporatify(collectionTableName(ownerEntity, ownerEntityTable, associatedEntity, associatedEntityTable, propertyName)));
	}
	
	@Override
	public String classToTableName(String className) {
		return tableName(corporatify(StringHelper.unqualify(className)));
	}
	
	@Override
	public String tableName(String tableName) {
		return tableName.toUpperCase();
	}

	@Override
	public String columnName(String columnName) {
		return columnName.toUpperCase();
	}

	@Override
	public String propertyToColumnName(String propertyName) {
		return columnName(corporatify(StringHelper.unqualify(propertyName)));
	}
	
	@Override
	public String joinKeyColumnName(String joinedColumn, String joinedTable) {
		return columnName(corporatify(joinedColumn + "_id"));
	}
	
	@Override
	public String foreignKeyColumnName(String propertyName, String propertyEntityName, String propertyTableName,
			String referencedColumnName) {
		String header = propertyName != null ? StringHelper.unqualify( propertyName ) : propertyTableName;
		return columnName(corporatify(header + "_id"));
	}

	private String corporatify(String name) {
		StringBuffer buf = new StringBuffer(name.replace('.', '_'));
		for (int i = 1; i < buf.length() - 1; i++) {
			if ('_' != buf.charAt(i - 1) && Character.isUpperCase(buf.charAt(i))
					&& !Character.isUpperCase(buf.charAt(i + 1))) {
				buf.insert(i++, '_');
			}
		}
		return buf.toString().toUpperCase();
	}

}

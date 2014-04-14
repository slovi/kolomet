package cz.kolomet.util;

import java.awt.Color;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.config.AbstractFactoryBean;

public class ColorFactoryBean extends AbstractFactoryBean<Color>{

	private String constant;
	
	static Map<String, Color> colors = new HashMap<String, Color>();
	
	{
		colors.put("green", Color.GREEN);
		colors.put("black", Color.BLACK);
	}
	
	@Override
	public Class<?> getObjectType() {
		return Color.class;
	}

	@Override
	protected Color createInstance() throws Exception {		
		return null;
	}

	public String getConstant() {
		return constant;
	}

	public void setConstant(String constant) {
		this.constant = constant;
	}

}

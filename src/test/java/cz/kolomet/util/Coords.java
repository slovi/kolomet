package cz.kolomet.util;

import org.junit.Test;

public class Coords {
	
	@Test
	public void moveCoords() {
		
		Integer[] coords = new Integer[] {
				348,217,342,207,325,202,314,191,316,185,314,176,325,170,327,167,327,161,335,170,342,162,358,154,369,151,388,160,394,165,383,176,382,191,377,199,370,198,367,206,359,209,358,208
		};
		
		int up = -3;
		int left = -6;
		
		if (coords.length % 2 != 0) {
			throw new IllegalArgumentException("coords have to be of even length");
		}
		
		String result = "";
		
		for (int i = 0; i < coords.length - 1; i=i+2) {
			result += coords[i] + up + ",";
			result += coords[i + 1] + left + ",";
		}
		
		System.out.println(result);
		
	}

}

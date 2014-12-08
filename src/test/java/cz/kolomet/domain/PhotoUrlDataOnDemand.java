package cz.kolomet.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

@Component
@Configurable
public class PhotoUrlDataOnDemand {
	
	public List<PhotoUrl> getNewTransientPhotoUrlList(Product product, int index) {
		List<PhotoUrl> photoUrls = new ArrayList<PhotoUrl>();
		for (int i = 0; i < 4; i++) {
			PhotoUrl photoUrl = new PhotoUrl();
			photoUrl.setContentType("image/jpeg");
			photoUrl.setFileName("name_" + i);
			photoUrl.setProduct(product);
			photoUrls.add(photoUrl);
		}
		return photoUrls;
	}

}

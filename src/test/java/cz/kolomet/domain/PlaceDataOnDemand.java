package cz.kolomet.domain;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.PlaceTypeDataOnDemand;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.service.PlaceService;

@Component
@Configurable
public class PlaceDataOnDemand {
	
	@Autowired
	private PlaceTypeDataOnDemand data;
	
	public void setPlaceType(Place obj, int index) {
        PlaceType placeType = data.getRandomPlaceType();
        obj.setPlaceType(placeType);
    }
	

	private Random rnd = new SecureRandom();

	private List<Place> data_;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;

	@Autowired
    PlaceTypeDataOnDemand placeTypeDataOnDemand;

	@Autowired
    PlaceService placeService;

	@Autowired
    PlaceRepository placeRepository;

	public Place getNewTransientPlace(int index) {
        Place obj = new Place();
        setBikeRoadNr(obj, index);
        setCreated(obj, index);
        setDescription(obj, index);
        setDescriptionLink(obj, index);
        setLastModified(obj, index);
        setName(obj, index);
        setNrOfRankings(obj, index);
        setPlaceType(obj, index);
        setQualityRanking(obj, index);
        setRegion(obj, index);
        return obj;
    }

	public void setAddressStreet(Address obj, int index) {
        String street = "street_" + index;
        obj.setStreet(street);
    }

	public void setAddressCity(Address obj, int index) {
        String city = "city_" + index;
        obj.setCity(city);
    }

	public void setAddressZipCode(Address obj, int index) {
        String zipCode = "zipCode_" + index;
        obj.setPostCode(zipCode);
    }

	public void setGpsLocationNorth(GpsLocation obj, int index) {
        Double north = new Integer(index).doubleValue();
        obj.setNorth(north);
    }

	public void setGpsLocationWest(GpsLocation obj, int index) {
        Double west = new Integer(index).doubleValue();
        obj.setWest(west);
    }

	public void setBikeRoadNr(Place obj, int index) {
        String bikeRoadNr = "bikeRoadNr_" + index;
        obj.setBikeRoadNr(bikeRoadNr);
    }

	public void setCreated(Place obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setDescription(Place obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }

	public void setDescriptionLink(Place obj, int index) {
        String descriptionLink = "descriptionLink_" + index;
        obj.setDescriptionLink(descriptionLink);
    }

	public void setLastModified(Place obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setName(Place obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }

	public void setNrOfRankings(Place obj, int index) {
        Integer nrOfRankings = 0;
        obj.setNrOfRankings(nrOfRankings);
    }

	public void setQualityRanking(Place obj, int index) {
        Double qualityRanking = 0d;
        obj.setQualityRanking(qualityRanking);
    }

	public void setRegion(Place obj, int index) {
        Region region = null;
        obj.setRegion(region);
    }

	public Place getSpecificPlace(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data_.size() - 1)) {
            index = data_.size() - 1;
        }
        Place obj = data_.get(index);
        Long id = obj.getId();
        return placeService.findPlace(id);
    }

	public Place getRandomPlace() {
        init();
        Place obj = data_.get(rnd.nextInt(data_.size()));
        Long id = obj.getId();
        return placeService.findPlace(id);
    }

	public boolean modifyPlace(Place obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data_ = placeService.findPlaceEntries(from, to);
        if (data_ == null) {
            throw new IllegalStateException("Find entries implementation for 'Place' illegally returned null");
        }
        if (!data_.isEmpty()) {
            return;
        }
        
        data_ = new ArrayList<Place>();
        for (int i = 0; i < 10; i++) {
            Place obj = getNewTransientPlace(i);
            try {
                placeService.savePlace(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            placeRepository.flush();
            data_.add(obj);
        }
    }
}

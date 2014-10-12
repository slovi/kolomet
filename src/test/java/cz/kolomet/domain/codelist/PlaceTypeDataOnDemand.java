package cz.kolomet.domain.codelist;
import cz.kolomet.domain.ApplicationUserDataOnDemand;
import cz.kolomet.domain.PlaceTypeColor;
import cz.kolomet.repository.PlaceTypeRepository;
import cz.kolomet.service.PlaceTypeService;
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

@Configurable
@Component
public class PlaceTypeDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<PlaceType> data;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;

	@Autowired
    PlaceTypeService placeTypeService;

	@Autowired
    PlaceTypeRepository placeTypeRepository;

	public PlaceType getNewTransientPlaceType(int index) {
        PlaceType obj = new PlaceType();
        setCodeDescription(obj, index);
        setCodeKey(obj, index);
        setCreated(obj, index);
        setLastModified(obj, index);
        setPlaceTypeColor(obj, index);
        setSequenceNr(obj, index);
        return obj;
    }

	public void setCodeDescription(PlaceType obj, int index) {
        String codeDescription = "codeDescription_" + index;
        if (codeDescription.length() > 100) {
            codeDescription = codeDescription.substring(0, 100);
        }
        obj.setCodeDescription(codeDescription);
    }

	public void setCodeKey(PlaceType obj, int index) {
        String codeKey = "codeKey_" + index;
        if (codeKey.length() > 20) {
            codeKey = codeKey.substring(0, 20);
        }
        obj.setCodeKey(codeKey);
    }

	public void setCreated(PlaceType obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setLastModified(PlaceType obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setPlaceTypeColor(PlaceType obj, int index) {
        PlaceTypeColor placeTypeColor = null;
        obj.setPlaceTypeColor(placeTypeColor);
    }

	public void setSequenceNr(PlaceType obj, int index) {
        Integer sequenceNr = 0;
        obj.setSequenceNr(sequenceNr);
    }

	public PlaceType getSpecificPlaceType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PlaceType obj = data.get(index);
        Long id = obj.getId();
        return placeTypeService.findPlaceType(id);
    }

	public PlaceType getRandomPlaceType() {
        init();
        PlaceType obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return placeTypeService.findPlaceType(id);
    }

	public boolean modifyPlaceType(PlaceType obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = placeTypeService.findPlaceTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PlaceType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PlaceType>();
        for (int i = 0; i < 10; i++) {
            PlaceType obj = getNewTransientPlaceType(i);
            try {
                placeTypeService.savePlaceType(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            placeTypeRepository.flush();
            data.add(obj);
        }
    }
}

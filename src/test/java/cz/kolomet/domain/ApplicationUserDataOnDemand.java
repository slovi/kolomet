package cz.kolomet.domain;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.service.ApplicationUserService;
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

@Component
@Configurable
public class ApplicationUserDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<ApplicationUser> data;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    ApplicationUserRepository applicationUserRepository;

	public ApplicationUser getNewTransientApplicationUser(int index) {
        ApplicationUser obj = new ApplicationUser();
        setConditionAgreement(obj, index);
        setConditionVersion(obj, index);
        setCreated(obj, index);
        setCreatedBy(obj, index);
        setEnabled(obj, index);
        setLastModified(obj, index);
        setLastModifiedBy(obj, index);
        setName(obj, index);
        setPassword(obj, index);
        setPhone(obj, index);
        setSurname(obj, index);
        setToken(obj, index);
        setUsername(obj, index);
        return obj;
    }

	public void setConditionAgreement(ApplicationUser obj, int index) {
        Date conditionAgreement = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setConditionAgreement(conditionAgreement);
    }

	public void setConditionVersion(ApplicationUser obj, int index) {
        String conditionVersion = "conditionVersion_" + index;
        obj.setConditionVersion(conditionVersion);
    }

	public void setCreated(ApplicationUser obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setCreatedBy(ApplicationUser obj, int index) {
        ApplicationUser createdBy = obj;
        obj.setCreatedBy(createdBy);
    }

	public void setEnabled(ApplicationUser obj, int index) {
        Boolean enabled = Boolean.TRUE;
        obj.setEnabled(enabled);
    }

	public void setLastModified(ApplicationUser obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setLastModifiedBy(ApplicationUser obj, int index) {
        ApplicationUser lastModifiedBy = obj;
        obj.setLastModifiedBy(lastModifiedBy);
    }

	public void setName(ApplicationUser obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }

	public void setPassword(ApplicationUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }

	public void setPhone(ApplicationUser obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }

	public void setSurname(ApplicationUser obj, int index) {
        String surname = "surname_" + index;
        obj.setSurname(surname);
    }

	public void setToken(ApplicationUser obj, int index) {
        String token = "token_" + index;
        obj.setToken(token);
    }

	public void setUsername(ApplicationUser obj, int index) {
        String username = "username_" + index;
        obj.setUsername(username);
    }

	public ApplicationUser getSpecificApplicationUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ApplicationUser obj = data.get(index);
        Long id = obj.getId();
        return applicationUserService.findApplicationUser(id);
    }

	public ApplicationUser getRandomApplicationUser() {
        init();
        ApplicationUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return applicationUserService.findApplicationUser(id);
    }

	public boolean modifyApplicationUser(ApplicationUser obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = applicationUserService.findApplicationUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ApplicationUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ApplicationUser>();
        for (int i = 0; i < 10; i++) {
            ApplicationUser obj = getNewTransientApplicationUser(i);
            try {
                applicationUserService.saveApplicationUser(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            applicationUserRepository.flush();
            data.add(obj);
        }
    }
}

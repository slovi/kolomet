package cz.kolomet.domain;
import cz.kolomet.repository.ApplicationPermissionRepository;
import cz.kolomet.service.ApplicationPermissionService;
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
public class ApplicationPermissionDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<ApplicationPermission> data;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;

	@Autowired
    ApplicationPermissionService applicationPermissionService;

	@Autowired
    ApplicationPermissionRepository applicationPermissionRepository;

	public ApplicationPermission getNewTransientApplicationPermission(int index) {
        ApplicationPermission obj = new ApplicationPermission();
        setCreated(obj, index);
        setLastModified(obj, index);
        setPermissionName(obj, index);
        return obj;
    }

	public void setCreated(ApplicationPermission obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setLastModified(ApplicationPermission obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setPermissionName(ApplicationPermission obj, int index) {
        String permissionName = "permissionName_" + index;
        obj.setPermissionName(permissionName);
    }

	public ApplicationPermission getSpecificApplicationPermission(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ApplicationPermission obj = data.get(index);
        Long id = obj.getId();
        return applicationPermissionService.findApplicationPermission(id);
    }

	public ApplicationPermission getRandomApplicationPermission() {
        init();
        ApplicationPermission obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return applicationPermissionService.findApplicationPermission(id);
    }

	public boolean modifyApplicationPermission(ApplicationPermission obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = applicationPermissionService.findApplicationPermissionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ApplicationPermission' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ApplicationPermission>();
        for (int i = 0; i < 10; i++) {
            ApplicationPermission obj = getNewTransientApplicationPermission(i);
            try {
                applicationPermissionService.saveApplicationPermission(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            applicationPermissionRepository.flush();
            data.add(obj);
        }
    }
}

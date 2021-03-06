package cz.kolomet.domain;
import cz.kolomet.repository.ApplicationRoleRepository;
import cz.kolomet.service.ApplicationRoleService;
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
public class ApplicationRoleDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<ApplicationRole> data;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;

	@Autowired
    ApplicationRoleService applicationRoleService;

	@Autowired
    ApplicationRoleRepository applicationRoleRepository;

	public ApplicationRole getNewTransientApplicationRole(int index) {
        ApplicationRole obj = new ApplicationRole();
        setCreated(obj, index);
        setLastModified(obj, index);
        setRoleName(obj, index);
        return obj;
    }

	public void setCreated(ApplicationRole obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setLastModified(ApplicationRole obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setRoleName(ApplicationRole obj, int index) {
        String roleName = "roleName_" + index;
        obj.setRoleName(roleName);
    }

	public ApplicationRole getSpecificApplicationRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ApplicationRole obj = data.get(index);
        Long id = obj.getId();
        return applicationRoleService.findApplicationRole(id);
    }

	public ApplicationRole getRandomApplicationRole() {
        init();
        ApplicationRole obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return applicationRoleService.findApplicationRole(id);
    }

	public boolean modifyApplicationRole(ApplicationRole obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = applicationRoleService.findApplicationRoleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ApplicationRole' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ApplicationRole>();
        for (int i = 0; i < 10; i++) {
            ApplicationRole obj = getNewTransientApplicationRole(i);
            try {
                applicationRoleService.saveApplicationRole(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            applicationRoleRepository.flush();
            data.add(obj);
        }
    }
}

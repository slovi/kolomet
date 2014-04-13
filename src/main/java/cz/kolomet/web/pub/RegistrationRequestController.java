package cz.kolomet.web.pub;

import javax.persistence.EntityNotFoundException;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.web.AbstractController;

@RequestMapping("/public/registrationrequests")
@Controller("publicRegistrationRequestController")
@RooWebScaffold(path = "public/registrationrequests", formBackingObject = RegistrationRequest.class, update = false, delete = false)
public class RegistrationRequestController extends AbstractController {
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "public/registrationrequests/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        throw new EntityNotFoundException();
    }
	
}

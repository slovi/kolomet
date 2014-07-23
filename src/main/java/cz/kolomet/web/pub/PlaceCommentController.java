package cz.kolomet.web.pub;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.PlaceComment;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlaceService;

@RequestMapping("/public/placecomments")
@Controller
@RooWebScaffold(path = "public/placecomments", formBackingObject = PlaceComment.class)
public class PlaceCommentController {
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "parentEntityId", required = true) Long placeId, Model uiModel) {
    	uiModel.addAttribute("place", placeId);
        populateEditForm(uiModel, new PlaceComment());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (placeService.countAllPlaces() == 0) {
            dependencies.add(new String[] { "place", "admin/places" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "public/placecomments/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PlaceComment placeComment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeComment);
            return "public/placecomments/create";
        }
        uiModel.asMap().clear();
        placeCommentService.savePlaceComment(placeComment);
        return "redirect:/public/places/" + placeComment.getPlace().getId();
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PlaceComment placeComment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeComment);
            return "public/placecomments/update";
        }
        uiModel.asMap().clear();
        placeCommentService.updatePlaceComment(placeComment);
        return "redirect:/public/places/" + placeComment.getPlace().getId();
    }
    
    void populateEditForm(Model uiModel, PlaceComment placeComment) {
        uiModel.addAttribute("placeComment", placeComment);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("places", placeService.findAllPlaces());
        if (!uiModel.containsAttribute("place")) {
        	uiModel.addAttribute("place", placeComment.getPlace());
        }
    }

    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        Page<PlaceComment> page = placeCommentService.findPlaceCommentEntries(pageable);
        uiModel.addAttribute("placecomments", page.getContent());
        uiModel.addAttribute("maxPages", page.getTotalPages());
        addDateTimeFormatPatterns(uiModel);
        return "public/placecomments/list";
    }
    
    @RequestMapping(params = "placeId")
    public String list(@RequestParam(required = true, value = "placeId") Long placeId, Pageable pageable, Model uiModel) {
        Page<PlaceComment> page = placeCommentService.findPlaceCommentEntriesByPlace(placeId, pageable);
        uiModel.addAttribute("placecomments", page.getContent());
        uiModel.addAttribute("maxPages", page.getTotalPages());
        addDateTimeFormatPatterns(uiModel);
        return "public/placecomments/list";
    }
	
}

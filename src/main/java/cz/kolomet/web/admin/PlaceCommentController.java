package cz.kolomet.web.admin;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.PlaceComment;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlaceCommentService;
import cz.kolomet.service.PlaceService;
import cz.kolomet.web.pub.AbstractPublicController;

@RequestMapping("/admin/placecomments")
@Controller
public class PlaceCommentController extends AbstractPublicController {
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "parentEntityId", required = true) Long placeId, Model uiModel) {
    	uiModel.addAttribute("placeId", placeId);
        populateEditForm(uiModel, new PlaceComment());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (placeService.countAllPlaces() == 0) {
            dependencies.add(new String[] { "place", "admin/places" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/placecomments/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PlaceComment placeComment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeComment);
            return "admin/placecomments/create";
        }
        uiModel.asMap().clear();
        placeCommentService.savePlaceComment(placeComment);
        return "redirect:public/places/" + placeComment.getPlace().getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@RequestParam(value = "parentEntityId", required = true) Long placeId, @PathVariable("id") Long id, Model uiModel) {
    	uiModel.addAttribute("placeId", placeId);
    	populateEditForm(uiModel, placeCommentService.findPlaceComment(id));
    	return "admin/placecomments/update";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PlaceComment placeComment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeComment);
            return "admin/placecomments/update";
        }
        uiModel.asMap().clear();
        placeCommentService.updatePlaceComment(placeComment);
        return "redirect:public/places/" + placeComment.getPlace().getId();
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
        return "admin/placecomments/list";
    }
    
    @RequestMapping(params = "placeId")
    public String list(@RequestParam(required = true, value = "placeId") Long placeId, Pageable pageable, Model uiModel) {
        Page<PlaceComment> page = placeCommentService.findPlaceCommentEntriesByPlace(placeId, pageable);
        uiModel.addAttribute("placecomments", page.getContent());
        uiModel.addAttribute("maxPages", page.getTotalPages());
        addDateTimeFormatPatterns(uiModel);
        return "admin/placecomments/list";
    }
	

	@Autowired
    PlaceCommentService placeCommentService;

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("placecomment", placeCommentService.findPlaceComment(id));
        uiModel.addAttribute("itemId", id);
        return "admin/placecomments/show";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PlaceComment placeComment = placeCommentService.findPlaceComment(id);
        placeCommentService.deletePlaceComment(placeComment);
        uiModel.asMap().clear();
        return "redirect:public/places/" + placeComment.getId();
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("placeComment_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("placeComment_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}

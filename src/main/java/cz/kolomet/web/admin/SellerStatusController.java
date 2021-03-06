package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.SellerStatusService;

@RequestMapping("/admin/sellerstatuses")
@Controller
public class SellerStatusController extends AbstractAdminController {

	@Autowired
    SellerStatusService sellerStatusService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SellerStatus sellerStatus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerStatus);
            return "admin/sellerstatuses/create";
        }
        uiModel.asMap().clear();
        sellerStatusService.saveSellerStatus(sellerStatus);
        return "redirect:/admin/sellerstatuses/" + encodeUrlPathSegment(sellerStatus.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new SellerStatus());
        return "admin/sellerstatuses/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sellerstatus", sellerStatusService.findSellerStatus(id));
        uiModel.addAttribute("itemId", id);
        return "admin/sellerstatuses/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sellerstatuses", sellerStatusService.findSellerStatusEntries(firstResult, sizeNo));
            float nrOfPages = (float) sellerStatusService.countAllSellerStatuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sellerstatuses", sellerStatusService.findAllSellerStatuses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/sellerstatuses/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SellerStatus sellerStatus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerStatus);
            return "admin/sellerstatuses/update";
        }
        uiModel.asMap().clear();
        sellerStatusService.updateSellerStatus(sellerStatus);
        return "redirect:/admin/sellerstatuses/" + encodeUrlPathSegment(sellerStatus.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, sellerStatusService.findSellerStatus(id));
        return "admin/sellerstatuses/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SellerStatus sellerStatus = sellerStatusService.findSellerStatus(id);
        sellerStatusService.deleteSellerStatus(sellerStatus);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/sellerstatuses";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("sellerStatus_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("sellerStatus_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, SellerStatus sellerStatus) {
        uiModel.addAttribute("sellerStatus", sellerStatus);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
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

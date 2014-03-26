// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.web.admin.PhotoUrlController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PhotoUrlController_Roo_Controller {
    
    @Autowired
    PhotoUrlService PhotoUrlController.photoUrlService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PhotoUrlController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("photourl", photoUrlService.findPhotoUrl(id));
        uiModel.addAttribute("itemId", id);
        return "photourls/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PhotoUrlController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("photourls", photoUrlService.findPhotoUrlEntries(firstResult, sizeNo));
            float nrOfPages = (float) photoUrlService.countAllPhotoUrls() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("photourls", photoUrlService.findAllPhotoUrls());
        }
        return "photourls/list";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PhotoUrlController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PhotoUrl photoUrl = photoUrlService.findPhotoUrl(id);
        photoUrlService.deletePhotoUrl(photoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/photourls";
    }
    
    void PhotoUrlController.populateEditForm(Model uiModel, PhotoUrl photoUrl) {
        uiModel.addAttribute("photoUrl", photoUrl);
        uiModel.addAttribute("products", productService.findAllProducts());
    }
    
    String PhotoUrlController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

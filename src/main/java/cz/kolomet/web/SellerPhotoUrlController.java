package cz.kolomet.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.SellerService;

@RequestMapping("/sellerphotourls")
@Controller
@RooWebScaffold(path = "sellerphotourls", formBackingObject = SellerPhotoUrl.class)
public class SellerPhotoUrlController {
	
	@Value("${seller.img.rootdir}")
	private String rootDir;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private Validator validator;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Seller seller = parentEntityId != null ? sellerService.findSeller(parentEntityId) : null;
        populateEditForm(uiModel, new SellerPhotoUrl(), seller);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (sellerService.countAllSellers() == 0) {
            dependencies.add(new String[] { "seller", "sellers" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "sellerphotourls/create";
    }
	
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Seller seller = parentEntityId != null ? sellerService.findSeller(parentEntityId) : null;
        populateEditForm(uiModel, sellerPhotoUrlService.findSellerPhotoUrl(id), seller);
        return "sellerphotourls/update";
    }
    
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(SellerPhotoUrl sellerPhotoUrl, BindingResult bindingResult, Model uiModel, @RequestParam("content") CommonsMultipartFile content, HttpServletRequest httpServletRequest) {
        
        File dest = getDestFile(sellerPhotoUrl, content);
		try {
			content.transferTo(dest);
			sellerPhotoUrl.setFileName(dest.getName());
			sellerPhotoUrl.setContentType(content.getContentType());
			validator.validate(sellerPhotoUrl, bindingResult);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerPhotoUrl, null);
            return "sellerphotourls/create";
        }
        uiModel.asMap().clear();
        sellerPhotoUrlService.saveSellerPhotoUrl(sellerPhotoUrl, dest, new File(rootDir, sellerPhotoUrl.getSeller().getId().toString()));
        return "redirect:/sellers/" + encodeUrlPathSegment(sellerPhotoUrl.getSeller().getId().toString(), httpServletRequest);
    }
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SellerPhotoUrl sellerPhotoUrl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerPhotoUrl, null);
            return "sellerphotourls/update";
        }
        uiModel.asMap().clear();
        sellerPhotoUrlService.updateSellerPhotoUrl(sellerPhotoUrl);
        return "redirect:/sellers/" + encodeUrlPathSegment(sellerPhotoUrl.getSeller().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SellerPhotoUrl sellerPhotoUrl = sellerPhotoUrlService.findSellerPhotoUrl(id);
        sellerPhotoUrlService.deleteSellerPhotoUrl(sellerPhotoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sellers/" + sellerPhotoUrl.getSeller().getId();
    }
    
    void populateEditForm(Model uiModel, SellerPhotoUrl sellerPhotoUrl, Seller seller) {
    	if (seller != null) {
			sellerPhotoUrl.setSeller(seller);
		}
        uiModel.addAttribute("sellerPhotoUrl", sellerPhotoUrl);
        uiModel.addAttribute("sellers", sellerService.findAllSellers());
    }
    
    private File getDestFile(SellerPhotoUrl sellerPhotoUrl, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + sellerPhotoUrl.getSeller().getId());
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}
    
}

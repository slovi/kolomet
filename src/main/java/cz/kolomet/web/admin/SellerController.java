package cz.kolomet.web.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSourceAware;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.ApplicationUserAddress;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.dto.FileInfo;
import cz.kolomet.dto.SellerDto;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.SellerStatusService;
import cz.kolomet.service.exception.ExistingUserException;
import cz.kolomet.service.exception.ServiceExpcetion;
import flexjson.JSONSerializer;

@RequestMapping("/admin/sellers")
@Controllerpublic class SellerController extends AbstractAdminController implements MessageSourceAware {
	
	@Autowired
	private SellerStatusService sellerStatusService;
	
	@Autowired
	private SellerPhotoUrlService sellerPhotoUrlService;

	@Autowired
    SellerService sellerService;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    ProductService productService;

	@Autowired
    CountryStateService countryStateService;

	@Autowired
    RegionService regionService;

	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "redirect:/public/sellers/detail/" + id;
    }
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	
    	SellerDto sellerDto = new SellerDto();
    	sellerDto.setSellerStatus(sellerStatusService.findSellerStatus("sellst_ord"));
    	
        populateEditForm(uiModel, sellerDto);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "admin/countrystates" });
        }
        if (regionService.countAllRegions() == 0) {
            dependencies.add(new String[] { "region", "admin/regions" });
        }
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "admin/countrystates" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/sellers/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid SellerDto sellerDto, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerDto);
            return "admin/sellers/create";
        }
        try {
        	Seller seller = new Seller();
        	convert(sellerDto, seller);
        	
        	// improve the order dependency of this two method calls
        	savePhotos(seller, sellerPhotoUrlService, httpServletRequest.getSession().getId(), seller.getFileInfos());
        	sellerService.saveSeller(seller);
        	uiModel.asMap().clear();
        	return "redirect:/public/sellers/detail/" + seller.getId();
        } catch (ServiceExpcetion e) {
        	bindingResult.rejectValue("addressEmail", e.getCode(), e.getArguments(), null);
        	populateEditForm(uiModel, sellerDto);
        	return "admin/sellers/create";
        } catch (MailException e) {
			bindingResult.rejectValue("addressEmail", "exception_cannot_send_email_to_address");
        	populateEditForm(uiModel, sellerDto);
        	return "admin/sellers/create";
        }
    }
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid SellerDto sellerDto, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {

    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerDto);
            return "admin/sellers/update";
        }                     
    	Seller seller = sellerService.findSeller(sellerDto.getId());
    	convert(sellerDto, seller);
        try {
        	
        	// improve the order dependency of this two method calls        	
        	savePhotos(seller, sellerPhotoUrlService, httpServletRequest.getSession().getId());
        	sellerService.updateSeller(seller);
        	uiModel.asMap().clear();
        	return "redirect:/public/sellers/detail/" + seller.getId();
        } catch (ExistingUserException e) {
        	bindingResult.rejectValue("addressEmail", e.getCode(), new Object[] {e.getApplicationUser().getUsername()}, null);
        	populateEditForm(uiModel, sellerDto);
        	return "admin/sellers/update";
        } catch (MailException e) {
			bindingResult.rejectValue("addressEmail", "exception_cannot_send_email_to_address");
        	populateEditForm(uiModel, sellerDto);
        	return "admin/sellers/update";
        }
    }
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
    	if (getActualUserDetails().isSellersAll()) {
    		if (pageable != null) {
            	Page<Seller> page = sellerService.findSellerEntries(pageable);
                uiModel.addAttribute("sellers", page.getContent());
                uiModel.addAttribute("maxPages", page.getTotalPages());
            } else {
            	uiModel.addAttribute("sellers", sellerService.findAllSellers());
            }
        } else {
        	uiModel.addAttribute("sellers", Arrays.asList(new Seller[] {sellerService.findSeller(getActualUserDetails().getSellerId())}));
        }
        return "admin/sellers/list";
    }
    
    @RequestMapping(value = "/{id}", params = {"erase"}, method = RequestMethod.DELETE, produces = "text/html")
    public String erase(@PathVariable("id") Long id, Model uiModel) {
        Seller seller = sellerService.findSeller(id);
        sellerService.eraseSeller(seller);
        return "redirect:/admin/sellers";
    }
    
    void populateEditForm(Model uiModel, SellerDto sellerDto) {
        
    	uiModel.addAttribute("sellerDto", sellerDto);
        uiModel.addAttribute("countrystates", countryStateService.findAllCountryStates());
        uiModel.addAttribute("regions", regionService.findAllRegions());
        uiModel.addAttribute("sellerstatuses", sellerStatusService.findAllSellerStatuses());
        uiModel.addAttribute("addedFiles", new JSONSerializer().serialize(sellerDto.getFileInfos()));
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
		
		Seller seller = sellerService.findSeller(id);
		SellerDto sellerDto = new SellerDto();
		convert(seller, sellerDto);
        populateEditForm(uiModel, sellerDto);
        return "admin/sellers/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Seller seller = sellerService.findSeller(id);
        sellerService.deleteSeller(seller);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/sellers";
    }

	private void convert(SellerDto sellerDto, Seller seller) {
		
		seller.setSellerName(sellerDto.getSellerName());
		seller.setSellerTitle(sellerDto.getSellerTitle());
		seller.setSellerDescription(sellerDto.getSellerDescription());
		seller.setSellerStatus(sellerDto.getSellerStatus());
		seller.setWeb(sellerDto.getWeb());
		seller.setSaleType(sellerDto.getSaleType());
		seller.setRegion(sellerDto.getRegion());
		seller.setMapUrl(sellerDto.getMapUrl());
		seller.setPersonDegree(sellerDto.getPersonDegree());
		seller.setPersonName(sellerDto.getPersonName());
		seller.setPersonSalutation(sellerDto.getPersonSalutation());
		seller.setPersonSurname(sellerDto.getPersonSurname());
		
        if (getActualUserDetails().isSellersOwn()) {
        	seller.setSellerStatus(sellerDto.getSellerStatus());
        	seller.setEnabled(sellerDto.getEnabled());
        }
		
		ApplicationUserAddress address = seller.getCorrespondenceAddress();
		address.setCity(sellerDto.getAddressCity());
		address.setCountryState(sellerDto.getAddressCountry());
		address.setDegree(sellerDto.getAddressDegree());
		address.setEmail(sellerDto.getAddressEmail());
		address.setName(sellerDto.getAddressName());
		address.setPostCode(sellerDto.getAddressPostCode());
		address.setSalutation(sellerDto.getAddressSalutation());
		address.setStreet(sellerDto.getAddressStreet());
		
		ApplicationUserAddress businessAddress = seller.getBusinessAddress();
		businessAddress.setCity(sellerDto.getBusinessCity());
		businessAddress.setCountryState(sellerDto.getBusinessCountry());
		businessAddress.setDegree(sellerDto.getBusinessDegree());
		businessAddress.setEmail(sellerDto.getBusinessEmail());
		businessAddress.setName(sellerDto.getBusinessName());
		businessAddress.setPhoneNumber(sellerDto.getBusinessPhoneNumber());
		businessAddress.setPostCode(sellerDto.getBusinessPostCode());
		businessAddress.setSalutation(sellerDto.getBusinessSalutation());
		businessAddress.setStreet(sellerDto.getBusinessStreet());
		
		for (FileInfo fileInfo: sellerDto.getFileInfos()) {
			if (fileInfo.isNew()) {
				seller.addPhoto(fileInfo.getFileName(), fileInfo.getContentType());
			}
		}
	}
	
	private void convert(Seller seller, SellerDto sellerDto) {
		
		sellerDto.setId(seller.getId());
		sellerDto.setSellerName(seller.getSellerName());
		sellerDto.setSellerTitle(seller.getSellerTitle());
		sellerDto.setSellerDescription(seller.getSellerDescription());
		sellerDto.setSellerStatus(seller.getSellerStatus());
		sellerDto.setEnabled(seller.getEnabled());
		sellerDto.setWeb(seller.getWeb());
		sellerDto.setSaleType(seller.getSaleType());
		sellerDto.setRegion(seller.getRegion());
		sellerDto.setMapUrl(seller.getMapUrl());
		sellerDto.setPersonDegree(seller.getPersonDegree());
		sellerDto.setPersonName(seller.getPersonName());
		sellerDto.setPersonSalutation(seller.getPersonSalutation());
		sellerDto.setPersonSurname(seller.getPersonSurname());
		
		ApplicationUserAddress address = seller.getCorrespondenceAddress();
		sellerDto.setAddressCity(address.getCity());
		sellerDto.setAddressCountry(address.getCountryState());
		sellerDto.setAddressDegree(address.getDegree());
		sellerDto.setAddressEmail(address.getEmail());
		sellerDto.setAddressName(address.getName());
		sellerDto.setAddressPostCode(address.getPostCode());
		sellerDto.setAddressSalutation(address.getSalutation());
		sellerDto.setAddressStreet(address.getStreet());
		
		ApplicationUserAddress businessAddress = seller.getBusinessAddress();
		sellerDto.setBusinessCity(businessAddress.getCity());
		sellerDto.setBusinessCountry(businessAddress.getCountryState());
		sellerDto.setBusinessDegree(businessAddress.getDegree());
		sellerDto.setBusinessEmail(businessAddress.getEmail());
		sellerDto.setBusinessName(businessAddress.getName());
		sellerDto.setBusinessPhoneNumber(businessAddress.getPhoneNumber());
		sellerDto.setBusinessPostCode(businessAddress.getPostCode());
		sellerDto.setBusinessSalutation(businessAddress.getSalutation());
		sellerDto.setBusinessStreet(businessAddress.getStreet());
		
		for (SellerPhotoUrl photoUrl: seller.getSellerPhotoUrls()) {
			sellerDto.addFileInfo(new FileInfo(photoUrl.getId(), photoUrl.getFileName(), photoUrl.getContentType()));
		}
		
	}
	
}

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.service.NewsItemPhotoUrlService;
import cz.kolomet.service.NewsItemService;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/newsitemphotourls")
@Controller
@RooWebScaffold(path = "admin/newsitemphotourls", formBackingObject = NewsItemPhotoUrl.class)
public class NewsItemPhotoUrlController extends AbstractAdminController {
	
	@Value("${seller.img.rootdir}")
	private String rootDir;
	
	@Autowired
	private NewsItemService newsItemService;
	
	@Autowired
	private NewsItemPhotoUrlService newsItemPhotoUrlService;
	
	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
		NewsItem newsItem = parentEntityId != null ? newsItemService.findNewsItem(parentEntityId) : null;
		populateEditForm(uiModel, new NewsItemPhotoUrl(), newsItem);
		List<String[]> dependencies = new ArrayList<String[]>();
        if (newsItemService.countAllNewsItems() == 0) {
            dependencies.add(new String[] { "newsItem", "newsItems" });
        }
        uiModel.addAttribute("dependencies", dependencies);        
        return "admin/newsitemphotourls/create";
	}
	
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	NewsItem newsItem = parentEntityId != null ? newsItemService.findNewsItem(parentEntityId) : null;
        populateEditForm(uiModel, newsItemPhotoUrlService.findNewsItemPhotoUrl(id), newsItem);
        return "admin/newsitemphotourls/update";
    }
    
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(NewsItemPhotoUrl newsItemPhotoUrl, BindingResult bindingResult, Model uiModel, @RequestParam("content") CommonsMultipartFile content, HttpServletRequest httpServletRequest) {
        
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, newsItemPhotoUrl, null);
	        return "admin/newsitemphotourls/update";
		}
		
		saveNewsItemPhotos(newsItemPhotoUrl.getNewsItem(), newsItemPhotoUrl.getContents());
		return "redirect:/admin/products/" + newsItemPhotoUrl.getNewsItem().getId();
    }
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid NewsItemPhotoUrl newsItemPhotoUrl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItemPhotoUrl, null);
            return "admin/sellerphotourls/update";
        }
        uiModel.asMap().clear();
        newsItemPhotoUrlService.updateNewsItemPhotoUrl(newsItemPhotoUrl);
        return "redirect:/admin/sellers/" + newsItemPhotoUrl.getNewsItem().getId();
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
    	NewsItemPhotoUrl newsItemPhotoUrl = newsItemPhotoUrlService.findNewsItemPhotoUrl(id);
    	newsItemPhotoUrlService.deleteNewsItemPhotoUrl(newsItemPhotoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/sellers/" + newsItemPhotoUrl.getNewsItem().getId();
    }
    
    void populateEditForm(Model uiModel, NewsItemPhotoUrl newsItemPhotoUrl, NewsItem newsItem) {
    	if (newsItem != null) {
    		newsItemPhotoUrl.setNewsItem(newsItem);
		}
        uiModel.addAttribute("newsItemPhotoUrl", newsItemPhotoUrl);
        uiModel.addAttribute("newsItems", newsItemService.findAllNewsItems());
    }
    
    private File getDestFile(NewsItemPhotoUrl newsItemPhotoUrl, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + newsItemPhotoUrl.getNewsItem().getId());
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}
	
}

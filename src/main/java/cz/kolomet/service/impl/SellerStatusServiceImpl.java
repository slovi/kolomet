package cz.kolomet.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.repository.SellerStatusRepository;
import cz.kolomet.service.SellerStatusService;

@Service
@Transactional
public class SellerStatusServiceImpl implements SellerStatusService {
	
	public SellerStatus findSellerStatus(String code) {
		return sellerStatusRepository.findByCodeKey(code);
	}
	
    public List<SellerStatus> findAllSellerStatuses() {
        return sellerStatusRepository.findAll(Codelist.defaultSort());
    }
	

	@Autowired
    SellerStatusRepository sellerStatusRepository;

	public long countAllSellerStatuses() {
        return sellerStatusRepository.count();
    }

	public void deleteSellerStatus(SellerStatus sellerStatus) {
        sellerStatusRepository.delete(sellerStatus);
    }

	public SellerStatus findSellerStatus(Long id) {
        return sellerStatusRepository.findOne(id);
    }

	public List<SellerStatus> findSellerStatusEntries(int firstResult, int maxResults) {
        return sellerStatusRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveSellerStatus(SellerStatus sellerStatus) {
        sellerStatusRepository.save(sellerStatus);
    }

	public SellerStatus updateSellerStatus(SellerStatus sellerStatus) {
        return sellerStatusRepository.save(sellerStatus);
    }
}

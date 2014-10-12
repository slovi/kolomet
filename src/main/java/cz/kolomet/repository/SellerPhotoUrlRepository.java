package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.SellerPhotoUrl;

@Repository
public interface SellerPhotoUrlRepository extends JpaRepository<SellerPhotoUrl, Long>, JpaSpecificationExecutor<SellerPhotoUrl> {
}

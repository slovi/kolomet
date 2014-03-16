package cz.kolomet.repository;
import cz.kolomet.domain.PhotoUrl;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = PhotoUrl.class)
public interface PhotoUrlRepository {
}

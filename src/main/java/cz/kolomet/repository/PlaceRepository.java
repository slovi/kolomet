package cz.kolomet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Place;
import cz.kolomet.util.repository.CustomRepository;

@Repository
public interface PlaceRepository extends CustomRepository<Place, Long> {
	
	@Query(
		"select p from Place p join p.gpsLocation l " +
		"where l.north between :northFrom and :northTo " +
			"and l.west between :westFrom and :westTo")
	List<Place> findByRadius(@Param("northFrom") Double northFrom, @Param("northTo") Double northTo, @Param("westFrom") Double westFrom, @Param("westTo") Double westTo);
	
	
	@Query(
			"select p from Place p join p.gpsLocation l " +
					"where l.north between :northFrom and :northTo " +
						"and l.west between :westFrom and :westTo " +
						"and p not in (:excludedPlaces)")
	List<Place> findByRadius(@Param("northFrom") Double northFrom, @Param("northTo") Double northTo, @Param("westFrom") Double westFrom, @Param("westTo") Double westTo, @Param("excludedPlaces") List<Place> place);	

}

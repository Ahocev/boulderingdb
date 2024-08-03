package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LocationDAO extends JpaRepository<Location, Long> {

    Location findByCountryAndStateAndClimbingAreaAndNearestCity(String country, String state, String nearestCity, String climbingArea);

    List<Location> findByCountry(String country);

    List<Location> findByNearestCity(String nearestCity);

    Location findById(Integer id);
}
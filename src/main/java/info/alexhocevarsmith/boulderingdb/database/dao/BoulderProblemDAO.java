package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoulderProblemDAO extends JpaRepository<BoulderProblem, Long> {

    List<BoulderProblem> findByLocationId(Integer locationId);

    List<BoulderProblem> findByZoneName(String zoneName);

    List<BoulderProblem> findByBoulderName(String boulderName);

    List<BoulderProblem> findByPostedById(Integer userId);

    BoulderProblem findById(Integer id);
}
package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BoulderProblemDAO extends JpaRepository<BoulderProblem, Long> {

    BoulderProblem findByBoulderProblemNameIgnoreCase(String boulderProblemName);

    List<BoulderProblem> findAllByBoulderProblemNameContainingIgnoreCase(String boulderProblemName);

    BoulderProblem findById(Integer id);

    BoulderProblem deleteById(Integer id);

    @Query(value = "SELECT DISTINCT * FROM boulder_problems ORDER BY RAND() LIMIT 4", nativeQuery = true)
    List<BoulderProblem> findRandomBoulders();

    List<BoulderProblem> findByLocationId(Integer locationId);

    List<BoulderProblem> findByZoneName(String zoneName);

    List<BoulderProblem> findByBoulderName(String boulderName);

    List<BoulderProblem> findByPostedById(Integer userId);

}
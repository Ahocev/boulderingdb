package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.AdditionalImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdditionalImageDAO extends JpaRepository<AdditionalImage, Long> {

    AdditionalImage findById(Integer id);

    AdditionalImage findByImageUrl(String imageUrl);

    List<AdditionalImage> findByBoulderProblemId(Integer boulderProblemId);

}

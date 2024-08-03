package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentDAO extends JpaRepository<Comment, Long> {

    List<Comment> findByUserId(Integer userId);

    List<Comment> findByBoulderProblemId(Integer boulderProblemId);

    Comment findById(Integer id);
}
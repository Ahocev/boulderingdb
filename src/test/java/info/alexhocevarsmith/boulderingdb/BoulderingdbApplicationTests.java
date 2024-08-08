package info.alexhocevarsmith.boulderingdb;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.CommentDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.LocationDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.Comment;
import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class BoulderingdbApplicationTests {

	@Autowired
	private BoulderProblemDAO boulderProblemDAO;

	@Autowired
	private CommentDAO commentDAO;

	@Autowired
	private LocationDAO locationDAO;


	@Test
	@Order(1)
	void testReadComment() {
		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertNotNull(comments);
		Assertions.assertTrue(comments.isEmpty());
		Assertions.assertFalse(comments.stream().anyMatch(c -> "This is a test comment.".equals(c.getComment())));
	}

}

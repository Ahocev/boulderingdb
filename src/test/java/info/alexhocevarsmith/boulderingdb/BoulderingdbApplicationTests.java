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
	void testCreateBoulderProblem() {
		BoulderProblem boulderProblem = new BoulderProblem();
		boulderProblem.setBoulderProblemName("Test Problem");
		boulderProblemDAO.save(boulderProblem);

		BoulderProblem retrievedProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Test Problem");
		Assertions.assertNotNull(retrievedProblem);
		Assertions.assertEquals("Test Problem", retrievedProblem.getBoulderProblemName());
	}

	@Test
	@Order(2)
	void testReadComment() {
		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertNotNull(comments);
		Assertions.assertFalse(comments.isEmpty());
		Assertions.assertTrue(comments.stream().anyMatch(c -> "This is a test comment.".equals(c.getComment())));
	}


	@ParameterizedTest
	@CsvSource({
			"USA, California, San Francisco",
			"Canada, Ontario, Toronto"
	})

	@Order(3)
	void testCreateLocation(String country, String state, String nearestCity) {
		Location location = new Location();
		location.setCountry(country);
		location.setState(state);
		location.setNearestCity(nearestCity);
		locationDAO.save(location);

		Location retrievedLocation = locationDAO.findByCountryAndStateAndNearestCity(country, state, nearestCity);
		Assertions.assertNotNull(retrievedLocation);
		Assertions.assertEquals(country, retrievedLocation.getCountry());
		Assertions.assertEquals(state, retrievedLocation.getState());
		Assertions.assertEquals(nearestCity, retrievedLocation.getNearestCity());
	}

	@Test
	@Order(4)
	void testReadAllLocations() {
		List<Location> locations = locationDAO.findAll();
		Assertions.assertNotNull(locations);
		Assertions.assertFalse(locations.isEmpty());
		locations.forEach(location -> System.out.println(location.getCountry() + ", " + location.getState() + ", " + location.getNearestCity()));
	}
}
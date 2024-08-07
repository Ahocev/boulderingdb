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
	void testReadBoulderProblem() {
		BoulderProblem boulderProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Test Problem");
		Assertions.assertNotNull(boulderProblem);
		Assertions.assertEquals("Test Problem", boulderProblem.getBoulderProblemName());
	}

	@Test
	@Order(3)
	void testUpdateBoulderProblem() {
		BoulderProblem boulderProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Test Problem");
		boulderProblem.setBoulderProblemName("Updated Problem");
		boulderProblemDAO.save(boulderProblem);

		BoulderProblem updatedProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Updated Problem");
		Assertions.assertNotNull(updatedProblem);
		Assertions.assertEquals("Updated Problem", updatedProblem.getBoulderProblemName());
	}

	@Test
	@Order(4)
	void testDeleteBoulderProblem() {
		BoulderProblem boulderProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Updated Problem");
		boulderProblemDAO.delete(boulderProblem);

		BoulderProblem deletedProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase("Updated Problem");
		Assertions.assertNull(deletedProblem);
	}

	@Test
	@Order(5)
	void testCreateComment() {
		Comment comment = new Comment();
		comment.setComment("This is a test comment.");
		commentDAO.save(comment);

		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertTrue(comments.stream().anyMatch(c -> "This is a test comment.".equals(c.getComment())));
	}

	@Test
	@Order(6)
	void testReadComment() {
		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertNotNull(comments);
		Assertions.assertFalse(comments.isEmpty());
		Assertions.assertTrue(comments.stream().anyMatch(c -> "This is a test comment.".equals(c.getComment())));
	}

	@Test
	@Order(7)
	void testUpdateComment() {
		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Comment comment = comments.stream().filter(c -> "This is a test comment.".equals(c.getComment())).findFirst().orElse(null);
		Assertions.assertNotNull(comment);

		comment.setComment("Updated comment");
		commentDAO.save(comment);

		List<Comment> updatedComments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertTrue(updatedComments.stream().anyMatch(c -> "Updated comment".equals(c.getComment())));
	}

	@Test
	@Order(8)
	void testDeleteComment() {
		List<Comment> comments = commentDAO.findByBoulderProblemId(null);
		Comment comment = comments.stream().filter(c -> "Updated comment".equals(c.getComment())).findFirst().orElse(null);
		Assertions.assertNotNull(comment);

		commentDAO.delete(comment);

		List<Comment> deletedComments = commentDAO.findByBoulderProblemId(null);
		Assertions.assertFalse(deletedComments.stream().anyMatch(c -> "Updated comment".equals(c.getComment())));
	}

	@ParameterizedTest
	@CsvSource({
			"USA, California, San Francisco",
			"Canada, Ontario, Toronto"
	})
	@Order(9)
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
	@Order(10)
	void testUpdateLocation() {
		Location location = locationDAO.findByCountryAndStateAndNearestCity("USA", "California", "San Francisco");
		Assertions.assertNotNull(location);

		location.setNearestCity("Los Angeles");
		locationDAO.save(location);

		Location updatedLocation = locationDAO.findByCountryAndStateAndNearestCity("USA", "California", "Los Angeles");
		Assertions.assertNotNull(updatedLocation);
		Assertions.assertEquals("Los Angeles", updatedLocation.getNearestCity());
	}

	@Test
	@Order(11)
	void testDeleteLocation() {
		Location location = locationDAO.findByCountryAndStateAndNearestCity("USA", "California", "Los Angeles");
		Assertions.assertNotNull(location);

		locationDAO.delete(location);

		Location deletedLocation = locationDAO.findByCountryAndStateAndNearestCity("USA", "California", "Los Angeles");
		Assertions.assertNull(deletedLocation);
	}

	@Test
	@Order(12)
	void testReadAllLocations() {
		List<Location> locations = locationDAO.findAll();
		Assertions.assertNotNull(locations);
		Assertions.assertFalse(locations.isEmpty());
		locations.forEach(location -> System.out.println(location.getCountry() + ", " + location.getState() + ", " + location.getNearestCity()));
	}
}
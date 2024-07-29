package info.alexhocevarsmith.boulderingdb.database.dao;

import info.alexhocevarsmith.boulderingdb.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Long> {

    User findById(Integer id);

    User findByEmailIgnoreCase(String email);

}
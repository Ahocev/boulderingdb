package info.alexhocevarsmith.boulderingdb.database.dao;


import info.alexhocevarsmith.boulderingdb.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {



}

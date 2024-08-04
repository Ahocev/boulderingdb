package info.alexhocevarsmith.boulderingdb.service;

import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.UserRoleDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
import info.alexhocevarsmith.boulderingdb.database.entity.UserRole;
import info.alexhocevarsmith.boulderingdb.form.RegisterAccountFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class UserService {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRoleDAO userRoleDao;

    public User createUser(RegisterAccountFormBean form) {

        User user = userDao.findById(form.getUserId());
        if (user == null) {
            user = new User();
        }

        user.setEmail(form.getEmail());

        String encryptedPassword = passwordEncoder.encode(form.getPassword());
        user.setPassword(encryptedPassword);

        user.setCreateDate(new Date());
        user.setName(form.getName());
        user.setAge(form.getAge());
        user.setApeIndex(form.getApeIndex());
        user.setHeight(form.getHeight());
        user.setGender(form.getGender());
        user.setAbout(form.getAbout());
        user.setProfileImgUrl(form.getProfileImgUrl());
        user.setStyle(form.getStyle());
        user.setFavoriteArea(form.getFavoriteArea());
        user.setFavoriteBoulderProblem(form.getFavoriteBoulderProblem());

        userDao.save(user);

        return user;
    }

    public UserRole createUserRole(User user, String roleName) {
        UserRole userRole = new UserRole();

        userRole.setUser(user);
        userRole.setRoleName(roleName);
        userRole.setCreateDate(new Date());

        userRoleDao.save(userRole);
        return userRole;
    }
}
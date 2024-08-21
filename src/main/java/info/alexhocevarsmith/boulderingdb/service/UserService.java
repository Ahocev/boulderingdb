package info.alexhocevarsmith.boulderingdb.service;

import info.alexhocevarsmith.boulderingdb.database.dao.AdditionalImageDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.UserRoleDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.AdditionalImage;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
import info.alexhocevarsmith.boulderingdb.database.entity.UserRole;
import info.alexhocevarsmith.boulderingdb.form.AddImgFormBean;
import info.alexhocevarsmith.boulderingdb.form.RegisterAccountFormBean;
import info.alexhocevarsmith.boulderingdb.security.AuthenticatedUserUtilities;
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

    @Autowired
    private AdditionalImageDAO additionalImageDAO;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    public User createUser(RegisterAccountFormBean form) {

        User user = userDao.findById(form.getId());
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

        return userDao.save(user);

    }

    public UserRole createUserRole(User user, String roleName) {
        UserRole userRole = new UserRole();

        userRole.setUser(user);
        userRole.setRoleName(roleName);
        userRole.setCreateDate(new Date());

        userRoleDao.save(userRole);
        return userRole;
    }

    public AdditionalImage addImg(AddImgFormBean form) {

        User user = authenticatedUserUtilities.getCurrentUser();

        // check if image already exists
        AdditionalImage additionalImage = additionalImageDAO.findByImageUrl(form.getImageUrl());

        if ( additionalImage == null ) {

            additionalImage = new AdditionalImage();
            additionalImage.setImageUrl(form.getImageUrl());
            additionalImage.setUser(user);
            additionalImage.setDescription(form.getDescription());

        }

        return additionalImageDAO.save(additionalImage);

    }
}
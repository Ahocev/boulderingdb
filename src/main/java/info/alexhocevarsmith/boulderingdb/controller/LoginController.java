package info.alexhocevarsmith.boulderingdb.controller;

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
import info.alexhocevarsmith.boulderingdb.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/account")
public class LoginController {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private AdditionalImageDAO additionalImageDAO;

    @Autowired
    private UserRoleDAO userRoleDAO;

    @GetMapping("/login")
    public ModelAndView login() {
        log.debug("login");
        ModelAndView response = new ModelAndView("auth/login");

        return response;
    }

    @PostMapping("/login")
    public ModelAndView loginSubmit(@Valid RegisterAccountFormBean form, BindingResult bindingResult) {
        log.debug("login");
        ModelAndView response = new ModelAndView("auth/login");

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

        }

        return response;
    }

    @GetMapping("/register")
    public ModelAndView createAccount(@RequestParam(value = "id", required = false) Integer id) {
        ModelAndView response = new ModelAndView("auth/register");

        User user = null;
        boolean isAdmin = false;

        // Get the current user
        User currentUser = authenticatedUserUtilities.getCurrentUser();

        // Check if the current user has the "ADMIN" role
        if (currentUser != null) {
            List<UserRole> roles = userRoleDAO.findByUserId(currentUser.getId());
            isAdmin = roles.stream().anyMatch(role -> "ADMIN".equals(role.getRoleName()));
        }

        // If an id is provided, load the user with that id
        if (id != null) {
            user = userDao.findById(id);
        } else {
            // If no id is provided, load the current user's data (could be the admin)
            user = currentUser;
        }

        if (user != null) {
            RegisterAccountFormBean form = new RegisterAccountFormBean();
            form.setId(user.getId());
            form.setEmail(user.getEmail());
            form.setPassword("");
            form.setName(user.getName());
            form.setAge(user.getAge());
            form.setApeIndex(user.getApeIndex());
            form.setHeight(user.getHeight());
            form.setGender(user.getGender());
            form.setAbout(user.getAbout());
            form.setProfileImgUrl(user.getProfileImgUrl());
            form.setStyle(user.getStyle());
            form.setFavoriteArea(user.getFavoriteArea());
            form.setFavoriteBoulderProblem(user.getFavoriteBoulderProblem());

            response.addObject("form", form);

        }

        response.addObject("isAdmin", isAdmin); // Pass the admin status to the view
        return response;
    }

    @PostMapping("/registerSubmit")
    public ModelAndView createAccountSubmit(@Valid RegisterAccountFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView("auth/register");

        // checking if the email is in use before creating a new account
        if (form.getId() == null) {
            User u = userDao.findByEmailIgnoreCase(form.getEmail());
            if (u != null) {
                bindingResult.rejectValue("email", "email", "This email is already in use.");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

            return response;
        }

        if (!form.getProfileImg().isEmpty()) {
            log.debug(form.getProfileImg().getOriginalFilename());
            log.debug("The file size is: " + form.getProfileImg().getSize());
            log.debug(form.getProfileImg().getContentType());

            String savedFilename = "./src/main/webapp/pub/media/" + form.getProfileImg().getOriginalFilename();

            try {
                Files.copy(form.getProfileImg().getInputStream(), Paths.get(savedFilename), StandardCopyOption.REPLACE_EXISTING);
            } catch (Exception e) {
                log.error("Unable to finish reading file", e);
            }

            String url = "/pub/media/" + form.getProfileImg().getOriginalFilename();
            form.setProfileImgUrl(url);

        }
        // save user to database
        User user = userService.createUser(form);

        // save user role to DB
        userService.createUserRole(user, "USER");

        // authenticate new user before redirecting
        authenticatedUserUtilities.manualAuthentication(session, form.getEmail(), form.getPassword());

        form.setId(user.getId());

        // redirect to new profile page
        response.setViewName("redirect:/account/profile?id=" + user.getId());

        return response;

    }

    @GetMapping("/profile")
    public ModelAndView profilePage(@RequestParam(value = "id", required = false) Integer id) {
        ModelAndView response = new ModelAndView("auth/profile");

        // initial value of the user object as null, before passing through controller logic
        User user = null;

        // new array list of additional images is initialized with no value before passing through controller logic
        List<AdditionalImage> additionalImages = new ArrayList<>();

        // capturing current userId if the user is logged in
        User currentUser = authenticatedUserUtilities.getCurrentUser();

        boolean isAdmin = false;

        // Check if the current user has the "ADMIN" role
        if (currentUser != null) {
            List<UserRole> roles = userRoleDAO.findByUserId(currentUser.getId());
            isAdmin = roles.stream().anyMatch(role -> "ADMIN".equals(role.getRoleName()));
        }

        if (id == null) {
            // If no id is provided and the user is logged in, show their profile
            if (currentUser != null) {
                user = currentUser;
                additionalImages = additionalImageDAO.findByUserIdAndBoulderProblemIsNull(currentUser.getId());
            }
        } else {
            // If an id is provided, show the profile of the user with that id
            user = userDao.findById(id);
            if (user != null) {
                additionalImages = additionalImageDAO.findByUserIdAndBoulderProblemIsNull(user.getId());
            }
        }

        if (user == null) {
            // If no user is found and no one is logged in
            response.setViewName("auth/profile-not-found");
        } else {
            response.addObject("user", user);
            response.addObject("additionalImages", additionalImages);
            response.addObject("currentUserId", currentUser != null ? currentUser.getId() : null);
            response.addObject("isAdmin", isAdmin);
        }

        return response;
    }

    @PostMapping("/addImgSubmit")
    public ModelAndView addImgSubmit(@Valid AddImgFormBean form) {

        if (form.getImages() != null) {  // Check for null
            for (MultipartFile image : form.getImages()) {
                if (!image.isEmpty()) {
                    log.debug(image.getOriginalFilename());
                    log.debug("The file size is: " + image.getSize());
                    log.debug(image.getContentType());

                    String savedFilename = "./src/main/webapp/pub/media/" + image.getOriginalFilename();

                    try {
                        Files.copy(image.getInputStream(), Paths.get(savedFilename), StandardCopyOption.REPLACE_EXISTING);
                    } catch (Exception e) {
                        log.error("Unable to finish reading file", e);
                    }

                    String url = "/pub/media/" + image.getOriginalFilename();
                    form.setImageUrl(url);

                    AdditionalImage additionalImage = userService.addImg(form);
                    form.setId(additionalImage.getId());
                }
            }
        }

        return new ModelAndView("redirect:/account/profile");

    }

}

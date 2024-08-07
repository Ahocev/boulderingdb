package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
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
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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

    @GetMapping("/register")
    public ModelAndView createAccount() {
        ModelAndView response = new ModelAndView("auth/register");

        User user = authenticatedUserUtilities.getCurrentUser();

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
        } else {
            response.setViewName("redirect:/account/profile");
        }

        return response;
    }

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

    @PostMapping("/register")
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

        User user;
        User currentUser = authenticatedUserUtilities.getCurrentUser();

        // if there is no user id when the user clicks on the profile page, then show current user's profile
        if (id == null) {
            user = currentUser;
            if (user == null) {
                response.setViewName("redirect:/account/register");
                return response;
            }
        } else {
            // if there is an id param on the profile url, show that user id's profile
            user = userDao.findById(id);
            if (user == null) {
                response.setViewName("redirect:/account/register");
                return response;
            }
        }

        response.addObject("user", user);
        response.addObject("currentUserId", currentUser != null ? currentUser.getId() : null);
        return response;
    }

}

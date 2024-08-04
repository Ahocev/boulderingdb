package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
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
        log.debug("register");
        ModelAndView response = new ModelAndView("auth/register");

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

        if (form.getUserId() == null) {
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

        User user = userService.createUser(form);
        userService.createUserRole(user, "USER");

        authenticatedUserUtilities.manualAuthentication(session, form.getEmail(), form.getPassword());
        response.setViewName("redirect:/");

        return response;

    }

    @GetMapping("/profile")
    public ModelAndView boulderPage() {

        return new ModelAndView("auth/profile");

    }


}

package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.LocationDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
import info.alexhocevarsmith.boulderingdb.form.AddBoulderFormBean;
import info.alexhocevarsmith.boulderingdb.form.RegisterAccountFormBean;
import info.alexhocevarsmith.boulderingdb.service.BoulderService;
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

@Slf4j
@Controller
@RequestMapping("/boulder")
public class BoulderController {

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    @Autowired
    private BoulderService boulderService;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LocationDAO locationDAO;

    @GetMapping("/boulder-page")
    public ModelAndView boulderPage(@RequestParam("id") Long id) {
        ModelAndView response = new ModelAndView("boulder/boulder-page");

        BoulderProblem boulderProblem = boulderProblemDAO.findById(id).orElse(null);
        if (boulderProblem == null) {
            response.setViewName("redirect:/boulder/boulder-input");
            return response;
        }

        response.addObject("boulderProblem", boulderProblem);
        return response;
    }

    @GetMapping("/browse")
    public ModelAndView browse() {

        return new ModelAndView("boulder/browse");

    }

    @GetMapping("/search")
    public ModelAndView search(@RequestParam(required = false) String search) {
        ModelAndView response = new ModelAndView("boulder/search");

        log.debug("The user searched for the term: " + search);

        response.addObject("search", search);

        List<BoulderProblem> boulderProblems = new ArrayList<>();
        List<User> users = new ArrayList<>();

        if (search != null && !search.isEmpty()) {
            boulderProblems = boulderProblemDAO.findAllByBoulderProblemNameContainingIgnoreCase(search);
            users = userDAO.findAllByNameContainingIgnoreCase(search);
        }

        response.addObject("boulderProblems", boulderProblems);
        response.addObject("users", users);

        return response;
    }

    @GetMapping("/boulder-input")
    public ModelAndView boulderInput() {
        ModelAndView response = new ModelAndView("boulder/boulder-input");
        response.addObject("form", new AddBoulderFormBean());
        return response;
    }

    @PostMapping("/submit")
    public ModelAndView submitBoulderProblem(@Valid AddBoulderFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            response.setViewName("boulder/boulder-input");
            response.addObject("form", form);
            return response;
        }

        // Check if the BoulderProblem name already exists
        BoulderProblem existingBoulderProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase(form.getBoulderProblemName());
        if (existingBoulderProblem != null) {
            bindingResult.rejectValue("boulderProblemName", "boulderProblemName", "This Boulder Problem name already exists.");
        }

        // Handle the file upload first
        if (!form.getShowcaseImg().isEmpty()) {
            log.debug(form.getShowcaseImg().getOriginalFilename());
            log.debug("The file size is: " + form.getShowcaseImg().getSize());
            log.debug(form.getShowcaseImg().getContentType());

            String savedFilename = "./src/main/webapp/pub/media/" + form.getShowcaseImg().getOriginalFilename();

            try {
                Files.copy(form.getShowcaseImg().getInputStream(), Paths.get(savedFilename), StandardCopyOption.REPLACE_EXISTING);
            } catch (Exception e) {
                log.error("Unable to finish reading file", e);
            }

            String url = "/pub/media/" + form.getShowcaseImg().getOriginalFilename();
            form.setShowcaseImgUrl(url);

        }

        // Save the form data using BoulderService
        BoulderProblem boulderProblem = boulderService.addBoulderProblem(form);
        response.setViewName("redirect:/boulder/boulder-page?id=" + boulderProblem.getId());
        return response;
    }

}

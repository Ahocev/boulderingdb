package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
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
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/boulder")
public class BoulderController {

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    @Autowired
    private BoulderService boulderService;

    @GetMapping("/boulder-page")
    public ModelAndView boulderPage() {

        return new ModelAndView("boulder/boulder-page");

    }

    @GetMapping("/browse")
    public ModelAndView browse() {

        return new ModelAndView("boulder/browse");

    }

    @GetMapping("/search")
    public ModelAndView search(@RequestParam(required = false) String search) {
        // this page is for another page of the website which is express as "/page-url"
        ModelAndView response = new ModelAndView("boulder/search");

        log.debug("The user searched for the term: " + search);


        response.addObject("search", search);

//        List<BoulderProblem> boulderProblems = boulderProblemDAO.findById(search);
//        response.addObject("boulderProblems", boulderProblems);

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

        // Check if the BoulderProblem name already exists
        BoulderProblem existingBoulderProblem = boulderProblemDAO.findByBoulderProblemNameIgnoreCase(form.getBoulderProblemName());
        if (existingBoulderProblem != null) {
            bindingResult.rejectValue("boulderProblemName", "boulderProblemName", "This Boulder Problem name already exists.");
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            response.setViewName("boulder/boulder-input");
            response.addObject("form", form);
            return response;
        }

         BoulderProblem boulderProblem = boulderService.addBoulderProblem(form);
         response.setViewName("redirect:/boulder/boulder-page?id=" + boulderProblem.getId());
        return response;

    }

}

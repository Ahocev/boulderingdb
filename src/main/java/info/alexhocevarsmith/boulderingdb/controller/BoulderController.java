package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.form.RegisterAccountFormBean;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/boulder")
public class BoulderController {

//    @Autowired
//    private BoulderDAO boulderDao;

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

//        List<Boulder> products = boulderDao.findById(search);
//        response.addObject("boulders", boulders);

        return response;
    }

    @RequestMapping(value = "/boulder-input", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView boulderInput(@Valid RegisterAccountFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView("boulder/boulder-input");

        return response;
    }

}

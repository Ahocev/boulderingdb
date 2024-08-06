package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class IndexController {

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    @GetMapping("/")
    public ModelAndView index() {

        ModelAndView response = new ModelAndView("index");

        List<BoulderProblem> featuredBoulders = boulderProblemDAO.findRandomBoulders();
        response.addObject("featuredBoulders", featuredBoulders);

        return response;
    }

    @GetMapping("/index")
    public ModelAndView indexPage() {
        ModelAndView response = new ModelAndView("index");

        List<BoulderProblem> featuredBoulders = boulderProblemDAO.findRandomBoulders();
        response.addObject("featuredBoulders", featuredBoulders);

        return response;
    }

}

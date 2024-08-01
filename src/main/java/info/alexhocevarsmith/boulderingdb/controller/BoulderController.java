package info.alexhocevarsmith.boulderingdb.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping("/boulder")
public class BoulderController {

    @GetMapping("/boulder-page")
    public ModelAndView boulderPage() {

        return new ModelAndView("boulder/boulder-page");

    }

}

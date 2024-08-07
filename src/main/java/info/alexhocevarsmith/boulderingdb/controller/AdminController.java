package info.alexhocevarsmith.boulderingdb.controller;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.CommentDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.Comment;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
import info.alexhocevarsmith.boulderingdb.security.AuthenticatedUserUtilities;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.annotations.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAnyAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    @Autowired
    private CommentDAO commentDAO;

    @GetMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView response = new ModelAndView("admin/dashboard");

        User user = authenticatedUserUtilities.getCurrentUser();
        log.debug(user.toString());

        List<BoulderProblem> boulderProblems = boulderProblemDAO.findAll();
        response.addObject("boulderProblems", boulderProblems);

        return response;
    }

    @PostMapping("/deleteBoulder")
    public ModelAndView deleteBoulder(@RequestParam Integer id) {
        ModelAndView response = new ModelAndView();

        List<Comment> comments = commentDAO.findByBoulderProblemId(id);
        if (comments != null) {
            for (Comment comment : comments) {
                commentDAO.delete(comment);
            }
        }

        BoulderProblem boulderProblem = boulderProblemDAO.findById(id);
        if (boulderProblem != null ) {
            boulderProblemDAO.delete(boulderProblem);
        }
        response.setViewName("redirect:/admin/dashboard");
        return response;
    }
}


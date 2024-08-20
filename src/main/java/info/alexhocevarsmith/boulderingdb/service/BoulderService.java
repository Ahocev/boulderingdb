package info.alexhocevarsmith.boulderingdb.service;

import info.alexhocevarsmith.boulderingdb.database.dao.AdditionalImageDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.CommentDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.LocationDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.*;
import info.alexhocevarsmith.boulderingdb.form.AddBoulderFormBean;
import info.alexhocevarsmith.boulderingdb.form.AddImgFormBean;
import info.alexhocevarsmith.boulderingdb.security.AuthenticatedUserUtilities;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BoulderService {

    @Autowired
    private LocationDAO locationDAO;

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    @Autowired
    private CommentDAO commentDAO;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private AdditionalImageDAO additionalImageDAO;

    public BoulderProblem addBoulderProblem(AddBoulderFormBean form) {

        // Check if the location already exists
        Location location = locationDAO.findByCountryAndStateAndNearestCity(form.getCountry(), form.getState(), form.getNearestCity());

        if (location == null) {
            // Create a new location if it doesn't exist
            location = new Location();
            location.setCountry(form.getCountry());
            location.setState(form.getState());
            location.setNearestCity(form.getNearestCity());
            locationDAO.save(location);
        }

        User user = authenticatedUserUtilities.getCurrentUser();

        BoulderProblem boulderProblem = boulderProblemDAO.findById(form.getId());
        if ( boulderProblem == null ) {
            // Create a new BoulderProblem and set its fields
            boulderProblem = new BoulderProblem();
        }

            boulderProblem.setBoulderProblemName(form.getBoulderProblemName());
            boulderProblem.setFirstAscensionist(form.getFirstAscensionist());
            boulderProblem.setGrade(form.getGrade());
            boulderProblem.setRating(form.getRating());
            boulderProblem.setRepeated(form.getRepeated());
            boulderProblem.setHistory(form.getHistory());
            boulderProblem.setShowcaseImgUrl(form.getShowcaseImgUrl());
            boulderProblem.setZoneName(form.getZoneName());
            boulderProblem.setBoulderName(form.getBoulderName());
            boulderProblem.setLocation(location);
            boulderProblem.setPostedBy(user);

        // Save the BoulderProblem
        return boulderProblemDAO.save(boulderProblem);
    }

    public BoulderProblem editBoulderProblem(AddBoulderFormBean form) {
        BoulderProblem boulderProblem = boulderProblemDAO.findById(form.getId());

        if (boulderProblem == null) {
            throw new IllegalArgumentException("Boulder problem not found");
        }

        // Check if the location already exists
        Location location = locationDAO.findByCountryAndStateAndNearestCity(form.getCountry(), form.getState(), form.getNearestCity());

        if (location == null) {
            // Create a new location if it doesn't exist
            location = new Location();
            location.setCountry(form.getCountry());
            location.setState(form.getState());
            location.setNearestCity(form.getNearestCity());
            locationDAO.save(location);
        } else {
            // Update the existing location if necessary
            location.setCountry(form.getCountry());
            location.setState(form.getState());
            location.setNearestCity(form.getNearestCity());
            locationDAO.save(location);
        }

        // Update the BoulderProblem fields
        boulderProblem.setBoulderProblemName(form.getBoulderProblemName());
        boulderProblem.setFirstAscensionist(form.getFirstAscensionist());
        boulderProblem.setGrade(form.getGrade());
        boulderProblem.setRating(form.getRating());
        boulderProblem.setRepeated(form.getRepeated());
        boulderProblem.setHistory(form.getHistory());
        boulderProblem.setShowcaseImgUrl(form.getShowcaseImgUrl());
        boulderProblem.setZoneName(form.getZoneName());
        boulderProblem.setBoulderName(form.getBoulderName());
        boulderProblem.setLocation(location);

        // Save the updated BoulderProblem
        return boulderProblemDAO.save(boulderProblem);
    }

    public AdditionalImage addImg(AddImgFormBean form) {

        User user = authenticatedUserUtilities.getCurrentUser();

        BoulderProblem boulderProblem = boulderProblemDAO.findById(form.getBoulderProblemId());

        if (boulderProblem == null) {
            throw new RuntimeException("BoulderProblem not found for id: " + form.getBoulderProblemId());
        }

        log.debug("BoulderProblem ID: " + boulderProblem.getId());
        log.debug("Image URL: " + form.getImageUrl());

        // check if image already exists
        AdditionalImage additionalImage = additionalImageDAO.findByImageUrl(form.getImageUrl());

        if ( additionalImage == null ) {

            additionalImage = new AdditionalImage();
            additionalImage.setImageUrl(form.getImageUrl());
            additionalImage.setUser(user);
            additionalImage.setBoulderProblem(getBoulderProblemById(form.getBoulderProblemId()));
            additionalImage.setDescription(form.getDescription());

        }

        return additionalImageDAO.save(additionalImage);

    }

    public BoulderProblem getBoulderProblemById(Integer id) {
        return boulderProblemDAO.findById(id);
    }


    public void saveComment(Comment comment) {
        commentDAO.save(comment);
    }

    public List<Comment> getCommentsByBoulderProblemId(Integer boulderProblemId) {
        return commentDAO.findByBoulderProblemId(boulderProblemId);
    }
}
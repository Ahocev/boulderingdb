package info.alexhocevarsmith.boulderingdb.service;

import info.alexhocevarsmith.boulderingdb.database.dao.BoulderProblemDAO;
import info.alexhocevarsmith.boulderingdb.database.dao.LocationDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import info.alexhocevarsmith.boulderingdb.form.AddBoulderFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class BoulderService {

    @Autowired
    private LocationDAO locationDAO;

    @Autowired
    private BoulderProblemDAO boulderProblemDAO;

    public BoulderProblem addBoulderProblem(AddBoulderFormBean form) {

        // Check if the location already exists
        Location location = locationDAO.findByCountryAndStateAndClimbingAreaAndNearestCity(form.getCountry(), form.getState(), form.getClimbingArea(), form.getNearestCity());

        if (location == null) {
            // Create a new location if it doesn't exist
            location = new Location();
            location.setCountry(form.getCountry());
            location.setState(form.getState());
            location.setNearestCity(form.getNearestCity());
            location.setClimbingArea(form.getClimbingArea());
            locationDAO.save(location);
        }

        // Create a new BoulderProblem and set its fields
        BoulderProblem boulderProblem = new BoulderProblem();
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

        // Save the BoulderProblem
        return boulderProblemDAO.save(boulderProblem);
    }
}
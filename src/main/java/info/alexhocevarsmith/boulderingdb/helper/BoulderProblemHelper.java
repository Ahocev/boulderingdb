package info.alexhocevarsmith.boulderingdb.helper;

import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoulderProblemHelper {

    private Map<String, List<BoulderProblem>> zoneMap;

    public BoulderProblemHelper() {
        this.zoneMap = new HashMap<>();
    }

    public void addBoulderProblem(BoulderProblem boulderProblem) {
        List<BoulderProblem> boulderProblems = zoneMap.computeIfAbsent(boulderProblem.getZoneName(), k -> new ArrayList<>());
        boulderProblems.add(boulderProblem);
    }

    public Map<String, List<BoulderProblem>> getZoneMap() {
        return zoneMap;
    }
}
package info.alexhocevarsmith.boulderingdb.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.*;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "locations")
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "country")
    private String country;

    @Column(name = "nearest_city")
    private String nearestCity;

    @Column(name = "state")
    private String state;

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL)
    private List<BoulderProblem> boulderProblems = new ArrayList<>();

    @Transient
    private Map<String, List<BoulderProblem>> zoneMap = new HashMap<>();

    public void setZoneMap(Map<String, List<BoulderProblem>> zoneMap) {
        this.zoneMap = zoneMap;
    }

}
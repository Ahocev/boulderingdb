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

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "climbing_area")
    private String climbingArea;

//    @Column(name = "latitude", precision = 9, scale = 6)
//    private Double latitude;
//
//    @Column(name = "longitude", precision = 9, scale = 6)
//    private Double longitude;

    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL)
    private List<BoulderProblem> boulderProblems = new ArrayList<>();

}
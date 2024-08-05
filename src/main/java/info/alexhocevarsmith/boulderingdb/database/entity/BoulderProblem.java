package info.alexhocevarsmith.boulderingdb.database.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.*;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "boulder_problems")
public class BoulderProblem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "location_id")
    private Location location;

    @Column(name = "zone_name")
    private String zoneName;

    @Column(name = "boulder_name")
    private String boulderName;

    @Column(name = "boulder_problem_name")
    private String boulderProblemName;

    @Column(name = "rating")
    private Integer rating;

    @Column(name = "grade")
    private String grade;

    @Column(name = "repeated")
    private Boolean repeated;

    @Column(name = "history", length = 5000)
    private String history;

    @Column(name = "first_ascensionist")
    private String firstAscensionist;

    @ManyToOne
    @JoinColumn(name = "posted_by")
    private User postedBy;

    @Column(name = "showcase_img_url")
    private String showcaseImgUrl;

    @Column(name = "comment_id", insertable = false, updatable = false)
    private Integer commentId;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "comment_id", nullable = false)
    private Comment comment;

}
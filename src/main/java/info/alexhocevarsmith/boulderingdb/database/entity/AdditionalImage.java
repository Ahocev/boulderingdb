package info.alexhocevarsmith.boulderingdb.database.entity;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "additional_images")
public class AdditionalImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "boulder_problem_id", insertable = false, updatable = false)
    private Integer boulderProblemId;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "boulder_problem_id", nullable = false)
    private BoulderProblem boulderProblem;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "user_id", insertable = false, updatable = false)
    private Integer userId;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(name = "description", length = 1000)
    private String description;
}

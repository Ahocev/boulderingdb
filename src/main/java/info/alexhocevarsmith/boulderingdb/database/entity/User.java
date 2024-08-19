package info.alexhocevarsmith.boulderingdb.database.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.*;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "email", nullable = false, length = 150)
    private String email;

    @Column(name = "password", nullable = false, length = 150)
    private String password;

    @Column(name = "create_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate = new Date();

    @Column(name = "name", length = 200)
    private String name;

    @Column(name = "age")
    private Integer age;

    @Column(name = "ape_index", length = 50)
    private String apeIndex;

    @Column(name = "height")
    private Float height;

    @Column(name = "gender", length = 100)
    private String gender;

    @Column(name = "about", length = 2000)
    private String about;

    @Column(name = "profile_img_url")
    private String profileImgUrl;

    @Column(name = "style")
    private String style;

    @Column(name = "favorite_area")
    private String favoriteArea;

    @Column(name = "favorite_boulder_problem")
    private String favoriteBoulderProblem;

    @ToString.Exclude
    @OneToMany(mappedBy = "postedBy", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<BoulderProblem> boulderProblems = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<UserRole> userRoles = new ArrayList<>();
}
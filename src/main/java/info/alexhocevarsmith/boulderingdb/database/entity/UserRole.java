package info.alexhocevarsmith.boulderingdb.database.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Setter
@Getter
@Entity
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "user_id", insertable = false, updatable = false)
    private Integer userId;

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}

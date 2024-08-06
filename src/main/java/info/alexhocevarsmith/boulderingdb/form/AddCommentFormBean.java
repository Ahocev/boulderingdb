package info.alexhocevarsmith.boulderingdb.form;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class AddCommentFormBean {

    private String comment;

    private Integer commentId;

    private Integer boulderProblemId;

    private Integer userId;

    private Date commentDate;

}
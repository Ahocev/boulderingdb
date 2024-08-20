package info.alexhocevarsmith.boulderingdb.form;

import info.alexhocevarsmith.boulderingdb.database.entity.BoulderProblem;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class AddImgFormBean {

    private Integer id;

    private Integer boulderProblemId;

    private Integer userId;

    private List<MultipartFile> images = new ArrayList<>();

    private String imageUrl;

    private String description;

}

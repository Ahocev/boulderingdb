package info.alexhocevarsmith.boulderingdb.form;

import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class AddBoulderFormBean {

    private Integer id;

    @NotEmpty(message = "Boulder Problem Name is required.")
    private String boulderProblemName;

    private String firstAscensionist;

    private String grade;

    @Min(value = 1, message = "Rating must be between 1 and 5")
    @Max(value = 5, message = "Rating must be between 1 and 5")
    private Integer rating;

    private Boolean repeated;

    private String history;

    private MultipartFile showcaseImg;

    private String showcaseImgUrl;

    @NotEmpty(message = "Country is required.")
    private String country;

    private String state;

    private String nearestCity;

    private String zoneName;

    private String boulderName;

}

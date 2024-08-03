package info.alexhocevarsmith.boulderingdb.form;

import info.alexhocevarsmith.boulderingdb.database.entity.Location;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddBoulderFormBean {

    @NotEmpty(message = "Boulder Problem Name is required.")
    private String boulderProblemName;

    private String firstAscensionist;

    private String grade;

    @Min(value = 1, message = "Rating must be between 1 and 5")
    @Max(value = 5, message = "Rating must be between 1 and 5")
    private Integer rating;

    private Boolean repeated;

    private String history;

    private String showcaseImgUrl;

    @NotEmpty(message = "Country is required.")
    private String country;

    @NotEmpty(message = "Climbing Area is required.")
    private String climbingArea;

    @NotEmpty(message = "State is required.")
    private String state;

    private String zoneName;

    private String boulderName;

}

package info.alexhocevarsmith.boulderingdb.form;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LocationFormBean {

    @NotEmpty(message = "Country is required.")
    private String country;

    @NotEmpty(message = "Climbing Area is required.")
    private String climbingArea;

    @NotEmpty(message = "State is required.")
    private String state;

}

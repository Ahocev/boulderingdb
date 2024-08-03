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

    private String nearestCity;

    private String state;

}

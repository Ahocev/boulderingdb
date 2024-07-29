package info.alexhocevarsmith.boulderingdb.form;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
public class RegisterAccountFormBean {

    private Integer userId;

    @Length(max = 100, message="Email must be less than 100 characters.")
    @NotEmpty(message = "Email is required.")
    @Email(message = "Must be a valid email.")
    private String email;

    @NotEmpty(message = "Must not be empty.")
    private String password;

}

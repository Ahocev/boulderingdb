package info.alexhocevarsmith.boulderingdb.form;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class RegisterAccountFormBean {

    private Integer userId;

    @Length(max = 150, message = "Email must be less than 150 characters.")
    @NotEmpty(message = "Email is required.")
    @Email(message = "Must be a valid email.")
    private String email;

    @Length(max = 150, message = "Password must be less than 150 characters.")
    @NotEmpty(message = "Password is required.")
    private String password;

    @Length(max = 200, message = "Name must be less than 200 characters.")
    private String name;

    @Min(value = 0, message = "Age must be a positive integer.")
    private Integer age;

    @Length(max = 50, message = "Ape index must be less than 50 characters.")
    private String apeIndex;

    @Min(value = 0, message = "Height must be a positive number.")
    private Float height;

    @Length(max = 100, message = "Gender must be less than 100 characters.")
    private String gender;

    @Length(max = 2000, message = "About section must be less than 2000 characters.")
    private String about;

    private MultipartFile profileImg;

    @Length(max = 255, message = "Profile image URL must be less than 255 characters.")
    private String profileImgUrl;

    @Length(max = 255, message = "Style must be less than 255 characters.")
    private String style;

    @Length(max = 500, message = "Favorite area must be less than 500 characters.")
    private String favoriteArea;

    @Length(max = 500, message = "Favorite boulder problem must be less than 500 characters.")
    private String favoriteBoulderProblem;
}
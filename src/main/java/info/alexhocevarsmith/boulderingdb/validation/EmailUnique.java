package info.alexhocevarsmith.boulderingdb.validation;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailUniqueImpl.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailUnique {

    String message() default "{EmailUnique}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

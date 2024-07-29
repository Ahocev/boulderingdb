package info.alexhocevarsmith.boulderingdb.validation;

import info.alexhocevarsmith.boulderingdb.database.dao.UserDAO;
import info.alexhocevarsmith.boulderingdb.database.entity.User;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class EmailUniqueImpl implements ConstraintValidator<EmailUnique, String> {
    public static final Logger LOG = LoggerFactory.getLogger(EmailUniqueImpl.class);

    @Autowired
    private UserDAO userDao;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        if (StringUtils.isEmpty(value)) {

            return true;
        }

        User user = userDao.findByEmailIgnoreCase(value);
        return (user == null);

    }
}

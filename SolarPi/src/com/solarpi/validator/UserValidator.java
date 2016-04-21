package com.solarpi.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.solarpi.model.User;

@Component
public class UserValidator {
  public boolean supports(Class<?> klass) {
    return User.class.isAssignableFrom(klass);
  }

  public void validate(Object target, Errors errors) {
    User user = (User) target;
    
    if (!(user.getPassword()).equals(user
            .getConfirmPassword())) {
          errors.rejectValue("confirmPassword",
              "ConfirmPassword.user.confirmPassword",
              "Password does not match.");
        }
  }
}

package utils;

public class RegistrationValidator {
    private static final String REGEX_MAIL_FORMAT = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";

    public static boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            System.out.println("Email cannot be null or empty.");
            return false;
        }

        if (!email.matches(REGEX_MAIL_FORMAT)) {
            System.out.println("Invalid email format.");
            return false;
        }
        return true;
    }
}

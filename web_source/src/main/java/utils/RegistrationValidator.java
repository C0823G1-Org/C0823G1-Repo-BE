package utils;

public class RegistrationValidator {
    private static final String REGEX_MAIL_FORMAT = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static final String REGEX_PASSWORD = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";

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

    public static boolean isValidPassword(String password) {
        if (password == null || password.trim().isEmpty()) {
            System.out.println("Password cannot be null or empty.");
            return false;
        }

        if (!password.matches(REGEX_PASSWORD)) {
            System.out.println("Invalid password format!");
            return false;
        }
        return true;
    }

}

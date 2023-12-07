package model;

public class UserAccount {
    private String email;
    private String password;
    private int idRole;

    public UserAccount() {
    }

    public UserAccount(String email, String password, int idRole) {
        this.email = email;
        this.password = password;
        this.idRole = idRole;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }
}

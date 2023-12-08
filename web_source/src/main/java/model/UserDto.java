package dto;

public class UserDto {
    private String email;

    private String roleName;

    private Integer roleId;

    private String birthday;

    private String username;


    public UserDto(String email, String roleName, Integer roleId, String birthday, String username) {
        this.email = email;
        this.roleName = roleName;
        this.roleId = roleId;
        this.birthday = birthday;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public UserDto() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}

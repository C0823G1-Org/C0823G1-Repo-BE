package model;

public class User {
    private int id;
    private String name;
    private String birthday;
    private String email;
    private boolean isDelete;

    public User() {
    }

    public User(String name, String birthday, String email, boolean isDelete) {
        this.name = name;
        this.birthday = birthday;
        this.email = email;
        this.isDelete = isDelete;
    }

    public User(int id, String name, String birthday, String email, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.email = email;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }
}

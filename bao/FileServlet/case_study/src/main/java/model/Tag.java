package model;

public class Tag {
    private int idTag;
    private String name;
    private String description;
    private boolean isDelete;

    public Tag() {
    }

    public Tag(String name, String description, boolean isDelete) {
        this.name = name;
        this.description = description;
        this.isDelete = isDelete;
    }

    public Tag(int idTag, String name, String description, boolean isDelete) {
        this.idTag = idTag;
        this.name = name;
        this.description = description;
        this.isDelete = isDelete;
    }

    public int getIdTag() {
        return idTag;
    }

    public void setIdTag(int idTag) {
        this.idTag = idTag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }
}

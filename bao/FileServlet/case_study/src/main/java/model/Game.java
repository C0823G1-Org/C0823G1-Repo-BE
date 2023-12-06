package model;

import java.util.Date;

public class Game {
    private int id;
    private String title;
    private String price;
    private String description;
    private boolean ageRequirement;
    private int idImage;
    private int idLibaryStore;
    private boolean isDelete;
    private int idDeveloper ;
    private Date releaseDate;
    private int idDlc;
    private int idRatingReview;
    private String requirementMiniumSystem;
    private String requirementMiniumRecommend;

    public Game() {
    }

    public Game(String title, String price, String description, boolean ageRequirement,
                int idImage, int idLibaryStore, boolean isDelete, int idDeveloper,
                Date releaseDate, int idDlc, int idRatingReview, String requirementMiniumSystem,
                String requirementMiniumRecommend) {
        this.title = title;
        this.price = price;
        this.description = description;
        this.ageRequirement = ageRequirement;
        this.idImage = idImage;
        this.idLibaryStore = idLibaryStore;
        this.isDelete = isDelete;
        this.idDeveloper = idDeveloper;
        this.releaseDate = releaseDate;
        this.idDlc = idDlc;
        this.idRatingReview = idRatingReview;
        this.requirementMiniumSystem = requirementMiniumSystem;
        this.requirementMiniumRecommend = requirementMiniumRecommend;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAgeRequirement() {
        return ageRequirement;
    }

    public void setAgeRequirement(boolean ageRequirement) {
        this.ageRequirement = ageRequirement;
    }

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public int getIdLibaryStore() {
        return idLibaryStore;
    }

    public void setIdLibaryStore(int idLibaryStore) {
        this.idLibaryStore = idLibaryStore;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }

    public int getIdDeveloper() {
        return idDeveloper;
    }

    public void setIdDeveloper(int idDeveloper) {
        this.idDeveloper = idDeveloper;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getIdDlc() {
        return idDlc;
    }

    public void setIdDlc(int idDlc) {
        this.idDlc = idDlc;
    }

    public int getIdRatingReview() {
        return idRatingReview;
    }

    public void setIdRatingReview(int idRatingReview) {
        this.idRatingReview = idRatingReview;
    }

    public String getRequirementMiniumSystem() {
        return requirementMiniumSystem;
    }

    public void setRequirementMiniumSystem(String requirementMiniumSystem) {
        this.requirementMiniumSystem = requirementMiniumSystem;
    }

    public String getRequirementMiniumRecommend() {
        return requirementMiniumRecommend;
    }

    public void setRequirementMiniumRecommend(String requirementMiniumRecommend) {
        this.requirementMiniumRecommend = requirementMiniumRecommend;
    }
}

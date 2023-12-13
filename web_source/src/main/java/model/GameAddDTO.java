package model;

import java.util.List;

public class GameAddDTO {
    private int id;
    private String title;
    private double price;
    private String description;
    private int ageRequirement;
    private int developerId;
    private String releaseDate;
    private int dlcId;
    private int reviewRatingId;
    private String miniumSystemRequirement;
    private String recommendSystemRequirement;
    private List<String> image;

    public GameAddDTO(int id,String title, double price, String description, int ageRequirement,
                      int developerId, String releaseDate, int dlcId,
                      int reviewRatingId, String miniumSystemRequirement,
                      String recommendSystemRequirement, List<String> image) {
        this.title = title;
        this.price = price;
        this.description = description;
        this.ageRequirement = ageRequirement;
        this.developerId = developerId;
        this.releaseDate = releaseDate;
        this.dlcId = dlcId;
        this.reviewRatingId = reviewRatingId;
        this.miniumSystemRequirement = miniumSystemRequirement;
        this.recommendSystemRequirement = recommendSystemRequirement;
        this.image = image;
        this.id = id;
    }

    public GameAddDTO(int id, String title, double price, String description, int ageRequirement, int developerId, String releaseDate, int dlcId, int reviewRatingId, String miniumSystemRequirement, String recommendSystemRequirement) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.description = description;
        this.ageRequirement = ageRequirement;
        this.developerId = developerId;
        this.releaseDate = releaseDate;
        this.dlcId = dlcId;
        this.reviewRatingId = reviewRatingId;
        this.miniumSystemRequirement = miniumSystemRequirement;
        this.recommendSystemRequirement = recommendSystemRequirement;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<String> getImage() {
        return image;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAgeRequirement() {
        return ageRequirement;
    }

    public void setAgeRequirement(int ageRequirement) {
        this.ageRequirement = ageRequirement;
    }

    public int getDeveloperId() {
        return developerId;
    }

    public void setDeveloperId(int developerId) {
        this.developerId = developerId;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getDlcId() {
        return dlcId;
    }

    public void setDlcId(int dlcId) {
        this.dlcId = dlcId;
    }

    public int getReviewRatingId() {
        return reviewRatingId;
    }

    public void setReviewRatingId(int reviewRatingId) {
        this.reviewRatingId = reviewRatingId;
    }

    public String getMiniumSystemRequirement() {
        return miniumSystemRequirement;
    }

    public void setMiniumSystemRequirement(String miniumSystemRequirement) {
        this.miniumSystemRequirement = miniumSystemRequirement;
    }

    public String getRecommendSystemRequirement() {
        return recommendSystemRequirement;
    }

    public void setRecommendSystemRequirement(String recommendSystemRequirement) {
        this.recommendSystemRequirement = recommendSystemRequirement;
    }
}

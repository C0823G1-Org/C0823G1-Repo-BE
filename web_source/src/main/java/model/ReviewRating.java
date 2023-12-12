package model;

public class ReviewRating {
    private int id;
    private String typeReview;
    private int idTypeRating;

    public ReviewRating() {
    }

    public ReviewRating(String typeReview, int idTypeRating) {
        this.typeReview = typeReview;
        this.idTypeRating = idTypeRating;
    }

    public ReviewRating(int id, String typeReview, int idTypeRating) {
        this.id = id;
        this.typeReview = typeReview;
        this.idTypeRating = idTypeRating;
    }

    public ReviewRating(int id, int idTypeRating) {
        this.id = id;
        this.idTypeRating = idTypeRating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeReview() {
        return typeReview;
    }

    public void setTypeReview(String typeReview) {
        this.typeReview = typeReview;
    }

    public int getIdTypeRating() {
        return idTypeRating;
    }

    public void setIdTypeRating(int idTypeRating) {
        this.idTypeRating = idTypeRating;
    }
}

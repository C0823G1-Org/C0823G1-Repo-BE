package model;

public class GameDTO {
    private String title;
    private double price;
    private String imageCoverUrl;

    public GameDTO(String title, double price, String url) {
        this.title = title;
        this.price = price;
        this.imageCoverUrl = url;
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

    public String getImageCoverUrl() {
        return imageCoverUrl;
    }

    public void setImageCoverUrl(String imageCoverUrl) {
        this.imageCoverUrl = imageCoverUrl;
    }

    @Override
    public String toString() {
        return "GameDTO{" +
                "title='" + title + '\'' +
                ", price=" + price +
                ", imageCoverUrl='" + imageCoverUrl + '\'' +
                '}';
    }
}

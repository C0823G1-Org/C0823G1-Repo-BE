package model;

public class GameDTO {
    private String name;
    private String title;
    private double price;
    private String url;
    private String videoUrl;
    private String tagGame;
    private String percentDiscount;
    private String rating;

    public GameDTO(String title, double price, String url, String tagGame) {
        this.title = title;
        this.price = price;
        this.url = url;
        this.tagGame = tagGame;
    }

    public GameDTO(String name, double price, String url, String videoUrl , String percentDiscount, String rating) {
        this.name = name;
        this.videoUrl = videoUrl;
        this.price = price;
        this.url = url;
        this.percentDiscount = percentDiscount;
        this.rating = rating;
    }
    public String getName() {
        return name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    private String imageCoverUrl;
    private int gameId;

    public GameDTO(String title, double price, String url) {
        this.title = title;
        this.price = price;
        this.url = url;
    }

    public GameDTO(String title, double price, String imageCoverUrl, int gameId) {
        this.title = title;
        this.price = price;
        this.imageCoverUrl = imageCoverUrl;
        this.gameId = gameId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getTagGame() {
        return tagGame;
    }

    public void setTagGame(String tagGame) {
        this.tagGame = tagGame;
    }

    public String getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(String percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public void setName(String name) {
        this.name = name;
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
                ", url='" + url + '\'' +
                ", tagGame='" + tagGame + '\'' +
                '}';
    }
}

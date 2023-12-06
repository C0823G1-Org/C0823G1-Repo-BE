package model;

public class Dto {
String url ;
public void Dto(Image image){
    this.url = image.getUrl();
}

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}

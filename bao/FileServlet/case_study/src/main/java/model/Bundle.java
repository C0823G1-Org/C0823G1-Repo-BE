package model;

public class Bundle {
    private int idBundle;
    private String price;

    public Bundle() {
    }

    public Bundle(int idBundle, String price) {
        this.idBundle = idBundle;
        this.price = price;
    }

    public int getIdBundle() {
        return idBundle;
    }

    public void setIdBundle(int idBundle) {
        this.idBundle = idBundle;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}

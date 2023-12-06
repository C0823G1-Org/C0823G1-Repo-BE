package model;

public class Image {
    private int id;
    private String url;
    private boolean isDelete;
    private int idGame;
    private int idTypeImg;

    public Image() {
    }

    public Image(String url, boolean isDelete, int idGame, int idTypeImg) {
        this.url = url;
        this.isDelete = isDelete;
        this.idGame = idGame;
        this.idTypeImg = idTypeImg;
    }

    public Image(int id, String url, boolean isDelete, int idGame, int idTypeImg) {
        this.id = id;
        this.url = url;
        this.isDelete = isDelete;
        this.idGame = idGame;
        this.idTypeImg = idTypeImg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public int getIdTypeImg() {
        return idTypeImg;
    }
    public void setIdTypeImg(int idTypeImg) {
        this.idTypeImg = idTypeImg;
    }

    @Override
    public String toString() {
        return url;
    }
}


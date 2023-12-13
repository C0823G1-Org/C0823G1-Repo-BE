package model;

public class Video {
    private int id;
    private String url;
    private boolean isDelete;
    private int idGame;

    public Video() {
    }

    public Video(String url, int idGame) {
        this.url = url;
        this.idGame = idGame;
    }

    public Video(int id, String url, boolean isDelete, int idGame) {
        this.id = id;
        this.url = url;
        this.isDelete = isDelete;
        this.idGame = idGame;
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
}

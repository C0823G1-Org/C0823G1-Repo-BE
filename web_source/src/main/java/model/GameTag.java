package model;

public class GameTag {
    private int idGame;
    private int idTag;

    public GameTag() {
    }

    public GameTag(int idGame, int idTag) {
        this.idGame = idGame;
        this.idTag = idTag;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public int getIdTag() {
        return idTag;
    }

    public void setIdTag(int idTag) {
        this.idTag = idTag;
    }
}

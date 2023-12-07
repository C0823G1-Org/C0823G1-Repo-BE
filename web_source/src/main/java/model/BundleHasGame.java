package model;

public class BundleHasGame {
    private int idGame;
    private int idBundle;

    public BundleHasGame() {
    }

    public BundleHasGame(int idGame, int idBundle) {
        this.idGame = idGame;
        this.idBundle = idBundle;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public int getIdBundle() {
        return idBundle;
    }

    public void setIdBundle(int idBundle) {
        this.idBundle = idBundle;
    }
}

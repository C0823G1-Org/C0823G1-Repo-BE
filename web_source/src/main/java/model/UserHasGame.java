package model;

public class UserHasGame {
    private int id;
    private int idGame;
    private boolean isDelete;
    private boolean isBought;

    public UserHasGame() {

    }

    public UserHasGame(int idGame, boolean isDelete, boolean isBought) {
        this.idGame = idGame;
        this.isDelete = isDelete;
        this.isBought = isBought;
    }

    public UserHasGame(int id, int idGame, boolean isDelete, boolean isBought) {
        this.id = id;
        this.idGame = idGame;
        this.isDelete = isDelete;
        this.isBought = isBought;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }

    public boolean isBought() {
        return isBought;
    }

    public void setBought(boolean bought) {
        isBought = bought;
    }
}

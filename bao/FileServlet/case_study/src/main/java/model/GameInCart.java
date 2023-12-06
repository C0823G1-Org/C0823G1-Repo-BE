package model;

public class GameInCart {
    private int idCart;
    private int idGame;
    private int amount;
    private boolean isDelete;

    public GameInCart() {
    }

    public GameInCart(int idCart, int idGame, int amount, boolean isDelete) {
        this.idCart = idCart;
        this.idGame = idGame;
        this.amount = amount;
        this.isDelete = isDelete;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }
}

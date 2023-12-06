package model;

public class Cart {
    private int cart;
    private int idUser;

    public Cart() {
    }

    public Cart(int cart, int idUser) {
        this.cart = cart;
        this.idUser = idUser;
    }

    public int getCart() {
        return cart;
    }

    public void setCart(int cart) {
        this.cart = cart;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}

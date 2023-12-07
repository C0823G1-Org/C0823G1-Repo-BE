package service;

import model.GameDTO;

import java.util.List;

public interface IGameService {
    public int count (String txtSearch);
    List<GameDTO> search(String txtSearch, int index, int size);
    void addToCart(int userId, int gameId);

    List<GameDTO> getCartGames(int userId);

    void removeCartItem(int userId, int gameId);
}

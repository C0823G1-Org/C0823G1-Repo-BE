package service;

import model.Game;

import java.util.List;

public interface IGameService {
    public int count (String txtSearch);
    List<Game> search(String txtSearch, int index, int size);

    void addToCart(int userId, int gameId);

    List<Game> getCartGames(int userId);
}

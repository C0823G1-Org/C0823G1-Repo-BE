package service;

import model.Game;

import java.util.List;

public interface IGameService {
    public int count (String txtSearch);

    void addToCart(int userId, int gameId);

    List<Game> getCartGames(int userId);
}

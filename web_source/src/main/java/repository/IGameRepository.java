package repository;

import model.Game;

import java.util.List;

public interface IGameRepository {
    public int count (String txtSearch);

    void addToCart(int userId, int gameId);

    List<Game> getCartGames(int userId);
}

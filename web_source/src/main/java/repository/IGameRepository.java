package repository;

import model.Game;

import java.util.List;

public interface IGameRepository {
    public int count (String txtSearch);
    List<Game> search(String txtSearch, int index, int size);

    void addToCart(int userId, int gameId);

    List<Game> getCartGames(int userId);
}

package repository;

import model.Game;
import model.GameDTO;

import java.util.List;

public interface IGameRepository {
    public int count (String txtSearch);
    List<GameDTO> search(String txtSearch, int index, int size);

    void addToCart(int userId, int gameId);

    List<Game> getCartGames(int userId);
}

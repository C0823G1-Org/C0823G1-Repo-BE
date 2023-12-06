package service;

import model.Game;
import repository.GameRepository;
import repository.IGameRepository;

import java.util.List;

public class GameService implements IGameService {
    private final IGameRepository gameRepository = new GameRepository();

    @Override
    public int count(String txtSearch) {
        return gameRepository.count(txtSearch);
    }

    @Override
    public void addToCart(int userId, int gameId) {
        gameRepository.addToCart(userId,gameId);
    }

    @Override
    public List<Game> getCartGames(int userId) {
        return gameRepository.getCartGames(userId);
    }
}

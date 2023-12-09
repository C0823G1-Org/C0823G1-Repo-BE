package service;

import model.GameDTO;
import repository.GameRepositoryLam;
import repository.IGameRepository;

public class GameServiceLam extends GameService{
    private final IGameRepository repositoryLam = new GameRepositoryLam();
    @Override
    public GameDTO getGameForCart(int gameId) {
        return repositoryLam.getGameForCart(gameId);
    }
}

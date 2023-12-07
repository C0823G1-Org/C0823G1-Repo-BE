package service;

import model.GameDTO;
import model.UserAccount;
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
    public List<GameDTO> search(String txtSearch, int index, int size) {
        return gameRepository.search(txtSearch,index,size);
    }

    @Override
    public void createAccount(UserAccount userAccount) {
        gameRepository.createAccount(userAccount);
    }

    @Override
    public List<GameDTO> getCartGames(int userId) {
        return gameRepository.getCartGames(userId);
    }

}

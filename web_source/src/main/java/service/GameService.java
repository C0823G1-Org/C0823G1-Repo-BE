package service;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;
import repository.GameRepository;
import repository.IGameRepository;

import java.util.List;

public class GameService implements IGameService {
    private final IGameRepository gameRepository = new GameRepository();

    @Override
    public List<GameDTO> getAll() {
        return gameRepository.getAll();
    }

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
    public UserDto getUserInfo(UserAccount userAccount) {
        return this.gameRepository.getUserInfo(userAccount);
        }

    @Override
    public void addToCart(int userId, int gameId) {
        gameRepository.addToCart(userId,gameId);
    }

    public List<GameDTO> getCartGames(int userId) {
        return gameRepository.getCartGames(userId);
    }

    @Override
    public void removeCartItem(int userId, int gameId) {
        gameRepository.removeCartItem(userId,gameId);
    }
}

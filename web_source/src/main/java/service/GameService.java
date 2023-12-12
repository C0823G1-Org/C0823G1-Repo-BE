package service;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;
import repository.GameRepository;
import repository.GameRepositoryVi;
import repository.IGameRepository;

import java.util.List;

public class GameService implements IGameService {

    private final IGameRepository gameRepository = new GameRepository();
    private final IGameRepository gameRepositoryVi = new GameRepositoryVi();

    @Override
    public List<GameDTO> getAll() {
        return gameRepository.getAll();
    }

    @Override
    public int count(String txtSearch) {
        return gameRepository.count(txtSearch);
    }

    public int countCatelogy(String txtSearch) {
        return gameRepository.countCatelogy(txtSearch);
    }

    @Override
    public List<GameDTO> search(String txtSearch, int index, int size) {
        return gameRepository.search(txtSearch,index,size);
    }

    @Override
    public List<GameDTO> searchCatelogy(String txtSearch, int index) {
        return gameRepository.searchCatelogy(txtSearch,index);
    }

    @Override
    public boolean createAccount(UserAccount userAccount) {
        return gameRepository.createAccount(userAccount);
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

    @Override
    public boolean createUser(String email, String date, String name) {
        return gameRepository.createUser(email, date, name);
    }

    @Override
    public GameDTO getGameForCart(int gameId) {
        return null;
    }

    @Override
    public boolean findDuplicate(String email) {
        return gameRepositoryVi.findDuplicate(email);
    }

    @Override
    public List<UserDto> showAllUsers() {
        return gameRepositoryVi.showAllUsers();
    }
}

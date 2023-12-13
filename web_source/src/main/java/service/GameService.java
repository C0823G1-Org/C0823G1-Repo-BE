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
    public List<GameDTO> search(String txtSearch, int index) {
        return gameRepository.search(txtSearch,index);
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
    public boolean createUser(String name, String date, String email) {
        return gameRepository.createUser(name, date, email);
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
    public List<GameDTO> tagGame(int idGame) {
        return gameRepository.tagGame(idGame);
    }


    @Override
    public GameDTO detailGame(String title) {
        return gameRepository.detailGame(title);
    }

    @Override
    public List<UserDto> showAllUsers() {
        return gameRepositoryVi.showAllUsers();
    }

    @Override
    public UserDto findUserId(int userId) {
        return gameRepositoryVi.findUserId(userId);
    }

    @Override
    public boolean removeUser(int userId) {
        return gameRepositoryVi.removeUser(userId);
    }

    @Override
    public boolean editUser(UserDto user) {
        return gameRepositoryVi.editUser(user);
    }
}

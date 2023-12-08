package repository;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.util.List;

public interface IGameRepository {
    public int count (String txtSearch);
    List<GameDTO> search(String txtSearch, int index, int size);
    void createAccount(UserAccount userAccount);
    UserDto getUserInfo(UserAccount userAccount);

    void addToCart(int userId, int gameId);

    List<GameDTO> getCartGames(int userId);

    void removeCartItem(int userId, int gameId);
}

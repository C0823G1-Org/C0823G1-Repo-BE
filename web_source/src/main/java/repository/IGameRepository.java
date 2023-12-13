package repository;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.util.List;

public interface IGameRepository {
    List<GameDTO> getAll();

    public int count(String txtSearch);

    public int countCatelogy(String txtSearch);

    List<GameDTO> search(String txtSearch, int index, int size);

    List<GameDTO> searchCatelogy(String txtSearch, int index);

    boolean createAccount(UserAccount userAccount);

    UserDto getUserInfo(UserAccount userAccount);

    void addToCart(int userId, int gameId);

    List<GameDTO> getCartGames(int userId);

    void removeCartItem(int userId, int gameId);

    boolean createUser(String name, String date, String email);

    GameDTO getGameForCart(int gameId);
    boolean findDuplicate(String email);
    List<UserDto> showAllUsers();
    UserDto findUserId(int userId);
    boolean removeUser(int userId);
    boolean editUser(UserDto user);
}


package service;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface IGameService {
    List<GameDTO> getAll();

    public int count(String txtSearch);

    public int countCatelogy(String txtSearch);

    List<GameDTO> search(String txtSearch, int index);

    List<GameDTO> searchCatelogy(String txtSearch, int index);

    boolean createAccount(UserAccount userAccount);

    UserDto getUserInfo(UserAccount userAccount);

    void addToCart(int userId, int gameId);

    List<GameDTO> getCartGames(int userId);

    void removeCartItem(int userId, int gameId);

    boolean createUser(String name, String date, String email);

    GameDTO getGameForCart(int gameId);

    boolean findDuplicate(String email);

        List<GameDTO> tagGame(int idGame);

    GameDTO detailGame(String title);
}

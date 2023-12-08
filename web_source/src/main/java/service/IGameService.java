package service;

import model.UserDto;
import model.GameDTO;
import model.UserAccount;

import java.util.List;

public interface IGameService {
    public int count (String txtSearch);
    List<GameDTO> search(String txtSearch, int index, int size);
    void createAccount(UserAccount userAccount);
    UserDto getUserInfo(UserAccount userAccount);
}

package service;

import model.GameAddDTO;
import repository.GameRepositoryKiet;
import repository.IGameRepositoryKiet;

public class GameServiceKiet implements IGameServiceKiet {

    private IGameRepositoryKiet gameRepositoryKiet = new GameRepositoryKiet();


    @Override
    public void insertGameAdminDTO(GameAddDTO gameAddDTO) {
         gameRepositoryKiet.insertGameAdminDTO(gameAddDTO);
    }
}

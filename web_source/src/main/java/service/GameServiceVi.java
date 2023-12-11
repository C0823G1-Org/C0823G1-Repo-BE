package service;

import repository.GameRepositoryVi;
import repository.IGameRepository;

public class GameServiceVi extends GameService{
    private IGameRepository gameRepositoryVi = new GameRepositoryVi();


}

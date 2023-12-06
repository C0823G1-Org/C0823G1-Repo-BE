package service;

import repository.GameRepository;
import repository.IGameRepository;

public class GameService implements IGameService {
    private final IGameRepository iGameRepository = new GameRepository();

    @Override
    public int count(String txtSearch) {
        return iGameRepository.count(txtSearch);
    }
}

package service;

import model.BundleHasGame;
import model.GameAddDTO;
import model.Image;
import model.Video;
import repository.GameRepositoryKiet;
import repository.IGameRepositoryKiet;

public class GameServiceKiet implements IGameServiceKiet {

    private IGameRepositoryKiet gameRepositoryKiet = new GameRepositoryKiet();


    @Override
    public void insertGameAdminDTO(GameAddDTO gameAddDTO) {
        gameRepositoryKiet.insertGameAdminDTO(gameAddDTO);
    }

    @Override
    public void insertVideo(Video video) {
        gameRepositoryKiet.insertVideo(video);
    }

    @Override
    public void insertImage(Image image) {
        gameRepositoryKiet.insertImage(image);
    }

    @Override
    public void insertBundle(BundleHasGame bundleHasGame) {
        gameRepositoryKiet.insertBundle(bundleHasGame);
    }

    @Override
    public GameAddDTO selectUser(String id) {
        return gameRepositoryKiet.selectUser(id);
    }
}

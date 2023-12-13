package service;

import model.BundleHasGame;
import model.GameAddDTO;
import model.Image;
import model.Video;

public interface IGameServiceKiet {
    void insertGameAdminDTO(GameAddDTO gameAddDTO);

    void insertVideo(Video video);

    void insertImage(Image image);
    void insertBundle(BundleHasGame bundleHasGame);

    GameAddDTO selectUser(String id);
}

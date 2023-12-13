package repository;

import model.*;

public interface IGameRepositoryKiet {
    void insertGameAdminDTO(GameAddDTO gameAddDTO);

    void insertImage(Image image);

    void insertVideo(Video video);

    void insertBundle(BundleHasGame bundleHasGame);

    GameAddDTO selectUser(String id);

    boolean update(GameAddDTO gameAddDTO);
}

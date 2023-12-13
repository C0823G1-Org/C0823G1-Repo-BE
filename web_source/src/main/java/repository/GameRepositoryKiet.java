package repository;

import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameRepositoryKiet implements IGameRepositoryKiet {

    private static final String INSERT_GAME = "insert into game (game_id,game_title,price,description,age_requirement,developer_id,release_date,dlc_id,review_rating_id,`minium_system_requirement`,`recommend_system_requirement`)" +
            "values (?,?,?,?,?,?,?,?,?,?,?);";

    private static final String SELECT_FROM_DEVELOPER = "select * from developer";

    private static final String SELECT_FROM_REVIEW = "select *  from review_rating";

    private static final String INSERT_BUNDLE = "insert into bundle_has_game(game_id,bundle_id) values (?,?);";

    private static final String INSERT_IMAGE = "insert into image (url,game_game_id,image_type_image_type_id) values (?,?,1);";

    private static final String INSERT_VIDEO = "insert into video(url,game_game_id) values(?,?);";

    private static final String SELECT_ID_BY_CODE = "select game_id from game where price = ?";


    private static final String UPDATE_GAME = "call update_all(?,?,?,?,?,?,?,?,?,?,?)";

    private static final String SELECT_GAME_BY_NAME = "select * from game where game_title = ? ;";

    @Override
    public void insertGameAdminDTO(GameAddDTO gameAddDTO) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_GAME);
            preparedStatement.setInt(1, gameAddDTO.getId());
            preparedStatement.setString(2, gameAddDTO.getTitle());
            preparedStatement.setDouble(3, gameAddDTO.getPrice());
            preparedStatement.setString(4, gameAddDTO.getDescription());
            preparedStatement.setInt(5, gameAddDTO.getAgeRequirement());
            preparedStatement.setInt(6, gameAddDTO.getDeveloperId());
            preparedStatement.setString(7, gameAddDTO.getReleaseDate());
            preparedStatement.setInt(8, gameAddDTO.getDlcId());
            preparedStatement.setInt(9, gameAddDTO.getReviewRatingId());
            preparedStatement.setString(10, gameAddDTO.getMiniumSystemRequirement());
            preparedStatement.setString(11, gameAddDTO.getDescription());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertImage(Image image) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_IMAGE);
            preparedStatement.setString(1, image.getUrl());
            preparedStatement.setInt(2, image.getIdGame());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertVideo(Video video) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VIDEO);
            preparedStatement.setString(1, video.getUrl());
            preparedStatement.setInt(2, video.getIdGame());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertBundle(BundleHasGame bundleHasGame) {
        Connection connection = BaseGameRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BUNDLE);
            preparedStatement.setInt(1, bundleHasGame.getIdGame());
            preparedStatement.setInt(2, bundleHasGame.getIdBundle());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public GameAddDTO selectUser(String name) {
        GameAddDTO gameAddDTO = null;
        try {
            Connection connection = BaseGameRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GAME_BY_NAME);
            preparedStatement.setString(1, name);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("game_id");
                String title = resultSet.getString("game_id");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                int ageRequirement = resultSet.getInt("age_requirement");
                int developerId = resultSet.getInt("developer_id");
                String releaseDate = resultSet.getString("release_date");
                int dlcId = resultSet.getInt("dlc_id");
                int reviewRatingId = resultSet.getInt("review_rating_id");
                String miniumSystemRequirement = resultSet.getString("minium_system_requirement");
                String recommendSystemRequirement = resultSet.getString("recommend_system_requirement");
                gameAddDTO = new GameAddDTO(id, title, price, description, ageRequirement, developerId, releaseDate,
                        dlcId, reviewRatingId, miniumSystemRequirement, recommendSystemRequirement);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return gameAddDTO;
    }

    @Override
    public boolean update(GameAddDTO gameAddDTO) {
        boolean rowUpdated;
        try {
            Connection connection = BaseGameRepository.getConnection();
            CallableStatement callableStatement = connection.prepareCall(UPDATE_GAME);
            callableStatement.setInt(1, gameAddDTO.getId());
            callableStatement.setString(2, gameAddDTO.getTitle());
            callableStatement.setDouble(3, gameAddDTO.getPrice());
            callableStatement.setString(4, gameAddDTO.getDescription());
            callableStatement.setInt(5, gameAddDTO.getAgeRequirement());
            callableStatement.setInt(6, gameAddDTO.getDeveloperId());
            callableStatement.setString(7, gameAddDTO.getReleaseDate());
            callableStatement.setInt(8, gameAddDTO.getDlcId());
            callableStatement.setInt(9, gameAddDTO.getReviewRatingId());
            callableStatement.setString(10, gameAddDTO.getMiniumSystemRequirement());
            callableStatement.setString(11, gameAddDTO.getDescription());
            rowUpdated = callableStatement.executeUpdate() > 0;
            callableStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }


}

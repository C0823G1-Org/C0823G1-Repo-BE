package repository;

import model.Developer;
import model.GameAddDTO;
import model.GameDTO;
import model.ReviewRating;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameRepositoryKiet implements IGameRepositoryKiet {

    private static final String INSERT_GAME = "insert into game (game_id,game_title,price,description,age_requirement,developer_id,release_date,dlc_id,review_rating_id,`minium_system_requirement`,`recommend_system_requirement`)" +
            "values (?,?,?,?,?,?,?,?,?,?,?);";

    private static final String SELECT_FROM_DEVELOPER = "select * from developer";

    private static final String SELECT_FROM_REVIEW = "select *  from review_rating";

    private static final String INSERT_IMAGE = "insert into image (url,game_game_id,image_type_image_type_id) values (?,?,1);";

    private static final String SELECT_ID_BY_CODE = "select game_id from game where price = ?";

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

    public int getIdByCode(String code) {
        Connection connection = BaseGameRepository.getConnection();
        int id;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID_BY_CODE);
            preparedStatement.setString(1, code);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("game_id");
            } else {
                id = -1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
}
